require("scripts.lib")
require("scripts.cube_management")

local cube_defines = cube_defines
local entity_cache = nil
local chunk_size = 16

function refresh_entity_cache()
  global.entity_cache = {
    chunk_min = nil,
    chunk_max = nil,
    chunk_map = {},
    transport_lines = {},
    inventories = {},
    cube_crafters = {},
    cube_burners = {},
    inserters = {},
    vehicles = {},
  }
  entity_cache = global.entity_cache
  for _, surface in pairs(game.surfaces) do
    for _, entity in pairs(surface.find_entities_filtered({force = "player"})) do
      add_entity_cache(entity)
    end
  end
end

function entity_cache_on_load()
  entity_cache = global.entity_cache
end

function get_entity_cache()
  return entity_cache
end

entity_types = {
  transport_line = make_set({
    "transport-belt",
    "underground-belt",
    "splitter",
  }),
  inventory = make_set({
    "reactor",
    "lab",
    "container",
    "logistic-container",
    "infinity-container",
    "character-corpse",
  }),
  cube_crafter = make_set({
    "furnace",
    "assembling-machine",
    "rocket-silo",
  }),
  cube_burner = make_set({
    "inserter",
    "assembling-machine",
    "furnace",
    "boiler",
    "burner-generator",
    "reactor",
    "rocket-silo",
    "generator",
    "lab",
    "mining-drill",
  }),
  vehicle = make_set({
    "car",
    "locomotive",
    "cargo-wagon",
    "spider-vehicle",
  }),
}

local transport_line_entity_types = entity_types.transport_line
local inventory_entity_types = entity_types.inventory
local cube_crafter_entity_types = entity_types.cube_crafter
local cube_burner_entity_types = entity_types.cube_burner
local vehicle_entity_types = entity_types.vehicle

function is_cube_crafter(entity)
  local categories = cube_recipe_categories()
  if cube_crafter_entity_types[entity.type] and entity.prototype.crafting_categories then
    for category, _ in pairs(entity.prototype.crafting_categories) do
      if categories[category] then
        return true
      end
    end
  end
  return false
end

function is_cube_burner(entity)
  return cube_burner_entity_types[entity.type] and entity.prototype.burner_prototype and
         entity.prototype.burner_prototype.fuel_categories[cube_defines.fuel_category]
end

local is_cube_crafter = is_cube_crafter
local is_cube_burner = is_cube_burner

local function add_entity_cache_internal(entity, cache, is_global)
  local entity_type = entity.type
  if transport_line_entity_types[entity_type] then
    cache.transport_lines[entity.unit_number] = entity
  end
  if inventory_entity_types[entity_type] then
    cache.inventories[entity.unit_number] = entity
  end
  if is_cube_crafter(entity) then
    cache.cube_crafters[entity.unit_number] = entity
  end
  if is_cube_burner(entity) then
    cache.cube_burners[entity.unit_number] = entity
  end
  if entity_type == "inserter" then
    cache.inserters[entity.unit_number] = entity
  end
  if is_global and vehicle_entity_types[entity_type] then
    cache.vehicles[entity.unit_number] = entity
  end
end

local function remove_entity_cache_internal(entity, cache, is_global)
  local entity_type = entity.type
  if transport_line_entity_types[entity_type] then
    cache.transport_lines[entity.unit_number] = nil
  end
  if inventory_entity_types[entity_type] then
    cache.inventories[entity.unit_number] = nil
  end
  if is_cube_crafter(entity) then
    cache.cube_crafters[entity.unit_number] = nil
  end
  if is_cube_burner(entity) then
    cache.cube_burners[entity.unit_number] = nil
  end
  if entity_type == "inserter" then
    cache.inserters[entity.unit_number] = nil
  end
  if is_global and vehicle_entity_types[entity_type] then
    cache.vehicles[entity.unit_number] = nil
  end
end

function get_chunk_position(position)
  return math.floor(position.x / chunk_size), math.floor(position.y / chunk_size)
end

function get_chunk_index(surface_index, chunk_x, chunk_y)
  return surface_index .. "_" .. chunk_x .. "_" .. chunk_y
end

function add_entity_cache(entity)
  add_entity_cache_internal(entity, entity_cache, true)
  if vehicle_entity_types[entity.type] then
    return
  end

  local chunk_x, chunk_y = get_chunk_position(entity.position)
  local chunk_index = get_chunk_index(entity.surface_index, chunk_x, chunk_y)
  local chunk_cache = entity_cache.chunk_map[chunk_index]
  if not chunk_cache then
    chunk_cache = {
      transport_lines = {},
      inventories = {},
      cube_crafters = {},
      cube_burners = {},
      inserters = {},
    }
    entity_cache.chunk_map[chunk_index] = chunk_cache
    if entity_cache.chunk_min then
      entity_cache.chunk_min = {x = math.min(entity_cache.chunk_min.x, chunk_x),
                                y = math.min(entity_cache.chunk_min.y, chunk_y)}
    else
      entity_cache.chunk_min = {x = chunk_x, y = chunk_y}
    end
    if entity_cache.chunk_max then
      entity_cache.chunk_max = {x = math.min(entity_cache.chunk_max.x, chunk_x),
                                y = math.min(entity_cache.chunk_max.y, chunk_y)}
    else
      entity_cache.chunk_max = {x = chunk_x, y = chunk_y}
    end
  end
  add_entity_cache_internal(entity, chunk_cache, false)
end

function remove_entity_cache(entity)
  remove_entity_cache_internal(entity, entity_cache, true)
  if vehicle_entity_types[entity.type] then
    return
  end

  local chunk_x, chunk_y = get_chunk_position(entity.position)
  local chunk_index = get_chunk_index(entity.surface_index, chunk_x, chunk_y)
  local chunk_cache = entity_cache.chunk_map[chunk_index]
  if chunk_cache then
    remove_entity_cache_internal(entity, chunk_cache, false)
    local next = next
    if next(chunk_cache.transport_lines) == nil and
       next(chunk_cache.inventories) == nil and
       next(chunk_cache.cube_crafters) == nil and
       next(chunk_cache.cube_burners) == nil and
       next(chunk_cache.inserters) == nil then
      entity_cache.chunk_map[chunk_index] = nil
    end
  end
end