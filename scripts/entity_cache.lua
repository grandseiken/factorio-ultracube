require("__Ultracube__/scripts/lib")
local cube_management = require("__Ultracube__/scripts/cube_management")
local transition_table = require("__Ultracube__/scripts/transition_table")

local chunk_size = 8
local cache = nil

local entity_cache = {
  chunk_size = chunk_size,
}

function entity_cache.refresh()
  global.entity_cache = {
    chunk_map = {},
    transport_lines = {},
    inventories = {},
    cube_crafters = {},
    cube_burners = {},
    inserters = {},
    vehicles = {},
    reactors = {},
    multi_furnaces = {},
  }
  cache = global.entity_cache
  for _, surface in pairs(game.surfaces) do
    if surface and surface.valid then
      for _, entity in pairs(surface.find_entities_filtered({force = "player"})) do
        entity_cache.add(entity)
      end
    end
  end
end

function entity_cache.on_load()
  cache = global.entity_cache
end

function entity_cache.get()
  return cache
end

entity_types = {
  transport_line = make_set({
    "transport-belt",
    "underground-belt",
    "splitter",
    "loader-1x1",
    "loader-1x2",
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
  reactor = make_set({
    "cube-nuclear-reactor",
    "cube-nuclear-reactor-online",
  }),
  multi_furnace = transition_table,
}

local transport_line_entity_types = entity_types.transport_line
local inventory_entity_types = entity_types.inventory
local cube_crafter_entity_types = entity_types.cube_crafter
local cube_burner_entity_types = entity_types.cube_burner
local vehicle_entity_types = entity_types.vehicle
local reactor_entities = entity_types.reactor
local multi_furnace_entities = entity_types.multi_furnace

function entity_cache.is_cube_crafter(entity)
  local categories = cube_management.recipe_categories()
  if cube_crafter_entity_types[entity.type] and entity.prototype.crafting_categories then
    for category, _ in pairs(entity.prototype.crafting_categories) do
      if categories[category] then
        return true
      end
    end
  end
  return false
end

function entity_cache.is_cube_burner(entity)
  return cube_burner_entity_types[entity.type] and entity.prototype.burner_prototype and
         entity.prototype.burner_prototype.burnt_inventory_size > 0
end

local is_cube_crafter = entity_cache.is_cube_crafter
local is_cube_burner = entity_cache.is_cube_burner

local function add_internal(entity, cache, is_global)
  local entity_type = entity.type
  local needs_chunk_cache = false
  if transport_line_entity_types[entity_type] then
    cache.transport_lines[entity.unit_number] = entity
    needs_chunk_cache = true
  end
  if inventory_entity_types[entity_type] then
    cache.inventories[entity.unit_number] = entity
    needs_chunk_cache = true
  end
  if is_cube_crafter(entity) then
    cache.cube_crafters[entity.unit_number] = entity
    needs_chunk_cache = true
  end
  if is_cube_burner(entity) then
    cache.cube_burners[entity.unit_number] = entity
    needs_chunk_cache = true
  end
  if entity_type == "inserter" then
    cache.inserters[entity.unit_number] = entity
    needs_chunk_cache = true
  end
  if vehicle_entity_types[entity_type] then
    cache.vehicles[entity.unit_number] = entity
    needs_chunk_cache = false
  end
  if entity_type == "reactor" and reactor_entities[entity.name] then
    cache.reactors[entity.unit_number] = entity
    needs_chunk_cache = false
  end
  if entity_type == "furnace" and multi_furnace_entities[entity.name] then
    cache.multi_furnaces[entity.unit_number] = entity
    needs_chunk_cache = false
  end
  return needs_chunk_cache
end

local function remove_internal(entity, cache, is_global)
  local entity_type = entity.type
  local needs_chunk_cache = false
  if transport_line_entity_types[entity_type] then
    cache.transport_lines[entity.unit_number] = nil
    needs_chunk_cache = true
  end
  if inventory_entity_types[entity_type] then
    cache.inventories[entity.unit_number] = nil
    needs_chunk_cache = true
  end
  if is_cube_crafter(entity) then
    cache.cube_crafters[entity.unit_number] = nil
    needs_chunk_cache = true
  end
  if is_cube_burner(entity) then
    cache.cube_burners[entity.unit_number] = nil
    needs_chunk_cache = true
  end
  if entity_type == "inserter" then
    cache.inserters[entity.unit_number] = nil
    needs_chunk_cache = true
  end
  if vehicle_entity_types[entity_type] then
    cache.vehicles[entity.unit_number] = nil
    needs_chunk_cache = false
  end
  if entity_type == "reactor" and reactor_entities[entity.name] then
    cache.reactors[entity.unit_number] = nil
    needs_chunk_cache = false
  end
  if entity_type == "furnace" and multi_furnace_entities[entity.name] then
    cache.multi_furnaces[entity.unit_number] = nil
    needs_chunk_cache = false
  end
  return needs_chunk_cache
end

function get_chunk_position(position)
  return math.floor(position.x / chunk_size), math.floor(position.y / chunk_size)
end

function get_chunk_index(surface_index, chunk_x, chunk_y)
  return surface_index .. "_" .. chunk_x .. "_" .. chunk_y
end

function entity_cache.add(entity)
  if not entity.unit_number or not add_internal(entity, cache, true) then
    return
  end

  local chunk_x, chunk_y = get_chunk_position(entity.position)
  local chunk_index = get_chunk_index(entity.surface_index, chunk_x, chunk_y)
  local chunk_cache = cache.chunk_map[chunk_index]
  if not chunk_cache then
    chunk_cache = {
      transport_lines = {},
      inventories = {},
      cube_crafters = {},
      cube_burners = {},
      inserters = {},
    }
    cache.chunk_map[chunk_index] = chunk_cache
  end
  add_internal(entity, chunk_cache, false)
end

function entity_cache.remove(entity, surface_index, position)
  if not entity.unit_number or not remove_internal(entity, cache, true) then
    return
  end

  local chunk_x, chunk_y = get_chunk_position(position or entity.position)
  local chunk_index = get_chunk_index(surface_index or entity.surface_index, chunk_x, chunk_y)
  local chunk_cache = cache.chunk_map[chunk_index]
  if chunk_cache then
    remove_internal(entity, chunk_cache, false)
    local next = next
    if next(chunk_cache.transport_lines) == nil and
       next(chunk_cache.inventories) == nil and
       next(chunk_cache.cube_crafters) == nil and
       next(chunk_cache.cube_burners) == nil and
       next(chunk_cache.inserters) == nil then
        cache.chunk_map[chunk_index] = nil
    end
  end
end

return entity_cache