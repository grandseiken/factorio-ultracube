local activation = require("__Ultracube__/scripts/activation")
local transition_table = require("__Ultracube__/scripts/transition_table")
local cube_search = require("__Ultracube__/scripts/cube_search")
local entity_cache = require("__Ultracube__/scripts/entity_cache")
local set_active = activation.set

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

local function get_products(entry)
  if not entry then
    return nil
  end
  if entry.product then
    return {entry.product}
  elseif entry.products then
    return entry.products
  elseif entry.product_recipe then
    return game.recipe_prototypes[entry.product_recipe].products
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

  for _, e in pairs(cache.multi_furnaces) do
    local table = transition_table[e.name]
    if not table then goto continue end

    local e_state = state[e.unit_number]
    if not e_state then
      e_state = {}
      state[e.unit_number] = e_state
    end
    if not e_state.state then
      if table.initial_state then
        e_state.state = table.initial_state
      elseif table.initial_states then
        e_state.state = table.initial_states[math.random(#table.initial_states)]
      end
    end

    table = table.transitions[e_state.state]
    if not table then goto continue end
    local crafts = e.products_finished
    local recipe = e.get_recipe()
    if recipe then recipe = recipe.name end

    local products = nil
    if e_state.crafts and e_state.recipe and crafts > e_state.crafts then
      local t = table[e_state.recipe]
      if t then
        if t.state then
          e_state.state = t.state
        elseif t.states then
          e_state.state = t.states[math.random(#t.states)]
        end
        products = get_products(t)
      end
    elseif e_state.recipe and e.crafting_progress >= 1 then
      local potential_products = get_products(table[e_state.recipe])
      local active = true
      if potential_products then
        local inventory = e.get_output_inventory()
        for _, product in pairs(potential_products) do
          if not inventory.can_insert({name = product.name, count = product.amount}) then
            active = false
            break
          end
        end
      end
      set_active(e, "multi", active)
    end
    e_state.crafts = crafts
    e_state.recipe = recipe

    if products then
      local inventory = e.get_output_inventory()
      for _, product in pairs(products) do
        inventory.insert({name = product.name, count = product.amount})
      end
    end
    ::continue::
  end

  local new_entities = {}
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