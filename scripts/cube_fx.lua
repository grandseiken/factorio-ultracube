require("scripts.lib")
require("scripts.cube_search")

local ultradense_icon = {type = "item", name = cubes.ultradense}
local dormant_icon = {type = "item", name = cubes.ultradense}

local function cube_alert(results)
  for _, player in pairs(game.players) do
    player.remove_alert {type = defines.alert_type.custom, ultradense_icon}
    player.remove_alert {type = defines.alert_type.custom, dormant_icon}
  end

  for i = 1, #results do
    local result = results[i]
    for _, player in pairs(game.players) do
      if player.mod_settings["cube-show-cube-alerts"].value then
        player.add_custom_alert(result.entity, {type = "item", name = result.item},
                                {"alert-description.cube-alert"}, true)
      end
    end
  end
end

local function cube_boom(results)
  for i = 1, #results do
    local result = results[i]
    if result.item == cubes.dormant then
      result.entity.surface.create_entity {
        name = "cube-periodic-dormant-explosion",
        source = result.entity,
        position = result.position,
        target = result.position,
      }
    else
      if result.velocity then
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
end

local function cube_spark(results)
  for i = 1, #results do
    local result = results[i]
    if result.height >= 0 and result.item ~= cubes.dormant then
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
  local update_tick = tick % 6 == 0
  local alert_tick = update_tick and tick % 24 == 12
  local spark_tick = update_tick and tick % 240 >= 120 and tick % 240 < 234
  local boom_tick = update_tick and tick % 240 == 0
  if not update_tick then
    return
  end
  local search_results = cube_search_update(tick)
  if alert_tick then
    cube_alert(search_results)
  end
  if spark_tick then
    cube_spark(search_results)
  end
  if boom_tick then
    cube_boom(search_results)
  end
end
