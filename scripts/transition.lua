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
  local new_entities = {}
  local cache = entity_cache.get()
  for _, e in pairs(cache.multi_furnaces) do
    local table = transition_table[e.name]
    if not table then goto continue end

    local current_recipe = e.get_recipe()
    local previous_recipe = e.previous_recipe
    if current_recipe then current_recipe = current_recipe.name end
    if previous_recipe then previous_recipe = previous_recipe.name end

    local transition = nil
    local transitions = nil
    for _, entry in pairs(table) do
      local type = entry.type
      local recipe = entry.recipe
      -- TODO: previous_recipe is set only when not crafting. Need to store data till next
      -- frame and swap then.
      if type == "construction" or
          (type == "immediate" and
          ((not recipe and current_recipe) or (recipe and recipe == current_recipe))) or
          (type == "completion" and e.products_finished > 0 and
          (not recipe or (recipe and recipe == previous_recipe))) then
        transition = entry.transition
        transitions = entry.transitions
        if transition or transitions then
          break
        end
      end
    end

    if transitions then
      transition = transitions[math.random(#transitions)]
    end
    if transition then
      local ingredients = {}
      local recipe = e.get_recipe()
      if recipe then ingredients = recipe.ingredients end
      local new_entity = fast_replace(e, transition, false)
      if new_entity then
        new_entities[#new_entities + 1] = new_entity
        for _, v in ipairs(ingredients) do
          if ingredients.type == "item" then
            new_entity.insert({name = v.name, count = v.amount})
          elseif ingredients.type == "fluid" then
            new_entity.insert_fluid(v)
          end
        end
      end
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