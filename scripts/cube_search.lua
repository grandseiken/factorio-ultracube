require("__Ultracube__/scripts/lib")
require("__Ultracube__/scripts/entity_cache")

local cube_ultradense = cubes.ultradense
local cube_dormant = cubes.dormant
local cube_ultradense_phantom = cubes.ultradense_phantom
local cube_dormant_phantom = cubes.dormant_phantom

local transport_line_entity_types = entity_types.transport_line
local inventory_entity_types = entity_types.inventory
local vehicle_entity_types = entity_types.vehicle

local is_cube_crafter = is_cube_crafter
local is_cube_burner = is_cube_burner

local cube_search_data = nil
local max_search_result_weight = 64
local search_result_weight = {
  [cube_ultradense] = 64,
  [cube_dormant] = 64,
  [cube_ultradense_phantom] = 1,
  [cube_dormant_phantom] = 1,
}

function refresh_cube_search_data()
  global.cube_search_data = {
    last_tick = nil,
    last_entity = nil,
    last_position = nil,
    last_surface_index = nil,
    search_results = {},
  }
  cube_search_data = global.cube_search_data
end

function cube_search_data_on_load()
  cube_search_data = global.cube_search_data
end

local function add_result(result_set, item, count, entity)
  local total_weight = count * search_result_weight[item]
  if #result_set > 0 then
    total_weight = total_weight + result_set[#result_set].total_weight
  end
  result_set[#result_set + 1] = {
    item = item,
    count = count,
    entity = entity,
    unit_number = entity.unit_number,
    total_weight = total_weight,
  }
  if total_weight >= max_search_result_weight then
    return true
  end
  return false
end

local function check_ingredients(entity, ingredients, result_set)
  local count = ingredients[cube_ultradense]
  if count > 0 then
    if add_result(result_set, cube_ultradense, count, entity) then return true end
  end
  count = ingredients[cube_dormant]
  if count > 0 then
    if add_result(result_set, cube_dormant, count, entity) then return true end
  end
  return false
end

local function check_inventory(entity, inventory, result_set)
  local count = inventory.get_item_count(cube_ultradense)
  if count > 0 then
    if add_result(result_set, cube_ultradense, count, entity) then return true end
  end
  count = inventory.get_item_count(cube_dormant)
  if count > 0 then
    if add_result(result_set, cube_dormant, count, entity) then return true end
  end
  return false
end

local function check_stack(entity, stack, result_set)
  local item = stack.name
  if item == cube_ultradense then
    if add_result(result_set, cube_ultradense, stack.count, entity) then return true end
  end
  if item == cube_dormant then
    if add_result(result_set, cube_dormant, stack.count, entity) then return true end
  end
  return false
end

local function check_burner(entity, result_set)
  if is_entity_burning_fuel(entity, cube_ultradense) then
    if add_result(result_set, cube_ultradense, 1, entity) then return true end
  end
  local inventory = entity.get_fuel_inventory()
  if inventory then
    local count = inventory.get_item_count(cube_ultradense)
    if count > 0 then
      if add_result(result_set, cube_ultradense, count, entity) then return true end
    end
  end
  inventory = entity.get_burnt_result_inventory()
  if inventory then
    local count = inventory.get_item_count(cube_dormant)
    if count > 0 then
      if add_result(result_set, cube_dormant, count, entity) then return true end
    end
  end
  return false
end

local function cube_check_entity(entity, result_set)
  local entity_type = entity.type
  if entity_type == "character" then
    local player = entity.player
    if entity.player then
      if check_ingredients(entity, player_cube_data(player).ingredients, result_set) then return true end
    end
  end

  if transport_line_entity_types[entity_type] then
    for i = 1, entity.get_max_transport_line_index() do
      if check_inventory(entity, entity.get_transport_line(i), result_set) then return true end
    end
  end

  if entity_type == "inserter" and entity.held_stack.valid_for_read and check_stack(entity, entity.held_stack, result_set) then
    return true
  end

  if vehicle_entity_types[entity_type] then
    local inventory = nil
    if entity_type == "cargo-wagon" then
      inventory = entity.get_inventory(defines.inventory.cargo_wagon)
    elseif entity_type == "car" then
      inventory = entity.get_inventory(defines.inventory.car_trunk)
    elseif entity_type == "spider-vehicle" then
      inventory = entity.get_inventory(defines.inventory.spider_trunk)
    end
    if check_inventory(entity, inventory, result_set) then return true end
  end

  if is_cube_crafter(entity) then
    local recipes = cube_recipes()
    if entity.is_crafting() then
      local recipe_data = recipes[entity.get_recipe().name]
      if recipe_data and check_ingredients(entity, recipe_data.ingredients, result_set) then return true end
    end
    local inventory = entity.get_inventory(defines.inventory.furnace_source)
    if inventory and check_inventory(entity, inventory, result_set) then return true end
    inventory = entity.get_inventory(defines.inventory.assembling_machine_input)
    if inventory and check_inventory(entity, inventory, result_set) then return true end
    inventory = entity.get_output_inventory()
    if inventory and check_inventory(entity, inventory, result_set) then return true end
  end

  if (is_cube_burner(entity) or (vehicle_entity_types[entity_type] and entity_type ~= "cargo-wagon")) and
     check_burner(entity, result_set) then
    return true
  end

  if inventory_entity_types[entity_type] then
    local inventory = entity.get_inventory(defines.inventory.chest)
    if inventory and check_inventory(entity, inventory, result_set) then return true end
  end

  if entity_type == "item-entity" and check_stack(entity, entity.stack, result_set) then return true end
  return false
end

local function cube_search_transport_lines(result_set, cache)
  for _, e in pairs(cache.transport_lines) do
    for i = 1, e.get_max_transport_line_index() do
      if check_inventory(e, e.get_transport_line(i), result_set) then return true end
    end
  end
  return false
end

local function cube_search_inventories(result_set, cache)
  for _, e in pairs(cache.inventories) do
    local inventory = e.get_inventory(defines.inventory.chest)
    if inventory and check_inventory(e, inventory, result_set) then return true end
  end
  return false
end

local function cube_search_crafters(result_set, cache)
  local recipes = cube_recipes()
  for _, e in pairs(cache.cube_crafters) do
    if e.is_crafting() then
      local recipe_data = recipes[e.get_recipe().name]
      if recipe_data and check_ingredients(e, recipe_data.ingredients, result_set) then return true end
    end
    local inventory = e.get_inventory(defines.inventory.furnace_source)
    if inventory and check_inventory(e, inventory, result_set) then return true end
    inventory = e.get_inventory(defines.inventory.assembling_machine_input)
    if inventory and check_inventory(e, inventory, result_set) then return true end
    inventory = e.get_output_inventory()
    if inventory and check_inventory(e, inventory, result_set) then return true end
  end
  return false
end

local function cube_search_burners(result_set, cache)
  for _, e in pairs(cache.cube_burners) do
    if check_burner(e, result_set) then return true end
  end
  return false
end

local function cube_search_inserters(result_set, cache)
  for _, e in pairs(cache.inserters) do
    if e.held_stack.valid_for_read and check_stack(e, e.held_stack, result_set) then
      return true
    end
  end
  return false
end

local function cube_search_vehicles(result_set, cache)
  for _, e in pairs(cache.vehicles) do
    local entity_type = e.type
    local inventory = nil
    if entity_type == "cargo-wagon" then
      inventory = e.get_inventory(defines.inventory.cargo_wagon)
    elseif entity_type == "car" then
      inventory = e.get_inventory(defines.inventory.car_trunk)
    elseif entity_type == "spider-vehicle" then
      inventory = e.get_inventory(defines.inventory.spider_trunk)
    end
    if inventory and check_inventory(e, inventory, result_set) then return true end
    if entity_type ~= "cargo-wagon" and check_burner(e, result_set) then return true end
  end
  return false
end

local function cube_search_players(result_set)
  for _, player in pairs(game.players) do
    if player.character then
      if check_ingredients(player.character, player_cube_data(player).ingredients, result_set) then return true end
    end
  end
  return false
end

local function cube_search_ground(result_set, surface, area)
  if not surface or not surface.valid then
    return false
  end

  local find_result = surface.find_entities_filtered {
    area = area,
    type = "item-entity",
  }
  for _, e in ipairs(find_result) do
    if check_stack(e, e.stack, result_set) then return true end
  end
  find_result = surface.find_entities_filtered {
    area = area,
    type = {"construction-robot", "logistic-robot"}
  }
  for _, e in ipairs(find_result) do
    local inventory = e.get_inventory(defines.inventory.robot_cargo)
    if inventory and check_inventory(e, inventory, result_set) then return true end
  end
  return false
end

local function cube_search_full(result_set)
  local cache = get_entity_cache()
  if cube_search_players(result_set) then return true end
  if cube_search_vehicles(result_set, cache) then return true end
  if cube_search_inventories(result_set, cache) then return true end
  if cube_search_crafters(result_set, cache) then return true end
  if cube_search_burners(result_set, cache) then return true end
  if cube_search_inserters(result_set, cache) then return true end
  if cube_search_transport_lines(result_set, cache) then return true end
  for _, surface in pairs(game.surfaces) do
    if cube_search_ground(result_set, surface) then return true end
  end
  return false
end

local get_chunk_position = get_chunk_position
local get_chunk_index = get_chunk_index
local chunk_size = entity_cache_chunk_size
local local_search_offsets = {
  {x = 0, y = 0},
  {x = 1, y = 0},
  {x = -1, y = 0},
  {x = 0, y = 1},
  {x = 0, y = -1},
  {x = -1, y = -1},
  {x = -1, y = 1},
  {x = 1, y = -1},
  {x = 1, y = 1},
  {x = 2, y = 0},
  {x = -2, y = 0},
  {x = 0, y = 2},
  {x = 0, y = -2},
}

local function get_local_search_chunk_index(surface_index, x, y, i)
  local offset = local_search_offsets[i]
  return get_chunk_index(surface_index, x + offset.x, y + offset.y)
end

local function cube_search_local(result_set, surface_index, position)
  if cube_search_players(result_set) then return true end

  local cache = get_entity_cache()
  local chunk_map = cache.chunk_map
  local chunk_x, chunk_y = get_chunk_position(position)

  for i = 1, #local_search_offsets do
    local chunk_index = get_local_search_chunk_index(surface_index, chunk_x, chunk_y, i)
    local chunk_cache = chunk_map[chunk_index]
    if chunk_cache then
      if cube_search_transport_lines(result_set, chunk_cache) then return true end
      if cube_search_inserters(result_set, chunk_cache) then return true end
      if cube_search_crafters(result_set, chunk_cache) then return true end
      if cube_search_burners(result_set, chunk_cache) then return true end
      if cube_search_inventories(result_set, chunk_cache) then return true end
    end
    if i == 9 and cube_search_vehicles(result_set, cache) then return true end
  end
  local surface = game.surfaces[surface_index]
  local area = {
    left_top = {x = (chunk_x - 1) * chunk_size, y = (chunk_y - 1) * chunk_size},
    right_bottom = {x = (chunk_x + 2) * chunk_size, y = (chunk_y + 2) * chunk_size},
  }
  return cube_search_ground(result_set, surface, area)
end

local function fill_cube_search_result(result)
  local entity = result.entity
  local entity_type = entity.type

  result.surface = entity.surface
  result.position = entity.position
  result.height = 0
  if entity_type == "character" then
    result.height = 0.5
  end
  if entity_type == "logistic-robot" or entity_type == "construction-robot" then
    result.height = 1
    result.velocity = from_polar_orientation(0.05, entity.orientation)
  end
  if entity.effective_speed then
    result.velocity = from_polar(entity.effective_speed, entity.orientation)
  end
  if entity_type == "inserter" then
    result.position = entity.held_stack_position
  end
  if entity_type == "character" and entity.walking_state.walking then
    result.velocity = from_polar_orientation(entity.character_running_speed, entity.orientation)
  end
  if entity_type == "transport-belt" or
     entity_type == "splitter" or
     entity_type == "loader-1x1" then
    result.velocity = from_polar_orientation(entity.prototype.belt_speed, entity.orientation)
  end
  if entity_type == "underground-belt" then
    result.height = -1
  end
  if entity_type == "transport-belt" or
     entity_type == "underground-belt" or
     entity_type == "loader-1x1" then
    local v = from_polar_orientation(0.25, entity.orientation)
    local item = result.item
    for i = 1, entity.get_max_transport_line_index() do
      for _ = 1, entity.get_transport_line(i).get_item_count(item) do
        result.position = vector_add(result.position, i == 1 and {x = v.y, y = -v.x} or {x = -v.y, y = v.x})
      end
    end
  end
end

function cube_search_hint_entity(entity)
  if cube_check_entity(entity, {}) then
    cube_search_data.last_tick = nil
    cube_search_data.last_entity = entity
    cube_search_data.last_position = entity.position
    cube_search_data.last_surface_index = entity.surface_index
  end
end

-- TODO: try to make this work with multiple items. May as well go for it with 64 phantoms and see
-- how bad it is:
-- - Update add_result() to finish only when we have all cubes.
-- - Change to grid search rooted at all cells previously containing an item, expanding one step
--   at a time without checking a cell twice.
-- - Probably add a debug message if search doesn't complete to report bug.
function cube_search_update(tick)
  if cube_search_data.last_tick and tick <= cube_search_data.last_tick then
    return cube_search_data.search_results
  end
  local result_set = {}
  local done = false
  cube_search_data.search_results = result_set

  local last_entity = cube_search_data.last_entity
  if last_entity and last_entity.valid then
    done = cube_check_entity(last_entity, result_set)
    -- TODO: could check transport belt line outputs; inserter (etc) drop target, etc.
  end

  if not done then
    cube_search_data.last_entity = nil
    local last_surface_index = cube_search_data.last_surface_index
    local last_position = cube_search_data.last_position
    if last_surface_index and last_position then
      done = cube_search_local(result_set, last_surface_index, last_position)
    end
  end

  if not done then
    cube_search_data.last_surface_index = nil
    cube_search_data.last_position = nil
    done = cube_search_full(result_set)
  end

  for i = 1, #result_set do
    local result = result_set[i]
    local entity = result.entity
    fill_cube_search_result(result)
    cube_search_data.last_entity = entity
    cube_search_data.last_position = entity.position
    cube_search_data.last_surface_index = entity.surface_index
  end

  if done then
    cube_search_data.last_tick = tick
  else
    cube_search_data.last_tick = tick + 240
  end
  return result_set
end
