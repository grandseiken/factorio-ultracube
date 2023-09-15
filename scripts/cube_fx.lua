require("__Ultracube__/scripts/lib")
require("__Ultracube__/scripts/cube_search")

local cube_ultradense = cubes.ultradense
local cube_dormant = cubes.dormant
local cube_ultradense_phantom = cubes.ultradense_phantom
local cube_dormant_phantom = cubes.dormant_phantom

local ultradense_icon = {type = "item", name = cube_ultradense}
local dormant_icon = {type = "item", name = cube_dormant}
local ultradense_phantom_icon = {type = "item", name = cube_ultradense_phantom}
local dormant_phantom_icon = {type = "item", name = cube_dormant_phantom}

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

local custom_alert = {type = "item"}
local custom_alert_text = {"alert-description.cube-alert"}
local function cube_alert(size, results)
  for _, player in pairs(game.players) do
    player.remove_alert {type = defines.alert_type.custom, ultradense_icon}
    player.remove_alert {type = defines.alert_type.custom, dormant_icon}
    player.remove_alert {type = defines.alert_type.custom, ultradense_phantom_icon}
    player.remove_alert {type = defines.alert_type.custom, dormant_phantom_icon}

    if player.controller_type == defines.controllers.character and
       player.mod_settings["cube-show-cube-alerts"].value and
       player_cube_data(player).total_weight == 0 then
      for i = 1, size do
        local result = results[i]
        custom_alert.name = result.item
        player.add_custom_alert(result.entity, custom_alert, custom_alert_text, true)
      end
    end
  end
end

local dormant_explosion = {name = "cube-periodic-dormant-explosion"}
local ultradense_explosion = {name = "cube-periodic-ultradense-explosion"}
local phantom_explosion = {name = "cube-periodic-phantom-explosion"}
local ultradense_projectile = {
  name = "cube-periodic-ultradense-projectile",
  max_range = 0,
  target = {},
}
local function cube_boom(size, results)
  for i = 1, size do
    local result = results[i]
    if result.item == cubes.dormant or result.item == cubes.dormant_phantom then
      dormant_explosion.source = result.entity
      dormant_explosion.position = result.position
      dormant_explosion.target = result.position
      result.entity.surface.create_entity(dormant_explosion)
    elseif result.item == cubes.ultradense_phantom then
      phantom_explosion.source = result.entity
      phantom_explosion.position = result.position
      phantom_explosion.target = result.position
      result.entity.surface.create_entity(phantom_explosion)
    elseif result.velocity then
      local position = result.position
      local velocity = result.velocity
      ultradense_projectile.source = result.entity
      ultradense_projectile.position = position
      ultradense_projectile.target.x = position.x + velocity.x
      ultradense_projectile.target.y = position.y + velocity.y
      ultradense_projectile.speed = math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y) / 8
      result.entity.surface.create_entity(ultradense_projectile)
    else
      ultradense_explosion.source = result.entity
      ultradense_explosion.position = result.position
      ultradense_explosion.target = result.position
      result.entity.surface.create_entity(ultradense_explosion)
    end
  end
end

local spark_high = {name = "cube-periodic-ultradense-high-spark"}
local spark_low = {name = "cube-periodic-ultradense-low-spark"}
local puff_high = {name = "cube-periodic-phantom-high-puff"}
local puff_low = {name = "cube-periodic-phantom-low-puff"}
local function cube_spark(size, results)
  for i = 1, size do
    local result = results[i]
    if result.height >= 0 then
      if result.item == cubes.ultradense then
        local spark = result.height > 0 and spark_high or spark_low
        spark.source = result.entity
        spark.position = result.position
        spark.target = result.position
        result.entity.surface.create_entity(spark)
      elseif result.item == cubes.ultradense_phantom then
        local puff = result.height > 0 and puff_high or puff_low
        puff.source = result.entity
        puff.position = result.position
        puff.target = result.position
        result.entity.surface.create_entity(puff)
      end
    end
  end
end

local function cube_vehicle_mod(size, results)
  local new_locomotives = {}
  local new_last_robot = false
  local boomed = false

  for i = 1, size do
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
  local size, results = cube_search_update(tick)
  if alert_tick then
    cube_alert(size, results)
  end
  if cube_vehicle_mod(size, results) then
    return
  end
  if spark_tick then
    cube_spark(size, results)
  end
  if boom_tick then
    cube_boom(size, results)
  end
end
