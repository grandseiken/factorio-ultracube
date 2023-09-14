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
    last_entities = nil,
    search_results = {},
  }
  cube_search_data = global.cube_search_data
end

function cube_search_data_on_load()
  cube_search_data = global.cube_search_data
end

local function add_result(result_set, item, count, entity)
  if result_set.exclude[entity.unit_number] then
    return false
  end
  result_set.total_weight = result_set.total_weight + count * search_result_weight[item]
  result_set.entries[#result_set.entries + 1] = {
    item = item,
    count = count,
    entity = entity,
    unit_number = entity.unit_number,
  }
  return result_set.total_weight >= max_search_result_weight
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
  count = ingredients[cube_ultradense_phantom]
  if count > 0 then
    if add_result(result_set, cube_ultradense_phantom, count, entity) then return true end
  end
  count = ingredients[cube_dormant_phantom]
  if count > 0 then
    if add_result(result_set, cube_dormant_phantom, count, entity) then return true end
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
  count = inventory.get_item_count(cube_ultradense_phantom)
  if count > 0 then
    if add_result(result_set, cube_ultradense_phantom, count, entity) then return true end
  end
  count = inventory.get_item_count(cube_dormant_phantom)
  if count > 0 then
    if add_result(result_set, cube_dormant_phantom, count, entity) then return true end
  end
  return false
end

local function check_stack(entity, stack, result_set)
  local item = stack.name
  if item == cube_ultradense then
    if add_result(result_set, cube_ultradense, stack.count, entity) then return true end
  elseif item == cube_dormant then
    if add_result(result_set, cube_dormant, stack.count, entity) then return true end
  elseif item == cube_ultradense_phantom then
    if add_result(result_set, cube_ultradense_phantom, stack.count, entity) then return true end
  elseif item == cube_dormant_phantom then
    if add_result(result_set, cube_dormant_phantom, stack.count, entity) then return true end
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
    if entity_type == "spider-vehicle" then
      inventory = entity.get_inventory(defines.inventory.spider_trash)
      if inventory and check_inventory(entity, inventory, result_set) then return true end
    end
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
    if entity_type == "spider-vehicle" then
      inventory = e.get_inventory(defines.inventory.spider_trash)
      if inventory and check_inventory(e, inventory, result_set) then return true end
    end
  end
  return false
end

local function cube_search_players(result_set)
  for _, player in pairs(game.players) do
    if player.character then
      local done = check_ingredients(player.character, player_cube_data(player).ingredients, result_set)
      result_set.exclude[player.character.unit_number] = true
      if done then return true end
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

local function cube_search_local(result_set, last_entities)
  if cube_search_players(result_set) then return true end
  local initial_chunks = {}
  local surface_map = {}
  for i = 1, #last_entities do
    local e = last_entities[i]
    local chunk_x, chunk_y = get_chunk_position(e.position)
    local chunk_index = get_chunk_index(e.surface_index, chunk_x, chunk_y)
    initial_chunks[chunk_index] = {
      surface_index = e.surface_index,
      chunk_x = chunk_x,
      chunk_y = chunk_y,
    }
    local surface_entry = surface_map[e.surface_index]
    if surface_entry then
      surface_entry.x_min = math.min(surface_entry.x_min, chunk_x)
      surface_entry.x_max = math.max(surface_entry.x_max, chunk_x)
      surface_entry.y_min = math.min(surface_entry.y_min, chunk_y)
      surface_entry.y_max = math.max(surface_entry.y_max, chunk_y)
    else
      surface_entry = {
        x_min = chunk_x,
        x_max = chunk_x,
        y_min = chunk_y,
        y_max = chunk_y
      }
      surface_map[e.surface_index] = surface_entry
    end
  end
  local cache = get_entity_cache()
  local chunk_map = cache.chunk_map
  local visited_chunks = {}

  for i = 1, #local_search_offsets do
    local offset = local_search_offsets[i]
    for _, chunk_data in pairs(initial_chunks) do
      local chunk_index = get_chunk_index(chunk_data.surface_index, chunk_data.chunk_x + offset.x, chunk_data.chunk_y + offset.y)
      if not visited_chunks[chunk_index] then
        visited_chunks[chunk_index] = true
        local chunk_cache = chunk_map[chunk_index]
        if chunk_cache then
          if cube_search_transport_lines(result_set, chunk_cache) then return true end
          if cube_search_inserters(result_set, chunk_cache) then return true end
          if cube_search_crafters(result_set, chunk_cache) then return true end
          if cube_search_burners(result_set, chunk_cache) then return true end
          if cube_search_inventories(result_set, chunk_cache) then return true end
        end
      end
    end
    if i == 9 and cube_search_vehicles(result_set, cache) then return true end
  end

  for surface_index, surface_entry in pairs(surface_map) do
    local surface = game.surfaces[surface_index]
    local area = {
      left_top = {x = (surface_entry.x_min - 1) * chunk_size, y = (surface_entry.y_min - 1) * chunk_size},
      right_bottom = {x = (surface_entry.x_max + 2) * chunk_size, y = (surface_entry.y_max + 2) * chunk_size},
    }
    return cube_search_ground(result_set, surface, area)
  end
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
  if not cube_search_data.last_entities then
    cube_search_data.last_entities = {}
  end
  cube_search_data.last_entities[#cube_search_data.last_entities] = {
    entity = entity,
    position = entity.position,
    surface_index = entity.surface_index,
  }
end

function cube_search_update(tick)
  if cube_search_data.last_tick and tick <= cube_search_data.last_tick then
    return cube_search_data.search_results
  end
  for _, player in pairs(game.players) do
    if player.opened and player.opened.unit_number then
      cube_search_hint_entity(player.opened)
    end
  end

  local result_set = {total_weight = 0, exclude = {}, entries = {}}
  cube_search_data.search_results = result_set.entries
  local done = false

  if cube_search_data.last_entities then
    for i = 1, #cube_search_data.last_entities do
      local e = cube_search_data.last_entities[i]
      if e and e.valid then
        -- TODO: could check transport belt line outputs; inserter (etc) drop target, etc.
        done = cube_check_entity(e, result_set)
        result_set.exclude[e.unit_number] = true
        if done then break end
      end
    end
  end

  if not done then
    done = cube_search_local(result_set, cube_search_data.last_entities or {})
  end

  if done and cube_search_data.report_timer then
    cube_search_data.report_timer = cube_search_data.report_timer - 1
    if cube_search_data.report_timer == 0 then
      cube_search_data.report_timer = nil
    end
  end

  if not done then
    if not cube_search_data.report_timer then
      game.print("Ultracube warning: optimized cube control routines failed. This is either due to compatibility issues with another mod, or a bug that should be reported.")
      cube_search_data.report_timer = 600
    end
    result_set = {total_weight = 0, exclude = {}, entries = {}}
    cube_search_data.search_results = result_set.entries
    done = cube_search_full(result_set)
  end

  cube_search_data.last_entities = {}
  for i = 1, #result_set.entries do
    local result = result_set.entries[i]
    local entity = result.entity
    fill_cube_search_result(result)
    cube_search_data.last_entities[#cube_search_data.last_entities + 1] = {
      entity = entity,
      position = entity.position,
      surface_index = entity.surface_index,
    }
  end

  if done then
    cube_search_data.last_tick = tick
  else
    game.print("Ultracube warning: cannot find the ultradense cube. This may be due to compatibility issues with another mod, or a bug that should be reported.")
    game.print("If the cube is really gone, you fix it with the following console command: /c game.player.insert(\"cube-ultradense-utility-cube\")")
    cube_search_data.last_tick = tick + 600
  end
  return result_set.entries
end
