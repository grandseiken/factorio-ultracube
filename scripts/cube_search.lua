require("scripts.lib")
require("scripts.cube_management")

local cube_search_data = nil
local max_search_result_count = 1

function refresh_cube_search_data()
  global.cube_search_data = {
    last_entity = nil,
    last_position = nil,
    search_results = nil,
  }
  cube_search_data = global.cube_search_data
end

function cube_search_data_on_load()
  cube_search_data = global.cube_search_data
end

local function add_result(result_set, item, entity)
  result_set[#result_set + 1] = {
    item = item,
    entity = entity,
    unit_number = entity.unit_number,
  }
  if #result_set >= max_search_result_count then
    return true
  end
  return false
end

local function cube_search_transport_lines(result_set, cache)
  for _, e in pairs(cache.transport_lines) do
    for i = 1, e.get_max_transport_line_index() do
      local line = e.get_transport_line(i)
      if line.get_item_count(cubes.ultradense) > 0 then
        if add_result(result_set, cubes.ultradense, e) then return true end
      end
      if line.get_item_count(cubes.dormant) > 0 then
        if add_result(result_set, cubes.dormant, e) then return true end
      end
    end
  end
  return false
end

local function cube_search_inventories(result_set, cache)
  for _, e in pairs(cache.inventories) do
    local inventory = e.get_inventory(defines.inventory.chest)
    if inventory then
      if inventory.get_item_count(cubes.ultradense) > 0 then
        if add_result(result_set, cubes.ultradense, e) then return true end
      end
      if inventory.get_item_count(cubes.dormant) > 0 then
        if add_result(result_set, cubes.dormant, e) then return true end
      end
    end
  end
  return false
end

local function cube_search_crafters(result_set, cache)
  local recipes = cube_recipes()
  for _, e in pairs(cache.cube_crafters) do
    if e.is_crafting() then
      local recipe_data = recipes[e.get_recipe().name]
      if recipe_data then
        if recipe_data.ingredients[cubes.ultradense] then
          if add_result(result_set, cubes.ultradense, e) then return true end
        end
        if recipe_data.ingredients[cubes.dormant] then
          if add_result(result_set, cubes.dormant, e) then return true end
        end
      end
    end
    local inventory = e.get_inventory(defines.inventory.furnace_source)
    if inventory then
      if inventory.get_item_count(cubes.ultradense) > 0 then
        if add_result(result_set, cubes.ultradense, e) then return true end
      end
      if inventory.get_item_count(cubes.dormant) > 0 then
        if add_result(result_set, cubes.dormant, e) then return true end
      end
    end
    inventory = e.get_inventory(defines.inventory.assembling_machine_input)
    if inventory then
      if inventory.get_item_count(cubes.ultradense) > 0 then
        if add_result(result_set, cubes.ultradense, e) then return true end
      end
      if inventory.get_item_count(cubes.dormant) > 0 then
        if add_result(result_set, cubes.dormant, e) then return true end
      end
    end
    inventory = e.get_output_inventory()
    if inventory then
      if inventory.get_item_count(cubes.ultradense) > 0 then
        if add_result(result_set, cubes.ultradense, e) then return true end
      end
      if inventory.get_item_count(cubes.dormant) > 0 then
        if add_result(result_set, cubes.dormant, e) then return true end
      end
    end
  end
  return false
end

local function cube_search_burners(result_set, cache)
  for _, e in pairs(cache.cube_burners) do
    local fuel_inventory = e.get_fuel_inventory()
    if is_entity_burning_fuel(e, cubes.ultradense) or
      (fuel_inventory and fuel_inventory.get_item_count(cubes.ultradense) > 0) then
      if add_result(result_set, cubes.ultradense, e) then return true end
    end
    local burnt_result_inventory = e.get_burnt_result_inventory()
    if burnt_result_inventory and burnt_result_inventory.get_item_count(cubes.dormant) > 0 then
      if add_result(result_set, cubes.dormant, e) then return true end
    end
  end
  return false
end

local function cube_search_inserters(result_set, cache)
  for _, e in pairs(cache.inserters) do
    if e.held_stack.valid_for_read then
      local held_item = e.held_stack.name
      if held_item == cubes.ultradense then
        if add_result(result_set, cubes.ultradense, e) then return true end
      end
      if held_item == cubes.dormant then
        if add_result(result_set, cubes.dormant, e) then return true end
      end
    end
  end
  return false
end

local function cube_search_vehicles(result_set, cache)
  for _, e in pairs(cache.vehicles) do
    local inventory = nil
    if e.type == "cargo-wagon" then
      inventory = e.get_inventory(defines.inventory.cargo_wagon)
    elseif e.type == "car" then
      inventory = e.get_inventory(defines.inventory.car_trunk)
    elseif e.type == "spider-vehicle" then
      inventory = e.get_inventory(defines.inventory.spider_trunk)
    end
    if inventory then
      if inventory.get_item_count(cubes.ultradense) > 0 then
        if add_result(result_set, cubes.ultradense, e) then return true end
      end
      if inventory.get_item_count(cubes.dormant) > 0 then
        if add_result(result_set, cubes.dormant, e) then return true end
      end
    end
    if e.type ~= "cargo-wagon" then
      local fuel_inventory = e.get_fuel_inventory()
      if is_entity_burning_fuel(e, cubes.ultradense) or
        (fuel_inventory and fuel_inventory.get_item_count(cubes.ultradense) > 0) then
        if add_result(result_set, cubes.ultradense, e) then return true end
      end
      local burnt_result_inventory = e.get_burnt_result_inventory()
      if burnt_result_inventory and burnt_result_inventory.get_item_count(cubes.dormant) > 0 then
        if add_result(result_set, cubes.dormant, e) then return true end
      end
    end
  end
  return false
end

local function cube_search_players(result_set)
  for _, player in pairs(game.players) do
    if player.character then
      local ingredients = player_cube_data(player).ingredients
      if ingredients[cubes.ultradense] then
        if add_result(result_set, cubes.ultradense, player.character) then return true end
      end
      if ingredients[cubes.dormant] then
        if add_result(result_set, cubes.dormant, player.character) then return true end
      end
    end
  end
  return false
end

local function cube_search_ground(result_set)
  for _, surface in pairs(game.surfaces) do
    local find_result = surface.find_entities_filtered {
      type = "item-entity",
      name = "item-on-ground",
    }
    for _, e in ipairs(find_result) do
      local item_name = e.stack.name
      if item_name == cubes.ultradense then
        if add_result(result_set, cubes.ultradense, e) then return true end
      end
      if item_name == cubes.dormant then
        if add_result(result_set, cubes.dormant, e) then return true end
      end
    end
  end
  return false
end

local function cube_search_full(result_set)
  local cache = get_entity_cache()
  if cube_search_players(result_set) then return end
  if cube_search_vehicles(result_set, cache) then return end
  if cube_search_inventories(result_set, cache) then return end
  if cube_search_crafters(result_set, cache) then return end
  if cube_search_burners(result_set, cache) then return end
  if cube_search_inserters(result_set, cache) then return end
  if cube_search_transport_lines(result_set, cache) then return end
  if cube_search_ground(result_set) then return end
end

local function fill_cube_search_result(result)
  result.surface = result.entity.surface
  result.position = result.entity.position
  result.height = 0
  if result.entity.type == "character" then
    result.height = 0.5
  end
  if result.entity.effective_speed then
    result.velocity = from_polar(result.entity.effective_speed, result.entity.orientation)
  end
  if result.entity.type == "inserter" then
    result.position = result.entity.held_stack_position
  end
  if result.entity.type == "character" and
     result.entity.walking_state.walking then
    result.velocity = from_polar_orientation(result.entity.character_running_speed, result.entity.orientation)
  end
  if result.entity.type == "transport-belt" or
     result.entity.type == "splitter" then
    result.velocity = from_polar_orientation(result.entity.prototype.belt_speed, result.entity.orientation)
  end
  if result.entity.type == "underground-belt" then
    result.height = -1
  end
  if result.entity.type == "transport-belt" or
     result.entity.type == "underground-belt" then
    local v = from_polar_orientation(0.25, result.entity.orientation)
    for i = 1, result.entity.get_max_transport_line_index() do
      for _ = 1, result.entity.get_transport_line(i).get_item_count(result.item) do
        result.position = vector_add(result.position, i == 1 and {x = v.y, y = -v.x} or {x = -v.y, y = v.x})
      end
    end
  end
end

function cube_search_update()
  cube_search_data.search_results = {}
  cube_search_full(cube_search_data.search_results)
  for _, result in ipairs(cube_search_data.search_results) do
    fill_cube_search_result(result)
  end
  return cube_search_data.search_results
end
