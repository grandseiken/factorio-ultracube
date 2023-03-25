require("scripts.lib")
require("scripts.cube_search")

local function cube_boom(results)
  for _, result in ipairs(results) do
    if result.item == cubes.dormant then
      result.entity.surface.create_entity {
        name = "cube-periodic-dormant-explosion",
        source = result.entity,
        position = result.position,
        target = result.position,
      }
    elseif result.velocity then
      result.entity.surface.create_entity {
        name = "cube-periodic-ultradense-projectile",
        source = result.entity,
        position = result.position,
        target = vector_add(result.position, result.velocity),
        speed = vector_length(result.velocity) / 8,
        max_range = 0,
      }
    else
      result.entity.surface.create_entity {
        name = "cube-periodic-ultradense-explosion",
        source = result.entity,
        position = result.position,
        target = result.position,
      }
    end
  end
end

local function cube_spark(results)
  for _, result in ipairs(results) do
    if result.height >= 0 and not (result.item == cubes.dormant) then
      result.entity.surface.create_entity {
        name = result.height > 0 and "cube-periodic-ultradense-high-spark" or "cube-periodic-ultradense-low-spark",
        source = result.entity,
        position = result.position,
        target = result.position,
      }
    end
  end
end

function cube_fx_tick(tick)
  -- TODO: show cube on map somehow.
  local update_tick = tick % 6 == 0
  local spark_tick = update_tick and tick % 240 >= 120 and tick % 240 < 234
  local boom_tick = update_tick and tick % 240 == 0
  if not update_tick then
    return
  end
  local search_results = cube_search_update()
  if spark_tick then
    cube_spark(search_results)
  end
  if boom_tick then
    cube_boom(search_results)
  end
end
