require("scripts.lib")
require("scripts.cube_management")

local entity_cache = nil

function refresh_entity_cache()
  global.entity_cache = {
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

local transport_line_entity_types = make_set({
  "transport-belt",
  "underground-belt",
  "splitter",
})

local inventory_entity_types = make_set({
  "reactor",
  "lab",
  "container",
  "logistic-container",
  "infinity-container",
  "character-corpse",
})

local cube_crafter_entity_types = make_set({
  "furnace",
  "assembling-machine",
  "rocket-silo",
})

local cube_burner_entity_types = make_set({
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
})

local vehicle_entity_types = make_set({
  "car",
  "locomotive",
  "cargo-wagon",
  "spider-vehicle",
})

local function is_cube_crafter(entity)
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

local function is_cube_burner(entity)
  return cube_burner_entity_types[entity.type] and entity.prototype.burner_prototype and
         entity.prototype.burner_prototype.fuel_categories[cube_defines.fuel_category]
end

local function get_entity_chunk_index(entity)
  return nil -- TODO
end

function add_entity_cache_internal(entity, cache, is_global)
  if transport_line_entity_types[entity.type] then
    entity_cache.transport_lines[entity.unit_number] = entity
  end
  if inventory_entity_types[entity.type] then
    entity_cache.inventories[entity.unit_number] = entity
  end
  if is_cube_crafter(entity) then
    entity_cache.cube_crafters[entity.unit_number] = entity
  end
  if is_cube_burner(entity) then
    entity_cache.cube_burners[entity.unit_number] = entity
  end
  if entity.type == "inserter" then
    entity_cache.inserters[entity.unit_number] = entity
  end
  if vehicle_entity_types[entity.type] then
    entity_cache.vehicles[entity.unit_number] = entity
  end
end

function remove_entity_cache_internal(entity, cache, is_global)
  if transport_line_entity_types[entity.type] then
    entity_cache.transport_lines[entity.unit_number] = nil
  end
  if inventory_entity_types[entity.type] then
    entity_cache.inventories[entity.unit_number] = nil
  end
  if is_cube_crafter(entity) then
    entity_cache.cube_crafters[entity.unit_number] = nil
  end
  if is_cube_burner(entity) then
    entity_cache.cube_burners[entity.unit_number] = nil
  end
  if entity.type == "inserter" then
    entity_cache.inserters[entity.unit_number] = nil
  end
  if vehicle_entity_types[entity.type] then
    entity_cache.vehicles[entity.unit_number] = nil
  end
end


function add_entity_cache(entity)
  add_entity_cache_internal(entity, entity_cache, true)
  local chunk_index = get_entity_chunk_index(entity)
  if chunk_index then
    local chunk_cache = entity_cache.chunk_map[chunk_index]
    if not chunk_cache then
      chunk_cache = {}
      entity_cache.chunk_map[chunk_index] = chunk_cache
    end
    add_entity_cache_internal(entity, chunk_cache, true)
  end
end

function remove_entity_cache(entity)
  remove_entity_cache_internal(entity, entity_cache, true)
  local chunk_index = get_entity_chunk_index(entity)
  if chunk_index then
    local chunk_cache = entity_cache.chunk_map[chunk_index]
    if chunk_cache then
      remove_entity_cache_internal(entity, chunk_cache, false)
    end
  end
end