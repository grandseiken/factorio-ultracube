local activation = require("__Ultracube__/scripts/activation")
local transition_table = require("__Ultracube__/scripts/transition_table")
local entity_cache = require("__Ultracube__/scripts/entity_cache")
local set_active = activation.set

local function get_products(e_state, entry)
  if not entry then
    return nil
  end
  if entry.product_recipe then
    return game.recipe_prototypes[entry.product_recipe].products
  elseif e_state.random_product then
    return e_state.random_product
  elseif entry.random_products then
    local random_products = entry.random_products
    local product = random_products[math.random(#random_products)]
    e_state.random_product = product
    return product
  elseif entry.products then
    return entry.products
  elseif entry.product then
    return {entry.product}
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
    local table
    if e.name == "cube-quantum-decoder" and e.force.technologies["cube-quantum-entanglement"].researched then
      table = transition_table["cube-quantum-decoder-1"]
    else
      table = transition_table[e.name]
    end
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
        products = get_products(e_state, t)
      end
    elseif e_state.recipe and e.crafting_progress >= 1 then
      local potential_products = get_products(e_state, table[e_state.recipe])
      local active = true
      if potential_products then
        local inventory = e.get_output_inventory()
        for _, product in ipairs(potential_products) do
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
    e_state.random_product = nil

    if products then
      local inventory = e.get_output_inventory()
      for _, product in pairs(products) do
        inventory.insert({name = product.name, count = product.amount})
      end
    end
    ::continue::
  end
end

return transition