require("__Ultracube__/scripts/lib")
local cube_management = require("__Ultracube__/scripts/cube_management")
local entity_cache = require("__Ultracube__/scripts/entity_cache")

local cube_ultradense = cube_management.cubes.ultradense
local cube_dormant = cube_management.cubes.dormant
local cube_ultradense_phantom = cube_management.cubes.ultradense_phantom
local cube_dormant_phantom = cube_management.cubes.dormant_phantom
local legendary_iron_gear = cube_management.cubes.legendary_iron_gear

local inventory_entity_types = entity_cache.types.inventory
local vehicle_entity_types = entity_cache.types.vehicle

local is_cube_crafter = entity_cache.is_cube_crafter
local is_cube_burner = entity_cache.is_cube_burner

local inserter_t = "inserter"
local belt_t = "transport-belt"
local underground_t = "underground-belt"
local splitter_t = "splitter"
local loader_t = "loader-1x1"
local character_t = "character"
local logistic_robot_t = "logistic-robot"
local construction_robot_t = "construction-robot"
local car_t = "car"
local cargo_wagon_t = "cargo-wagon"
local spider_vehicle_t = "spider-vehicle"
local furnace_t = "furnace"
local rocket_silo_t = "rocket-silo"
local item_entity_t = "item-entity"
local ghost_t = "entity-ghost"
local input_t = "input"
local output_t = "output"
local outputs_t = "outputs"

local cube_search_data = nil
local max_search_result_weight = 64
local search_result_weight = {
  [cube_ultradense] = 64,
  [cube_dormant] = 64,
  [cube_ultradense_phantom] = 1,
  [cube_dormant_phantom] = 1,
  [legendary_iron_gear] = 64,
}

local cube_search = {}

function cube_search.refresh()
  global.cube_search_data = {
    last_tick = nil,
    last_entities = nil,
    search_results = nil,
    pickups = nil,
    was_refreshed = true,
  }
  cube_search_data = global.cube_search_data
end

function cube_search.on_load()
  cube_search_data = global.cube_search_data
end

local result_set = {
  total_weight = 0,
  exclude = {},
  entries = {},
  entries_size = 0,
  entries_capacity = 0,
}

local function clear_result_set()
  result_set.total_weight = 0
  result_set.entries_size = 0
  result_set.has_phantom = false
  local exclude = result_set.exclude
  for k, _ in pairs(exclude) do
    exclude[k] = nil
  end
end

local function add_result(item, count, entity)
  if entity and result_set.exclude[entity.unit_number] then
    return false
  end
  result_set.total_weight = result_set.total_weight + count * search_result_weight[item]
  if result_set.entries_size == result_set.entries_capacity then
    local capacity = result_set.entries_capacity + 1
    result_set.entries[capacity] = {}
    result_set.entries_capacity = capacity
  end
  local size = result_set.entries_size + 1
  local entry = result_set.entries[size]
  entry.item = item
  entry.count = count
  entry.entity = entity
  if entity then
    entry.unit_number = entity.unit_number
  end
  result_set.entries_size = size
  if item == cube_dormant_phantom or item == cube_ultradense_phantom then
    result_set.has_phantom = true
  end
  return result_set.total_weight >= max_search_result_weight
end

local function check_ingredients(entity, ingredients)
  if result_set.has_phantom then
    count = ingredients[cube_ultradense_phantom]
    if count > 0 then
      if add_result(cube_ultradense_phantom, count, entity) then return true end
    end
    count = ingredients[cube_dormant_phantom]
    if count > 0 then
      if add_result(cube_dormant_phantom, count, entity) then return true end
    end
    return false
  end
  local count = ingredients[cube_ultradense]
  if count > 0 then
    if add_result(cube_ultradense, count, entity) then return true end
  end
  count = ingredients[cube_dormant]
  if count > 0 then
    if add_result(cube_dormant, count, entity) then return true end
  end
  count = ingredients[cube_ultradense_phantom]
  if count > 0 then
    if add_result(cube_ultradense_phantom, count, entity) then return true end
  end
  count = ingredients[cube_dormant_phantom]
  if count > 0 then
    if add_result(cube_dormant_phantom, count, entity) then return true end
  end
  count = ingredients[legendary_iron_gear]
  if count > 0 then
    if add_result(legendary_iron_gear, count, entity) then return true end
  end
  return false
end

local function check_inventory(entity, inventory)
  if result_set.has_phantom then
    count = inventory.get_item_count(cube_ultradense_phantom)
    if count > 0 then
      if add_result(cube_ultradense_phantom, count, entity) then return true end
    end
    count = inventory.get_item_count(cube_dormant_phantom)
    if count > 0 then
      if add_result(cube_dormant_phantom, count, entity) then return true end
    end
    return false
  end
  local count = inventory.get_item_count(cube_ultradense)
  if count > 0 then
    if add_result(cube_ultradense, count, entity) then return true end
  end
  count = inventory.get_item_count(cube_dormant)
  if count > 0 then
    if add_result(cube_dormant, count, entity) then return true end
  end
  count = inventory.get_item_count(cube_ultradense_phantom)
  if count > 0 then
    if add_result(cube_ultradense_phantom, count, entity) then return true end
  end
  count = inventory.get_item_count(cube_dormant_phantom)
  if count > 0 then
    if add_result(cube_dormant_phantom, count, entity) then return true end
  end
  count = inventory.get_item_count(legendary_iron_gear)
  if count > 0 then
    if add_result(legendary_iron_gear, count, entity) then return true end
  end
  return false
end

local function check_stack(entity, stack)
  local item = stack.name
  if item == cube_ultradense then
    if add_result(cube_ultradense, stack.count, entity) then return true end
  elseif item == cube_dormant then
    if add_result(cube_dormant, stack.count, entity) then return true end
  elseif item == cube_ultradense_phantom then
    if add_result(cube_ultradense_phantom, stack.count, entity) then return true end
  elseif item == cube_dormant_phantom then
    if add_result(cube_dormant_phantom, stack.count, entity) then return true end
  elseif item == legendary_iron_gear then
    if add_result(legendary_iron_gear, stack.count, entity) then return true end
  end
  return false
end

local phantom_burners = {["cube-boiler"] = true}
local function check_burner(entity)
  local can_burn_phantom = phantom_burners[entity.name]
  if cube_management.is_entity_burning_fuel(entity, cube_ultradense) then
    if add_result(cube_ultradense, 1, entity) then return true end
  end
  if can_burn_phantom and cube_management.is_entity_burning_fuel(entity, cube_ultradense_phantom) then
    if add_result(cube_ultradense_phantom, 1, entity) then return true end
  end
  local inventory = entity.get_fuel_inventory()
  if inventory then
    local count = inventory.get_item_count(cube_ultradense)
    if count > 0 then
      if add_result(cube_ultradense, count, entity) then return true end
    end
    if can_burn_phantom then
      count = inventory.get_item_count(cube_ultradense_phantom)
      if count > 0 then
        if add_result(cube_ultradense_phantom, count, entity) then return true end
      end
    end
  end
  inventory = entity.get_burnt_result_inventory()
  if inventory then
    local count = inventory.get_item_count(cube_dormant)
    if count > 0 then
      if add_result(cube_dormant, count, entity) then return true end
    end
    if can_burn_phantom then
      count = inventory.get_item_count(cube_dormant_phantom)
      if count > 0 then
        if add_result(cube_dormant_phantom, count, entity) then return true end
      end
    end
  end
  return false
end

local function cube_check_entity(entity)
  local entity_type = entity.type
  if entity_type == belt_t or entity_type == splitter_t or entity_type == underground_t or entity_type == loader_t then
    for i = 1, entity.get_max_transport_line_index() do
      if check_inventory(entity, entity.get_transport_line(i)) then return true end
    end
    return false
  end

  if entity_type == inserter_t then
    return entity.held_stack.valid_for_read and check_stack(entity, entity.held_stack)
  end

  if entity_type == character_t then
    local player = entity.player
    if entity.player then
      if check_ingredients(entity, cube_management.player_data(player).ingredients) then return true end
    end
    return false
  end

  if entity_type == construction_robot_t or entity_type == logistic_robot_t then
    local inventory = entity.get_inventory(defines.inventory.robot_cargo)
    return inventory and check_inventory(entity, inventory)
  end

  if vehicle_entity_types[entity_type] then
    local inventory = nil
    if entity_type == cargo_wagon_t then
      inventory = entity.get_inventory(defines.inventory.cargo_wagon)
    elseif entity_type == car_t then
      inventory = entity.get_inventory(defines.inventory.car_trunk)
    elseif entity_type == spider_vehicle_t then
      inventory = entity.get_inventory(defines.inventory.spider_trunk)
      if inventory and check_inventory(entity, inventory) then return true end
      inventory = entity.get_inventory(defines.inventory.spider_trash)
    end
    if inventory and check_inventory(entity, inventory) then return true end
  end

  if is_cube_crafter(entity) then
    local recipes = cube_management.recipes()
    if entity.is_crafting() then
      local recipe_data = recipes[entity.get_recipe().name]
      if recipe_data and check_ingredients(entity, recipe_data.ingredients) then return true end
    end
    local inventory
    if entity_type == furnace_t then
      inventory = entity.get_inventory(defines.inventory.furnace_source)
    else
      inventory = entity.get_inventory(defines.inventory.assembling_machine_input)
    end
    if inventory and check_inventory(entity, inventory) then return true end
    inventory = entity.get_output_inventory()
    if inventory and check_inventory(entity, inventory) then return true end
    if entity_type == rocket_silo_t then
      inventory = entity.get_inventory(defines.inventory.rocket_silo_rocket)
      if inventory and check_inventory(entity, inventory) then return true end
    end
    return false
  end

  if (is_cube_burner(entity) or (vehicle_entity_types[entity_type] and entity_type ~= cargo_wagon_t)) and
     check_burner(entity) then
    return true
  end

  if inventory_entity_types[entity_type] then
    local inventory = entity.get_inventory(defines.inventory.chest)
    if inventory and check_inventory(entity, inventory) then return true end
  end

  if entity_type == item_entity_t then
    return check_stack(entity, entity.stack)
  end
  return false
end

local function cube_search_transport_lines(cache)
  for _, e in pairs(cache.transport_lines) do
    for i = 1, e.get_max_transport_line_index() do
      if check_inventory(e, e.get_transport_line(i)) then return true end
    end
  end
  return false
end

local function cube_search_inventories(cache)
  for _, e in pairs(cache.inventories) do
    local inventory = e.get_inventory(defines.inventory.chest)
    if inventory and check_inventory(e, inventory) then return true end
  end
  return false
end

local function cube_search_crafters(cache)
  local recipes = cube_management.recipes()
  for _, e in pairs(cache.cube_crafters) do
    if e.is_crafting() then
      local recipe_data = recipes[e.get_recipe().name]
      if recipe_data and check_ingredients(e, recipe_data.ingredients) then return true end
    end
    local inventory
    if e.type == furnace_t then
      inventory = e.get_inventory(defines.inventory.furnace_source)
    else
      inventory = e.get_inventory(defines.inventory.assembling_machine_input)
    end
    if inventory and check_inventory(e, inventory) then return true end
    inventory = e.get_output_inventory()
    if inventory and check_inventory(e, inventory) then return true end
    if e.type == rocket_silo_t then
      inventory = e.get_inventory(defines.inventory.rocket_silo_rocket)
      if inventory and check_inventory(e, inventory) then return true end
    end
  end
  return false
end

local function cube_search_burners(cache)
  for _, e in pairs(cache.cube_burners) do
    if check_burner(e) then return true end
  end
  return false
end

local function cube_search_inserters(cache)
  for _, e in pairs(cache.inserters) do
    if e.held_stack.valid_for_read and check_stack(e, e.held_stack) then
      return true
    end
  end
  return false
end

local function cube_search_vehicles(cache)
  for _, e in pairs(cache.vehicles) do
    local entity_type = e.type
    local inventory = nil
    if entity_type == cargo_wagon_t then
      inventory = e.get_inventory(defines.inventory.cargo_wagon)
    elseif entity_type == car_t then
      inventory = e.get_inventory(defines.inventory.car_trunk)
    elseif entity_type == spider_vehicle_t then
      inventory = e.get_inventory(defines.inventory.spider_trunk)
      if inventory and check_inventory(e, inventory) then return true end
      inventory = e.get_inventory(defines.inventory.spider_trash)
    end
    if inventory and check_inventory(e, inventory) then return true end
    if entity_type ~= cargo_wagon_t and check_burner(e) then return true end
  end
  return false
end

local function cube_search_players()
  for _, player in pairs(game.players) do
    local ingredients = cube_management.player_data(player).ingredients
    if player.character then
      local done = check_ingredients(player.character, ingredients)
      result_set.exclude[player.character.unit_number] = true
      if done then return true end
    else
      local done = check_ingredients(nil, ingredients)
      if done then return true end
    end
  end
  return false
end

local function cube_search_ground(surface, area)
  if not surface or not surface.valid then
    return false
  end

  local find_result = surface.find_entities_filtered {
    area = area,
    type = item_entity_t,
  }
  for _, e in ipairs(find_result) do
    if check_stack(e, e.stack) then return true end
  end
  find_result = surface.find_entities_filtered {
    area = area,
    type = {construction_robot_t, logistic_robot_t}
  }
  for _, e in ipairs(find_result) do
    local inventory = e.get_inventory(defines.inventory.robot_cargo)
    if inventory and check_inventory(e, inventory) then return true end
  end
  return false
end

local function cube_search_full()
  local cache = entity_cache.get()
  if cube_search_players() then return true end
  if cube_search_vehicles(cache) then return true end
  if cube_search_inventories(cache) then return true end
  if cube_search_crafters(cache) then return true end
  if cube_search_burners(cache) then return true end
  if cube_search_inserters(cache) then return true end
  if cube_search_transport_lines(cache) then return true end
  for _, surface in pairs(game.surfaces) do
    if cube_search_ground(surface) then return true end
  end
  return false
end

local get_chunk_position = get_chunk_position
local get_chunk_index = get_chunk_index
local chunk_size = entity_cache.chunk_size
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

local local_initial_chunks = {}
local local_surface_map = {}
local local_visited_chunks = {}
local function cube_search_local(last_entities_size, last_entities)
  if cube_search_players() then return true end
  local initial_chunks = local_initial_chunks
  local surface_map = local_surface_map
  local visited_chunks = local_visited_chunks
  for k, _ in pairs(initial_chunks) do
    initial_chunks[k] = nil
  end
  for k, _ in pairs(surface_map) do
    surface_map[k] = nil
  end
  for k, _ in pairs(visited_chunks) do
    visited_chunks[k] = nil
  end

  for i = 1, last_entities_size do
    local e = last_entities[i]
    if e.entity then
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
          y_max = chunk_y,
        }
        surface_map[e.surface_index] = surface_entry
      end
    end
  end
  local cache = entity_cache.get()
  local chunk_map = cache.chunk_map

  for i = 1, #local_search_offsets do
    local offset = local_search_offsets[i]
    for _, chunk_data in pairs(initial_chunks) do
      local chunk_index = get_chunk_index(chunk_data.surface_index, chunk_data.chunk_x + offset.x, chunk_data.chunk_y + offset.y)
      if not visited_chunks[chunk_index] then
        visited_chunks[chunk_index] = true
        local chunk_cache = chunk_map[chunk_index]
        if chunk_cache then
          if cube_search_transport_lines(chunk_cache) then return true end
          if cube_search_inserters(chunk_cache) then return true end
          if cube_search_crafters(chunk_cache) then return true end
          if cube_search_burners(chunk_cache) then return true end
          if cube_search_inventories(chunk_cache) then return true end
        end
      end
    end
    if i == 9 and cube_search_vehicles(cache) then return true end
  end

  for surface_index, surface_entry in pairs(surface_map) do
    local surface = game.surfaces[surface_index]
    local area = {
      left_top = {x = (surface_entry.x_min - 1) * chunk_size, y = (surface_entry.y_min - 1) * chunk_size},
      right_bottom = {x = (surface_entry.x_max + 2) * chunk_size, y = (surface_entry.y_max + 2) * chunk_size},
    }
    return cube_search_ground(surface, area)
  end
end

local search_target_queue = {}
local search_target_queue_capacity = 0
local search_target_queued = {}
local function cube_search_graph(last_entities_size, last_entities)
  local pickups = cube_search_data.pickups
  local exclude = result_set.exclude
  local target_queue = search_target_queue
  local target_queued = search_target_queued
  while search_target_queue_capacity < last_entities_size do
    local capacity = search_target_queue_capacity + 1
    target_queue[capacity] = {}
    search_target_queue_capacity = capacity
  end
  for k, _ in pairs(target_queued) do
    target_queued[k] = nil
  end
  local target_queue_end = 0
  local target_queue_begin = 0

  for i = 1, cube_search_data.last_entities_size do
    local e = last_entities[i].entity
    if e and e.valid then
      local en = e.unit_number
      if not en or not target_queued[en] then
        target_queue_end = target_queue_end + 1
        local q = target_queue[target_queue_end]
        q.entity = e
        q.depth = 0
        q.belt = false
        if en then target_queued[en] = true end
      end
    end
  end

  while target_queue_begin < target_queue_end do
    target_queue_begin = target_queue_begin + 1
    local q = target_queue[target_queue_begin]
    local e = q.entity
    local en = e.unit_number
    if q.belt then
      for i = 1, e.get_max_transport_line_index() do
        if check_inventory(e, e.get_transport_line(i)) then return true end
      end
    else
      if cube_check_entity(e) then return true end
    end
    if en then exclude[en] = true end

    local depth = q.depth + 1
    if depth <= 4 then
      local type = e.type
      local t
      local t_belt = false
      if type == underground_t then
        t = e.neighbours
        t_belt = true
      elseif type == loader_t and e.loader_type == input_t then
        t = e.loader_container
      else
        t = e.drop_target
      end
      if t and t.valid and not target_queued[t.unit_number] and t.type ~= ghost_t then
        target_queue_end = target_queue_end + 1
        if target_queue_end > search_target_queue_capacity then
          search_target_queue_capacity = target_queue_end
          target_queue[target_queue_end] = {}
        end
        local qq = target_queue[target_queue_end]
        qq.entity = t
        qq.depth = depth
        qq.belt = t_belt
        target_queued[t.unit_number] = true
      end

      if type == underground_t or type == splitter_t or type == loader_t or type == belt_t then
        local targets = e.belt_neighbours[outputs_t]
        if targets then
          for j = 1, #targets do
            t = targets[j]
            if not target_queued[t.unit_number] and t.type ~= ghost_t then
              target_queue_end = target_queue_end + 1
              if target_queue_end > search_target_queue_capacity then
                search_target_queue_capacity = target_queue_end
                target_queue[target_queue_end] = {}
              end
              local qq = target_queue[target_queue_end]
              qq.entity = t
              qq.depth = depth
              qq.belt = true
              target_queued[t.unit_number] = true
            end
          end
        end
      end

      local pickup_set = pickups[en]
      if pickup_set then
        for pn, p in pairs(pickup_set) do
          if p.valid then
            local pickup_target = nil
            local ptype = p.type
            if ptype == inserter_t then
              pickup_target = p.pickup_target
            end
            if ptype == loader_t and p.loader_type == output_t then
              pickup_target = p.loader_container
            end
            if not pickup_target or pickup_target.unit_number ~= en then
              pickup_set[pn] = nil
            elseif not target_queued[pn] then
              target_queue_end = target_queue_end + 1
              if target_queue_end > search_target_queue_capacity then
                search_target_queue_capacity = target_queue_end
                target_queue[target_queue_end] = {}
              end
              local qq = target_queue[target_queue_end]
              qq.entity = p
              qq.depth = depth
              qq.belt = false
              target_queued[pn] = true
            end
          else
            pickup_set[pn] = nil
          end
        end
      end
    end
  end
  return false
end

local direction_map = {}
direction_map[defines.direction.north] = {
  x = 0,
  y = -1,
}
direction_map[defines.direction.east] = {
  x = 1,
  y = 0,
}
direction_map[defines.direction.south] = {
  x = 0,
  y = 1,
}
direction_map[defines.direction.west] = {
  x = -1,
  y = 0,
}

local function fill_result(result)
  local entity = result.entity
  local entity_type = entity.type

  result.surface = entity.surface
  result.position = entity.position
  result.positions = nil
  result.height = 0
  result.velocity = nil
  if entity_type == inserter_t then
    result.position = entity.held_stack_position
    return
  end
  local is_belt = entity_type == belt_t
  local is_underground = entity_type == underground_t
  local is_splitter = entity_type == splitter_t
  local is_loader = entity_type == loader_t
  if is_belt or is_underground or is_splitter or is_loader then
    if is_underground then
      result.height = -1
    else
      local speed = entity.prototype.belt_speed
      local d = direction_map[entity.direction]
      result.velocity = {
        x = speed * d.x,
        y = speed * d.y,
      }
    end
    if not is_splitter then
      local d = direction_map[entity.direction]
      local vx = 0.25 * d.x
      local vy = 0.25 * d.y
      local item = result.item
      local position = result.position
      local x = position.x
      local y = position.y
      local already_found = false
      for i = 1, entity.get_max_transport_line_index() do
        local count = entity.get_transport_line(i).get_item_count(item)
        if count > 0 then
          local px
          local py
          if i == 1 then
            px = x + vy
            py = y - vx
          else
            px = x - vy
            py = y + vx
          end
          if already_found then
            result.positions = {result.position, {x = px, y = py}}
          else
            already_found = true
            result.position.x = px
            result.position.y = py
          end
        end
      end
    end
    return
  end
  if entity_type == character_t then
    result.height = 0.5
    if entity.walking_state.walking then
      local speed = entity.character_running_speed
      local theta = 2 * math.pi * (entity.orientation - 0.25)
      result.velocity = {
        x = speed * math.cos(theta),
        y = speed * math.sin(theta),
      }
    end
  end
  if entity_type == logistic_robot_t or entity_type == construction_robot_t then
    local theta = 2 * math.pi * (entity.orientation - 0.25)
    result.height = 1
    result.velocity = {
      x = 0.05 * math.cos(theta),
      y = 0.05 * math.sin(theta),
    }
  end
  if entity.effective_speed then
    local speed = entity.effective_speed
    local theta = entity.orientation
    result.velocity = {
      x = speed * math.cos(theta),
      y = speed * math.sin(theta),
    }
  end
end

local function process_results()
  local pickups = cube_search_data.pickups
  while cube_search_data.last_entities_capacity < result_set.entries_size do
    local capacity = cube_search_data.last_entities_capacity + 1
    cube_search_data.last_entities[capacity] = {}
    cube_search_data.last_entities_capacity = capacity
  end
  for i = 1, result_set.entries_size do
    local result = result_set.entries[i]
    local entity = result.entity
    local e = cube_search_data.last_entities[i]
    e.entity = entity
    if entity then
      fill_result(result)
      e.position = entity.position
      e.surface_index = entity.surface_index

      local pickup_target = nil
      if entity.type == inserter_t then
        pickup_target = entity.pickup_target
      end
      if entity.type == loader_t and entity.loader_type == output_t then
        pickup_target = entity.loader_container
      end
      local en = entity.unit_number
      if en and pickup_target then
        local pn = pickup_target.unit_number
        if pn then
          local pickup_set = pickups[pn]
          if not pickup_set then
            pickup_set = {}
            pickups[pn] = pickup_set
          end
          pickup_set[en] = entity
        end
      end
    end
  end
  cube_search_data.last_entities_size = result_set.entries_size
end

function cube_search.hint_entity(entity)
  if not cube_search_data.last_entities then
    cube_search_data.last_entities = {}
    cube_search_data.last_entities_size = 0
    cube_search_data.last_entities_capacity = 0
  end
  if cube_search_data.last_entities_size == cube_search_data.last_entities_capacity then
    local capacity = cube_search_data.last_entities_capacity + 1
    cube_search_data.last_entities[capacity] = {}
    cube_search_data.last_entities_capacity = capacity
  end
  local size = cube_search_data.last_entities_size + 1
  local e = cube_search_data.last_entities[size]
  e.entity = entity
  e.position = entity.position
  e.surface_index = entity.surface_index
  cube_search_data.last_entities_size = size
end

function cube_search.remove_entity(entity)
  local pickups = cube_search_data.pickups
  if pickups then
    pickups[entity.unit_number] = nil
  end
end

function cube_search.update(tick)
  if cube_search_data.last_tick and tick <= cube_search_data.last_tick then
    return result_set.entries_size, result_set.entries
  end
  for _, player in pairs(game.players) do
    if player.opened_gui_type == defines.gui_type.entity and player.opened and player.opened.unit_number then
      cube_search.hint_entity(player.opened)
    end
    if player.selected and player.selected.unit_number then
      cube_search.hint_entity(player.selected)
    end
  end
  clear_result_set()

  if not cube_search_data.pickups then
    cube_search_data.pickups = {}
  end
  if not cube_search_data.last_entities then
    cube_search_data.last_entities = {}
    cube_search_data.last_entities_size = 0
    cube_search_data.last_entities_capacity = 0
  end
  local last_entities = cube_search_data.last_entities
  local last_entities_size = cube_search_data.last_entities_size
  local done = cube_search_graph(last_entities_size, last_entities)

  if not done then
    -- game.print("Found only " .. result_set.total_weight)
    done = cube_search_local(last_entities_size, last_entities)
  end

  if done and cube_search_data.report_timer then
    cube_search_data.report_timer = cube_search_data.report_timer - 1
    if cube_search_data.report_timer == 0 then
      cube_search_data.report_timer = nil
    end
  end

  if not done then
    if not cube_search_data.report_timer then
      if cube_search_data.was_refreshed then
        cube_search_data.was_refreshed = false
      else
        game.print("Ultracube warning: optimized cube control routines failed. This may be due to compatibility issues with another mod, or a bug that should be reported.")
        cube_search_data.report_timer = 600
      end
    end
    clear_result_set()
    done = cube_search_full()
  end

  process_results()
  if done then
    cube_search_data.last_tick = tick
  else
    game.print("Ultracube warning: cannot find the ultradense cube. This may be due to compatibility issues with another mod, or a bug that should be reported.")
    game.print("If the cube is really gone, you fix it with the following console command: /c game.player.insert(\"cube-ultradense-utility-cube\")")
    cube_search_data.last_tick = tick + 600
  end
  return result_set.entries_size, result_set.entries
end

return cube_search
