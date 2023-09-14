require("__Ultracube__/scripts/lib")
require("__Ultracube__/scripts/cube_search")

local cube_ultradense = cubes.ultradense
local cube_dormant = cubes.dormant
local ultradense_icon = {type = "item", name = cube_ultradense}
local dormant_icon = {type = "item", name = cube_dormant}
local ultralocomotion_fuel_map = {
  ["wood"] = "cube-wood-ultralocomotion",
  ["coal"] = "cube-coal-ultralocomotion",
  ["cube-condensed-fuel"] = "cube-condensed-fuel-ultralocomotion",
}
local ultralocomotion_fuel_inverse_map = inverse_map(ultralocomotion_fuel_map)
local cube_fuel_vehicle_entity_types = make_set({
  "locomotive", "car", "tank", "spider-vehicle"
})

local cube_fx_data = nil

function refresh_cube_fx_data()
  global.cube_fx_data = {
    last_locomotives = {},
  }
  cube_fx_data = global.cube_fx_data
end

function cube_fx_data_on_load()
  cube_fx_data = global.cube_fx_data
end

local function cube_alert(results)
  for _, player in pairs(game.players) do
    player.remove_alert {type = defines.alert_type.custom, ultradense_icon}
    player.remove_alert {type = defines.alert_type.custom, dormant_icon}
  end

  for i = 1, #results do
    local result = results[i]
    for _, player in pairs(game.players) do
      if player.controller_type == defines.controllers.character and
         player.mod_settings["cube-show-cube-alerts"].value and
         player_cube_data(player).total_weight == 0 then
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

local function cube_vehicle_mod(results)
  local new_locomotives = {}
  local new_last_robot = false
  local boomed = false

  for i = 1, #results do
    local result = results[i]
    local entity = result.entity

    if (result.item == cube_ultradense or result.item == cube_dormant) and
       (entity.type == "construction-robot" or entity.type == "logistic-robot") then
      local last_robot = cube_fx_data.last_robot
      if last_robot and entity.energy < last_robot.energy then
        local drain = 1
        if entity.type == "logistic-robot" then
          drain = 10
        end
        drain = 15000 * drain * vector_length(vector_sub(entity.position, last_robot.position))
        entity.energy = math.max(0, entity.energy - drain)
      end
      cube_fx_data.last_robot = {
        position = entity.position,
        energy = entity.energy,
      }
      new_last_robot = true
    end

    if result.item == cube_ultradense and cube_fuel_vehicle_entity_types[entity.type] and
       entity.speed > 1 / 8 and entity.burner and entity.burner.currently_burning and
       entity.burner.currently_burning.name == cube_ultradense  then
      local velocity = from_polar_orientation(math.min(2, entity.speed), entity.orientation)
      entity.surface.create_entity {
        name = "cube-periodic-ultradense-projectile",
        source = entity,
        position = entity.position,
        target = vector_add(entity.position, velocity),
        speed = vector_length(velocity) / 64,
        max_range = 0,
      }
      boomed = true
    end

    if result.item == cube_ultradense and entity.type == "cargo-wagon" then
      local force = entity.force
      local train = entity.train
      if train and force.technologies["cube-transitive-ultralocomotion"] and
         force.technologies["cube-transitive-ultralocomotion"].researched then
        for _, a in pairs(train.locomotives) do
          for j = 1, #a do
            local locomotive = a[j]
            if locomotive.burner and locomotive.burner.currently_burning then
              new_locomotives[locomotive.unit_number] = locomotive
            end
          end
        end
      end
    end
  end

  if not new_last_robot then
    cube_fx_data.last_robot = nil
  end

  for _, locomotive in pairs(new_locomotives) do
    local fuel = locomotive.burner.currently_burning.name
    local ultralocomotion_fuel = ultralocomotion_fuel_map[fuel]
    if ultralocomotion_fuel then
      locomotive.burner.currently_burning = game.item_prototypes[ultralocomotion_fuel]
    elseif ultralocomotion_fuel_inverse_map[fuel] and locomotive.speed > 1 / 8 then
      local velocity = from_polar_orientation(math.min(2, locomotive.speed), locomotive.orientation)
      locomotive.surface.create_entity {
        name = "cube-periodic-ultradense-projectile",
        source = locomotive,
        position = locomotive.position,
        target = vector_add(locomotive.position, velocity),
        speed = vector_length(velocity) / 64,
        max_range = 0,
      }
      boomed = true
    end
  end
  for unit_number, locomotive in pairs(cube_fx_data.last_locomotives) do
    if not new_locomotives[unit_number] and locomotive.burner and
       locomotive.burner.currently_burning then
      local ultralocomotion_fuel = locomotive.burner.currently_burning.name
      local normal_fuel = ultralocomotion_fuel_inverse_map[ultralocomotion_fuel]
      if normal_fuel then
        locomotive.burner.currently_burning = game.item_prototypes[normal_fuel]
      end
    end
  end
  cube_fx_data.last_locomotives = new_locomotives
  return boomed
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
  if cube_vehicle_mod(search_results) then
    return
  end
  if spark_tick then
    cube_spark(search_results)
  end
  if boom_tick then
    cube_boom(search_results)
  end
end
