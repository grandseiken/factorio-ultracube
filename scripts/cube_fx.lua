require("__Ultracube__/scripts/lib")
local cube_search = require("__Ultracube__/scripts/cube_search")
local cube_management = require("__Ultracube__/scripts/cube_management")

local cube_ultradense = cube_management.cubes.ultradense
local cube_dormant = cube_management.cubes.dormant
local cube_ultradense_phantom = cube_management.cubes.ultradense_phantom
local cube_dormant_phantom = cube_management.cubes.dormant_phantom
local legendary_iron_gear = cube_management.cubes.legendary_iron_gear

local ultradense_icon = {type = "item", name = cube_ultradense}
local dormant_icon = {type = "item", name = cube_dormant}
local ultradense_phantom_icon = {type = "item", name = cube_ultradense_phantom}
local dormant_phantom_icon = {type = "item", name = cube_dormant_phantom}

local ultralocomotion_fuel_map = {
  ["wood"] = "wood-ultralocomotion",
  ["coal"] = "coal-ultralocomotion",
  ["cube-condensed-fuel"] = "cube-condensed-fuel-ultralocomotion",
  ["cube-vehicle-fuel"] = "cube-vehicle-fuel-ultralocomotion",
  ["cube-nuclear-fuel"] = "cube-nuclear-fuel-ultralocomotion",
}
local ultralocomotion_fuel_inverse_map = inverse_map(ultralocomotion_fuel_map)
local cube_fuel_vehicle_entity_types = make_set({
  "locomotive", "car", "tank", "spider-vehicle",
})

local victory_statistics = nil
local cube_fx_data = nil
local cube_fx = {}

function cube_fx.refresh()
  global.cube_fx_data = {
    last_locomotives = {},
  }

  global.victory_statistics = global.victory_statistics or {
    distance_travelled_by_cube = 0,
    cube_last_position = nil,
  }

  cube_fx_data = global.cube_fx_data
  victory_statistics = global.victory_statistics
end

function cube_fx.on_load()
  cube_fx_data = global.cube_fx_data
  victory_statistics = global.victory_statistics
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
       cube_management.player_data(player).total_weight < 64 then
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
    if result.entity then
      if result.item == cube_ultradense_phantom or result.item == cube_dormant_phantom then
        local positions = result.positions
        if positions then
          for j = 1, #positions do
            local position = positions[j]
            phantom_explosion.source = result.entity
            phantom_explosion.position = position
            phantom_explosion.target = position
            result.entity.surface.create_entity(phantom_explosion)
          end
        else
          phantom_explosion.source = result.entity
          phantom_explosion.position = result.position
          phantom_explosion.target = result.position
          result.entity.surface.create_entity(phantom_explosion)
        end
      elseif result.item == cube_dormant then
        dormant_explosion.source = result.entity
        dormant_explosion.position = result.position
        dormant_explosion.target = result.position
        result.entity.surface.create_entity(dormant_explosion)
      elseif result.item == cube_ultradense then
        if result.velocity then
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
  end
end

local spark_high = {name = "cube-periodic-ultradense-high-spark"}
local spark_low = {name = "cube-periodic-ultradense-low-spark"}
local puff_high = {name = "cube-periodic-phantom-high-puff"}
local puff_low = {name = "cube-periodic-phantom-low-puff"}
local function cube_spark(size, results)
  for i = 1, size do
    local result = results[i]
    if result.entity and result.height >= 0 then
      if result.item == cube_ultradense then
        local spark = result.height > 0 and spark_high or spark_low
        spark.source = result.entity
        spark.position = result.position
        spark.target = result.position
        result.entity.surface.create_entity(spark)
      elseif result.item == cube_ultradense_phantom then
        local puff = result.height > 0 and puff_high or puff_low
        local positions = result.positions
        if positions then
          for j = 1, #positions do
            local position = positions[j]
            puff.source = result.entity
            puff.position = position
            puff.target = position
            result.entity.surface.create_entity(puff)
          end
        else
          puff.source = result.entity
          puff.position = result.position
          puff.target = result.position
          result.entity.surface.create_entity(puff)
        end
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
    if entity then
      local item = result.item
      local type = entity.type

      if (item == cube_ultradense or item == cube_dormant) and
        (type == "construction-robot" or type == "logistic-robot") then
        local last_robot = cube_fx_data.last_robot
        if last_robot and entity.energy < last_robot.energy then
          local drain = 1
          if type == "logistic-robot" then
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

      if item == cube_ultradense then
        if cube_fuel_vehicle_entity_types[type] and
           entity.speed > 1 / 8 and entity.burner and entity.burner.currently_burning and
           entity.burner.currently_burning.name == cube_ultradense then
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

        local train = nil
        local force = nil
        if type == "cargo-wagon" then
          force = entity.force
          train = entity.train
        elseif type == "character" then
          local vehicle = entity.vehicle
          if vehicle and (vehicle.type == "cargo-wagon" or vehicle.type == "locomotive") then
            force = entity.force
            train = vehicle.train
          end
        end

        if train and force and force.technologies["cube-transitive-ultralocomotion"] and
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
    if not new_locomotives[unit_number] and locomotive.valid and
       locomotive.burner and locomotive.burner.currently_burning then
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

local function cube_victory(size, results)
  local state = global.cube_victory_state
  if state == "victorious" then
    return
  end
  local has_cube = false
  local has_plate = false
  for i = 1, size do
    local item = results[i].item
    if item == cube_ultradense then
      has_cube = true
    elseif item == legendary_iron_gear then
      has_plate = true
    end
  end
  if has_plate and not has_cube and not state then
    global.cube_victory_state = "imminent"
  end
  if has_cube and not has_plate and state == "imminent" then
    global.cube_victory_state = "victorious"

    local bvs = remote.interfaces["better-victory-screen"]
    if bvs and bvs["trigger_victory"] then
      remote.call("better-victory-screen", "trigger_victory", game.forces["player"])
    else
      game.set_game_state {
        game_finished = true,
        player_won = true,
        can_continue = true,
        victorious_force = "player",
      }
    end
  end
end

local function track_victory_statistics(size, results)
  if size ~= 1 then return end  -- Only track distance travelled by main cube.
  local entity = results[1].entity
  if not entity or not entity.valid then return end

  local old = victory_statistics.cube_last_position
  local new = entity.position
  if old then
    local old_x = old.x
    local old_y = old.y
    local new_x = new.x
    local new_y = new.y
    if old_x ~= new_x or old_y ~= new_y then
      local dx = new_x - old_x
      local dy = new_y - old_y
      victory_statistics.distance_travelled_by_cube =
          victory_statistics.distance_travelled_by_cube + math.sqrt(dx * dx + dy * dy)
    end
  end
  victory_statistics.cube_last_position = new
end

function cube_fx.tick(tick)
  local update_tick = tick % 6 == 0
  if not update_tick then
    return
  end
  local alert_tick = tick % 24 == 12
  local spark_tick = tick % 240 >= 120 and tick % 240 < 234
  local boom_tick = tick % 240 == 0
  local size, results = cube_search.update(tick)
  if alert_tick then
    cube_alert(size, results)
  end
  track_victory_statistics(size, results)
  cube_victory(size, results)
  if cube_vehicle_mod(size, results) then
    return
  end

  local frequency = settings.global["cube-cube-fx-frequency"].value
  local cycle_length = 1
  if frequency == "low" then
    cycle_length = 2
  elseif frequency == "lower" then
    cycle_length = 4
  elseif frequency == "verylow" then
    cycle_length = 8
  elseif frequency == "off" then
    cycle_length = 0
  end

  if cycle_length == 1 or
     (cycle_length > 0 and
      (tick % (240 * cycle_length) == 0 or
       tick % (240 * cycle_length) >= 240 * cycle_length - 120)) then
    if spark_tick then
      cube_spark(size, results)
    end
    if boom_tick then
      cube_boom(size, results)
    end
  end
end

return cube_fx
