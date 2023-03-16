require("scripts.lib")
require("scripts.cube_management")

local function add_result(result_set, item, entity)
  result_set[#result_set + 1] = {
    item = item,
    entity = entity,
    unit_number = entity.unit_number,
  }
end

local function cube_search_transport_lines(result_set, cache, item)
  for _, e in pairs(cache.transport_lines) do
    for i = 1, e.get_max_transport_line_index() do
      if e.get_transport_line(i).get_item_count(item) > 0 then
        add_result(result_set, item, e)
      end
    end
  end
end

local function cube_search_inventories(result_set, cache, item)
  for _, e in pairs(cache.inventories) do
    local inventory = e.get_main_inventory()
    if inventory and inventory.get_item_count(item) > 0 then
      add_result(result_set, item, e)
    end
  end
end

local function cube_search_crafters(result_set, cache, item)
  local recipes = cube_recipes()
  for _, e in pairs(cache.cube_crafters) do
    if e.is_crafting() then
      local recipe_data = recipes[e.get_recipe().name]
      if recipe_data and recipe_data.ingredients[item] then
        add_result(result_set, item, e)
      end
    end
    local output_inventory = e.get_output_inventory()
    if output_inventory and output_inventory.get_item_count(item) > 0 then
      add_result(result_set, item, e)
    end
  end
end

local function cube_search_burners(result_set, cache, item)
  if item == cubes.ultradense then
    for _, e in pairs(cache.cube_burners) do
      local fuel_inventory = e.get_fuel_inventory()
      if is_entity_burning_fuel(e, cubes.ultradense) or
        (fuel_inventory and fuel_inventory.get_item_count(cubes.ultradense) > 0) then
        add_result(result_set, cubes.ultradense, e)
      end
    end
  elseif item == cubes.dormant then
    for _, e in pairs(cache.cube_burners) do
      local burnt_result_inventory = e.get_burnt_result_inventory()
      if burnt_result_inventory and burnt_result_inventory.get_item_count(cubes.dormant) > 0 then
        add_result(result_set, cubes.dormant, e)
      end
    end
  end
end

local function cube_search_inserters(result_set, cache, item)
  for _, e in pairs(cache.inserters) do
    if e.held_stack.valid_for_read and e.held_stack.name == item then
      add_result(result_set, item, e)
    end
  end
end

local function cube_search_players(result_set, item)
  for _, player in pairs(game.players) do
    if player.character then
      if player_cube_data(player).ingredients[item] then
        add_result(result_set, item, player.character)
      end
    end
  end
end

local function cube_search_ground(result_set, item)
  for _, surface in pairs(game.surfaces) do
    for _, e in ipairs(surface.find_entities_filtered {type = "item-entity", name = "item-on-ground"}) do
      if e.stack.name == item then
        add_result(result_set, item, e)
      end
    end
  end
end

local function cube_search_full(item)
  -- TODO: spread full checks out over several ticks and then
  --       do localised searches based on known positions?
  local result_set = {}
  local cache = get_entity_cache()
  cube_search_transport_lines(result_set, cache, item)
  cube_search_inventories(result_set, cache, item)
  cube_search_crafters(result_set, cache, item)
  cube_search_burners(result_set, cache, item)
  cube_search_inserters(result_set, cache, item)
  cube_search_players(result_set, item)
  cube_search_ground(result_set, item)
  return result_set
end

local function get_cube_fx_source(result)
  local source = {
    item = result.item,
    entity = result.entity,
    position = result.entity.position,
    height = 0,
  }
  if result.entity.type == "character" then
    source.height = 0.5
  end
  if result.entity.effective_speed then
    source.velocity = from_polar(result.entity.effective_speed, result.entity.orientation)
  end
  if result.entity.type == "inserter" then
    source.position = result.entity.held_stack_position
  end
  if result.entity.type == "character" and
      result.entity.walking_state.walking then
    source.velocity = from_polar_orientation(result.entity.character_running_speed, result.entity.orientation)
  end
  if result.entity.type == "transport-belt" or
      result.entity.type == "splitter" then
    source.velocity = from_polar_orientation(result.entity.prototype.belt_speed, result.entity.orientation)
  end
  if result.entity.type == "underground-belt" then
    source.height = -1
  end
  if result.entity.type == "transport-belt" or
      result.entity.type == "underground-belt" then
    local v = from_polar_orientation(0.25, result.entity.orientation)
    for i = 1, result.entity.get_max_transport_line_index() do
      for _ = 1, result.entity.get_transport_line(i).get_item_count(result.item) do
        source.position = vector_add(source.position, i == 1 and {x = v.y, y = -v.x} or {x = -v.y, y = v.x})
      end
    end
  end
  return source
end

local function cube_boom(results)
  for _, r in ipairs(results) do
    local source = get_cube_fx_source(r)
    if source.item == cubes.dormant then
      source.entity.surface.create_entity {
        name = "cube-periodic-dormant-explosion",
        source = source.entity,
        position = source.position,
        target = source.position,
      }
    elseif source.velocity then
      source.entity.surface.create_entity {
        name = "cube-periodic-ultradense-projectile",
        source = source.entity,
        position = source.position,
        target = vector_add(source.position, source.velocity),
        speed = vector_length(source.velocity) / 8,
        max_range = 0,
      }
    else
      source.entity.surface.create_entity {
        name = "cube-periodic-ultradense-explosion",
        source = source.entity,
        position = source.position,
        target = source.position,
      }
    end
  end
end

local function cube_spark(results)
  for _, r in ipairs(results) do
    local source = get_cube_fx_source(r)
    if source.height >= 0 and not (source.item == cubes.dormant) then
      source.entity.surface.create_entity {
        name = source.height > 0 and "cube-periodic-ultradense-high-spark" or "cube-periodic-ultradense-low-spark",
        source = source.entity,
        position = source.position,
        target = source.position,
      }
    end
  end
end

-- TODO: show on map somehow.
function cube_fx_tick(tick)
  local spark_tick = tick % 6 == 0 and tick % 240 >= 120 and tick % 240 < 234
  local boom_tick = tick % 240 == 0
  local dormant_boom_tick = tick % 240 == 1
  if spark_tick then
    cube_spark(cube_search_full(cubes.ultradense))
  end
  if boom_tick then
    cube_boom(cube_search_full(cubes.ultradense))
  end
  if dormant_boom_tick then
    cube_boom(cube_search_full(cubes.dormant))
  end
end