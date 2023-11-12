local transition_table = require("__Ultracube__/scripts/transition_table")
local cube_search = require("__Ultracube__/scripts/cube_search")
local entity_cache = require("__Ultracube__/scripts/entity_cache")

local function fast_replace(e, name, spill)
  entity_cache.remove(e)
  cube_search.remove_entity(e)
  local opened_players = {}
  for k, player in pairs(game.players) do
    if player.opened == e then
      player.opened = nil
      opened_players[k] = player
    end
  end
  local new_entity = e.surface.create_entity {
    name = name,
    position = e.position,
    direction = e.direction,
    force = e.force,
    fast_replace = true,
    spill = spill,
    create_build_effect_smoke = false,
  }
  if new_entity then
    for _, player in pairs(opened_players) do
      player.opened = new_entity
    end
    return new_entity
  elseif e.valid then
    return e
  end
  return nil
end

local transition = {}

function transition.tick(tick)
  local state = global.transition_state
  if not state then
    global.transition_state = {}
    state = global.transition_state
  end

  local cache = entity_cache.get()
  for k, _ in pairs(state) do
    if not cache.multi_furnaces[k] then
      state[k] = nil
    end
  end

  local new_entities = {}
  for _, e in pairs(cache.multi_furnaces) do
    local table = transition_table[e.name]
    if not table then goto continue end

    local e_state = state[e.unit_number]
    local crafts = e.products_finished
    local recipe = e.get_recipe()
    if recipe then recipe = recipe.name end

    local transition = nil
    local transitions = nil
    local type = nil
    for _, entry in pairs(table) do
      type = entry.type
      local transition_recipe = entry.recipe
      -- TODO: rewrite all this to just store state in lua and insert products manually into the output.
      if type == "construction" or
          (type == "immediate" and e.crafting_progress > 0.5 and
          ((not transition_recipe and recipe) or (transition_recipe and recipe == transition_recipe))) or
          (type == "completion" and e_state and crafts > e_state.crafts and
          (not transition_recipe or (transition_recipe and e_state.recipe == transition_recipe))) then
        transition = entry.transition
        transitions = entry.transitions
        if transition or transitions then
          state[e.unit_number] = nil
          break
        end
      end
    end

    if transitions then
      transition = transitions[math.random(#transitions)]
    end
    if transition then
      state[e.unit_number] = nil
      local ingredients = {}
      local recipe = e.get_recipe()
      if recipe and type == "completion" then ingredients = recipe.ingredients end
      local new_entity = fast_replace(e, transition, false)
      if new_entity then
        new_entities[#new_entities + 1] = new_entity
        for _, v in ipairs(ingredients) do
          if ingredients.type == "fluid" then
            new_entity.insert_fluid(v)
          else
            new_entity.insert({name = v.name, count = v.amount})
          end
        end
      end
    else
      state[e.unit_number] = {recipe = recipe, crafts = crafts}
    end
    ::continue::
  end

  for _, e in pairs(cache.reactors) do
    local new_entity = nil
    if e.name == "cube-nuclear-reactor" and e.temperature > 100 and not e.burner.currently_burning then
      new_entity = fast_replace(e, "cube-nuclear-reactor-online", true)
    elseif e.name == "cube-nuclear-reactor-online" and e.temperature < 100 and not e.burner.currently_burning then
      new_entity = fast_replace(e, "cube-nuclear-reactor", true)
    end
    if new_entity then
      new_entities[#new_entities + 1] = new_entity
    end
  end
  for _, e in ipairs(new_entities) do
    entity_cache.add(e)
  end
end

return transition