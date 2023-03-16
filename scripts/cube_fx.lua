require("scripts.lib")
require("scripts.cube_management")

local function cube_search_full(surface)
  -- TODO: spread full checks out over several ticks and then
  --       do localised searches based on known positions.
  local result = {}
  for _, item in pairs(cubes) do
    local search_inventory_parameters = {
      force = "player",
      has_item_inside = game.item_prototypes[item],
    }
    for _, e in ipairs(surface.find_entities_filtered(search_inventory_parameters)) do
      result[#result + 1] = {
        item = item,
        entity = e,
      }
    end
  end
  for _, e in ipairs(surface.find_entities_filtered {type = "item-entity", name = "item-on-ground"}) do
    if cube_info[e.stack.name] then
      result[#result + 1] = {
        item = e.stack.name,
        entity = e,
      }
    end
  end
  local search_machine_parameters = {
    type = {"inserter", "boiler", "burner-generator", "furnace", "assembling-machine", "rocket-silo"},
  }
  local recipes = cube_recipes()
  for _, e in ipairs(surface.find_entities_filtered(search_machine_parameters)) do
    if is_entity_burning_fuel(e, cubes.ultradense) then
      result[#result + 1] = {
        item = cubes.ultradense,
        entity = e,
      }
    end
    if (e.type == "furnace" or e.type == "assembling-machine" or e.type == "rocket-silo") and e.is_crafting() then
      local data = recipes[e.get_recipe().name]
      if data then
        for k, _ in pairs(data) do
          if cube_info[k] then
            result[#result + 1] = {
              item = k,
              entity = e,
            }
          end
        end
      end
    end
    if e.type == "inserter" and e.held_stack.valid_for_read and cube_info[e.held_stack.name] then
      result[#result + 1] = {
        item = e.held_stack.name,
        entity = e,
      }
    end
  end
  for _, player in pairs(game.players) do
    if player.character and player.character.surface_index == surface.index then
      for k, _ in pairs(player_cube_data(player)) do
        if cube_info[k] then
          result[#result + 1] = {
            item = k,
            entity = player.character,
          }
        end
      end
    end
  end
  return result
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

local function cube_boom(surface, results)
  for _, r in ipairs(results) do
    local source = get_cube_fx_source(r)
    if source.item == cubes.dormant then
      surface.create_entity {
        name = "cube-periodic-dormant-explosion",
        source = source.entity,
        position = source.position,
        target = source.position,
      }
    elseif source.velocity then
      surface.create_entity {
        name = "cube-periodic-ultradense-projectile",
        source = source.entity,
        position = source.position,
        target = vector_add(source.position, source.velocity),
        speed = vector_length(source.velocity) / 8,
        max_range = 0,
      }
    else
      surface.create_entity {
        name = "cube-periodic-ultradense-explosion",
        source = source.entity,
        position = source.position,
        target = source.position,
      }
    end
  end
end

local function cube_spark(surface, results)
  for _, r in ipairs(results) do
    local source = get_cube_fx_source(r)
    if source.height >= 0 and not (source.item == cubes.dormant) then
      surface.create_entity {
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
  local cube_results = nil
  local spark_tick = tick % 6 == 0 and tick % 240 >= 120 and tick % 240 < 234
  local boom_tick = tick % 240 == 0
  if spark_tick or boom_tick then
    cube_results = cube_search_full(game.surfaces[1])
  end
  if spark_tick then
    cube_spark(game.surfaces[1], cube_results)
  end
  if boom_tick then
    cube_boom(game.surfaces[1], cube_results)
  end
end