require("__Ultracube__/scripts/lib")
local cube_search = require("__Ultracube__/scripts/cube_search")
local cube_management = require("__Ultracube__/scripts/cube_management")
local cubecam = require("__Ultracube__/scripts/cubecam")

local cube_ultradense = cube_management.cubes.ultradense
local cube_dormant = cube_management.cubes.dormant
local cube_combustion = cube_management.cubes.combustion
local cube_dormant_combustion = cube_management.cubes.dormant_combustion
local cube_ultradense_phantom = cube_management.cubes.ultradense_phantom
local cube_dormant_phantom = cube_management.cubes.dormant_phantom
local legendary_iron_gear = cube_management.cubes.legendary_iron_gear

local cube_weight = cube_management.cube_weight
local cube_ultradense_fuel = cube_management.cube_ultradense_fuel
local alert_icons = make_set({
  cube_ultradense,
  cube_dormant,
  cube_combustion,
  cube_dormant_combustion,
  cube_ultradense_phantom,
  cube_dormant_phantom,
  legendary_iron_gear,
})

local ultralocomotion_fuel_map = {
  ["wood"] = "wood-ultralocomotion",
  ["coal"] = "coal-ultralocomotion",
  ["cube-condensed-fuel"] = "cube-condensed-fuel-ultralocomotion",
  ["cube-vehicle-fuel"] = "cube-vehicle-fuel-ultralocomotion",
  ["cube-nuclear-fuel"] = "cube-nuclear-fuel-ultralocomotion",
}
local ultralocomotion_fuel_inverse_map = inverse_map(ultralocomotion_fuel_map)
local cube_fuel_vehicle_entity_types = make_set({
  "locomotive", "car", "spider-vehicle",
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
    cube_idle_samples = 0,
    cube_working_samples = 0,
  }

  cube_fx_data = global.cube_fx_data
  victory_statistics = global.victory_statistics
end

function cube_fx.on_load()
  cube_fx_data = global.cube_fx_data
  victory_statistics = global.victory_statistics
end

local alert_type_custom = defines.alert_type.custom
local alert_type_custom_t = {type = alert_type_custom}
local function has_existing_alert(player)
  for _, surface in pairs(player.get_alerts(alert_type_custom_t)) do
    local alerts = surface[alert_type_custom]
    if alerts then
      for i = 1, #alerts do
        local a = alerts[i]
        if not (a.icon and a.icon.type == "item" and alert_icons[a.icon.name]) then
          return true
        end
      end
    end
  end
  return false
end

local custom_alert = {type = "item"}
local custom_alert_text = {"alert-description.cube-alert"}
local remove_alert_icon = {type = "item"}
local remove_alert_t = {type = alert_type_custom, icon = remove_alert_icon}
local function cube_alert(size, results, override)
  for _, player in pairs(game.players) do
    local alerts_enabled =
       player.controller_type == defines.controllers.character and
       player.mod_settings["cube-show-cube-alerts"].value and
       cube_management.player_data(player).total_weight < 1
    if alerts_enabled and (override or not has_existing_alert(player)) then
      player.remove_alert(alert_type_custom_t)
      for i = 1, size do
        local result = results[i]
        local entity = result.entity
        if entity and entity.valid then
          custom_alert.name = result.item
          player.add_custom_alert(result.entity, custom_alert, custom_alert_text, true)
        end
      end
    else
      for icon, _ in pairs(alert_icons) do
        remove_alert_icon.name = icon
        player.remove_alert(remove_alert_t)
      end
    end
  end
end

local fx_offset_map = {
  ["iron-chest"] = {x = 0, y = -0.2},
  ["cube-medium-container"] = {x = 0, y = -0.35},
  ["cube-big-container"] = {x = 0, y = -0.7},
  ["cube-boiler"] = {
    [defines.direction.north] = {x = 0, y = -0.2},
    [defines.direction.south] = {x = 0, y = -0.65},
    [defines.direction.east] = {x = -0.3, y = -0.6},
    [defines.direction.west] = {x = 0.4, y = -0.6},
  },
  ["cube-fuel-refinery"] = {
    [defines.direction.north] = {x = 0.95, y = -0.7},
    [defines.direction.south] = {x = -0.95, y = -1.45},
    [defines.direction.east] = {x = -0.35, y = 0},
    [defines.direction.west] = {x = 0, y = -1.45},
  },
  ["cube-recovery-bay"] = {x = 0, y = -0.5},
  ["cube-mystery-furnace"] = {x = 0, y = 0.75},
  ["cube-dimension-folding-engine"] = {x = -1.15, y = -1.6},
  ["cube-cyclotron"] = {x = -1.4, y = -0.25},
  ["cube-forbidden-ziggurat"] = {x = 0, y = -0.4},
  ["cube-experimental-teleporter"] = {x = 0, y = 1.25},
  ["cube-ultradense-furnace"] = {x = -1.15, y = -2.9},
  ["cube-nuclear-reactor-base"] = {x = 0, y = -1.5},
  ["cube-nuclear-reactor-online"] = {x = 0, y = -1.5},
  ["cube-deep-core-ultradrill"] = {x = 0, y = -1},
}

local function fx_offset(entity, position)
  if not entity or not entity.valid then
    return position
  end
  local entry = fx_offset_map[entity.name]
  if not entry then
    return position
  end
  local value = entry[entity.direction] or entry
  return {x = position.x + value.x, y = position.y + value.y}
end

local dormant_explosion = {name = "cube-periodic-dormant-explosion"}
local ultradense_explosion = {name = "cube-periodic-ultradense-explosion"}
local combustion_explosion = {name = "cube-periodic-combustion-explosion"}
local phantom_explosion = {name = "cube-periodic-phantom-explosion"}
local ultradense_projectile = {
  name = "cube-periodic-ultradense-projectile",
  max_range = 0,
  target = {},
}
local combustion_projectile = {
  name = "cube-periodic-combustion-projectile",
  max_range = 0,
  target = {},
}
local function cube_boom(size, results)
  for i = 1, size do
    local result = results[i]
    local entity = result.entity
    if not result.hidden then
      if entity and entity.valid then
        entity.create_build_effect_smoke()
      end

      if result.item == cube_ultradense_phantom or result.item == cube_dormant_phantom then
        local positions = result.positions
        if positions then
          for j = 1, #positions do
            local position = fx_offset(entity, positions[j])
            phantom_explosion.source = entity
            phantom_explosion.position = position
            phantom_explosion.target = position
            result.surface.create_entity(phantom_explosion)
          end
        else
          local position = fx_offset(entity, result.position)
          phantom_explosion.source = entity
          phantom_explosion.position = position
          phantom_explosion.target = position
          result.surface.create_entity(phantom_explosion)
        end
      elseif result.item == cube_dormant or result.item == cube_dormant_combustion then
        local position = fx_offset(entity, result.position)
        dormant_explosion.source = entity
        dormant_explosion.position = position
        dormant_explosion.target = position
        result.surface.create_entity(dormant_explosion)
      elseif result.item == cube_ultradense or result.item == cube_combustion then
        if result.velocity then
          local projectile =
              result.item == cube_combustion and combustion_projectile or ultradense_projectile
          local position = fx_offset(entity, result.position)
          local velocity = result.velocity
          projectile.source = result.entity
          projectile.position = position
          projectile.target.x = position.x + velocity.x
          projectile.target.y = position.y + velocity.y
          projectile.speed = math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y) / 8
          result.surface.create_entity(projectile)
        else
          local explosion =
              result.item == cube_combustion and combustion_explosion or ultradense_explosion
          local position = fx_offset(entity, result.position)
          explosion.source = entity
          explosion.position = position
          explosion.target = position
          result.surface.create_entity(explosion)
        end
      end
    end
  end
end

local spark_high = {name = "cube-periodic-ultradense-high-spark"}
local spark_low = {name = "cube-periodic-ultradense-low-spark"}
local combustion_spark_high = {name = "cube-periodic-combustion-high-spark"}
local combustion_spark_low = {name = "cube-periodic-combustion-low-spark"}
local puff_high = {name = "cube-periodic-phantom-high-puff"}
local puff_low = {name = "cube-periodic-phantom-low-puff"}
local function cube_spark(size, results)
  for i = 1, size do
    local result = results[i]
    local entity = result.entity
    if not result.hidden and result.height >= 0 then
      if result.item == cube_ultradense_phantom then
        local puff = result.height > 0 and puff_high or puff_low
        local positions = result.positions
        if positions then
          for j = 1, #positions do
            local position = fx_offset(entity, positions[j])
            puff.source = entity
            puff.position = position
            puff.target = position
            result.surface.create_entity(puff)
          end
        else
          local position = fx_offset(entity, result.position)
          puff.source = entity
          puff.position = position
          puff.target = position
          result.surface.create_entity(puff)
        end
      else
        local spark = nil
        if result.item == cube_ultradense then
          spark = result.height > 0 and spark_high or spark_low
        elseif result.item == cube_combustion then
          spark = result.height > 0 and combustion_spark_high or combustion_spark_low
        end
        if spark then
          local position = fx_offset(entity, result.position)
          spark.source = entity
          spark.position = position
          spark.target = position
          result.surface.create_entity(spark)
        end
      end
    end
  end
end

local cube_powered_prefix = "cube-powered-"
local cube_powered_cars_cache
local function get_cube_powered_cars()
  -- Set for cache, since this can be on_tick we care about minor performance improvements.
  if not cube_powered_cars_cache then
    cube_powered_cars_cache = {}
    for car_name, _ in pairs(game.get_filtered_entity_prototypes({{filter = "type", type = "car"}})) do
      if starts_with(car_name, cube_powered_prefix) then
        cube_powered_cars_cache[car_name] = string.sub(car_name, string.len(cube_powered_prefix) + 1)
      end
    end
  end
  return cube_powered_cars_cache
end

local car_swap_inventories = {
  defines.inventory.car_trunk,
  defines.inventory.car_ammo,
  defines.inventory.fuel,
  defines.inventory.burnt_result
}
local function swap_car(car, new_car_entity_name)
  local new_car = car.surface.create_entity {
    name = new_car_entity_name,
    -- Slightly off to avoid destroying the existing car, teleport later.
    position = {x = car.position.x, y = car.position.y + 10},
    direction = car.direction,
    force = car.force,
    player = car.last_user,
    raise_built = true,
    create_build_effect_smoke = false,
  }
  new_car.speed = car.speed
  new_car.orientation = car.orientation

  local driver = car.get_driver()
  local passenger = car.get_passenger()
  if driver then
    local riding_state = car.riding_state
    new_car.set_driver(driver)
    new_car.riding_state = riding_state  -- Continue the keypresses of the player.
  end
  if passenger then
    new_car.set_passenger(passenger)
  end

  for _, player in pairs(game.players) do
    if player.opened == car then
      player.opened = new_car
    end
  end

  for _, inventory in ipairs(car_swap_inventories) do
    transfer_inventory(car.get_inventory(inventory), new_car.get_inventory(inventory))
  end

  new_car.burner.currently_burning = car.burner.currently_burning
  new_car.burner.heat = car.burner.heat
  new_car.burner.remaining_burning_fuel = car.burner.remaining_burning_fuel

  local position = car.position
  car.burner.currently_burning = nil
  car.destroy({raise_destroy = true})
  new_car.teleport(position)
  cube_search.hint_entity(new_car)
  return new_car
end

local function cube_vehicle_mod(size, results)
  local cube_powered_cars = get_cube_powered_cars()
  local new_locomotives = {}
  local locomotive_fuel = {}
  local new_last_robot = false
  local boomed = false

  local cube_powered_cars_enabled = settings.global["cube-powered-cars"].value
  local last_car = cube_fx_data.last_car
  if last_car then
    if not last_car.valid then
      cube_fx_data.last_car = nil
    else
      local fuel = cube_management.get_entity_burning_fuel(last_car)
      if not (fuel and cube_ultradense_fuel[fuel]) then
        -- I don't know if you can realistically use an entire cube's worth of power just by driving, but just in case.
        local car_name = cube_powered_cars[last_car.name]
        if car_name then
          local swap_result = size >= 1 and results[1].entity == last_car
          local entity = swap_car(last_car, car_name)
          if swap_result then
            results[1].entity = entity
          end
        end
        cube_fx_data.last_car = nil
      end
    end
  end

  local new_last_furnace = nil
  for i = 1, size do
    local result = results[i]
    local entity = result.entity
    if entity and entity.valid then
      local item = result.item
      local type = entity.type
      local name = entity.name

      if name == "cube-ultradense-furnace" and cube_ultradense_fuel[item] and
         entity.status == defines.entity_status.working then
        new_last_furnace = entity
      end

      local weight = cube_weight[item]
      if weight and weight > 0 and (type == "construction-robot" or type == "logistic-robot") then
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

      if cube_powered_cars_enabled and type == "car" and not cube_powered_cars[name] then
        local fuel = cube_management.get_entity_burning_fuel(entity)
        if cube_ultradense_fuel[fuel] then
          entity = swap_car(entity, cube_powered_prefix .. name)
          result.entity = entity
          cube_fx_data.last_car = entity
        end
      end

      if cube_ultradense_fuel[item] then
        local fuel = cube_management.get_entity_burning_fuel(entity)
        if cube_fuel_vehicle_entity_types[type] and
           math.abs(entity.speed) > 1 / 8 and cube_ultradense_fuel[fuel] then
          local velocity = from_polar_orientation(math.min(2, entity.speed), entity.orientation)
          local explosion = fuel == cube_combustion and
              "cube-periodic-combustion-projectile" or "cube-periodic-ultradense-projectile"
          entity.surface.create_entity {
            name = explosion,
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
                locomotive_fuel[locomotive.unit_number] = item
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

  local last_furnace = cube_fx_data.last_furnace
  cube_fx_data.last_furnace = new_last_furnace
  if last_furnace and last_furnace.valid and
     (last_furnace.status ~= defines.entity_status.working or
      not new_last_furnace or new_last_furnace.unit_number ~= last_furnace.unit_number) then
    cube_fx_data.furnace_to_fix = last_furnace
  end

  for _, locomotive in pairs(new_locomotives) do
    local fuel = locomotive.burner.currently_burning.name
    local ultralocomotion_fuel = ultralocomotion_fuel_map[fuel]
    if ultralocomotion_fuel then
      locomotive.burner.currently_burning = ultralocomotion_fuel
    elseif ultralocomotion_fuel_inverse_map[fuel] and locomotive.speed > 1 / 8 then
      local velocity = from_polar_orientation(math.min(2, locomotive.speed), locomotive.orientation)
      local explosion = locomotive_fuel[locomotive.unit_number] == cube_combustion and
          "cube-periodic-combustion-projectile" or "cube-periodic-ultradense-projectile"
      locomotive.surface.create_entity {
        name = explosion,
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
        locomotive.burner.currently_burning = normal_fuel
      end
    end
  end
  cube_fx_data.last_locomotives = new_locomotives
  return boomed
end

local cube_utilisation_machine_types = make_set({"assembling-machine", "furnace", "boiler", "reactor"})
local cube_crafter_machine_types = make_set({"assembling-machine", "furnace"})
local function is_cube_working(entity, item)
  if entity.status ~= defines.entity_status.working then return false end
  if cube_management.is_entity_burning_fuel(entity, item) then return true end
  if not cube_crafter_machine_types[entity.type] then return false end
  local recipe = entity.get_recipe()
  if not recipe then return false end
  local cube_recipe = cube_management.recipes()[recipe.name]
  return cube_recipe and cube_recipe.ingredients[item] > 0
end

local function is_cube_working_character(entity, item)
  local queue = entity.crafting_queue
  if not queue or #queue == 0 then return false end
  local cube_recipe = cube_management.recipes()[queue[1].recipe]
  return cube_recipe and cube_recipe.ingredients[item] > 0
end

local function track_statistics(size, results)
  local cube_remote = global.cube_remote
  if not cube_remote then
    cube_remote = {}
    global.cube_remote = cube_remote
  end

  -- Track distance only when there's a single cube, since inconsistencies in result ordering
  -- makes it very difficult otherwise.
  local tracking_position = false
  if size == 1 then
    local entity = results[1].entity
    if entity and entity.valid then
      tracking_position = true
      local old = victory_statistics.cube_last_position
      local new = entity.position
      local distance_delta = 0
      if old then
        local old_x = old.x
        local old_y = old.y
        local new_x = new.x
        local new_y = new.y
        if old_x ~= new_x or old_y ~= new_y then
          local dx = new_x - old_x
          local dy = new_y - old_y
          distance_delta = math.sqrt(dx * dx + dy * dy)
          victory_statistics.distance_travelled_by_cube =
              victory_statistics.distance_travelled_by_cube + distance_delta
        end
      end
      cube_remote.position = new
      cube_remote.distance_delta = distance_delta
      victory_statistics.cube_last_position = new
    end
  end
  if not tracking_position then
    cube_remote.position = nil
    cube_remote.distance_delta = nil
    victory_statistics.cube_last_position = nil
  end

  cube_remote.is_working = false
  if size > 0 then
    -- Track cube utilisation. Pick one at random for a less-biased sampling.
    local result = results[math.random(size)]
    local entity = result.entity
    local item = result.item
    if entity and entity.valid then
      local entity_type = entity.type
      if (entity_type == "character" and is_cube_working_character(entity, item)) or
        (cube_utilisation_machine_types[entity_type] and is_cube_working(entity, item)) then
        cube_remote.is_working = true
        victory_statistics.cube_working_samples = (victory_statistics.cube_working_samples or 0) + 1
      else
        victory_statistics.cube_idle_samples = (victory_statistics.cube_idle_samples or 0) + 1
      end
    end
  end
  return cube_remote
end

function cube_fx.tick(tick)
  local update_tick = tick % 6 == 0
  if not update_tick then
    -- Workaround for ultradense furnace getting stuck at 99% if modules are changed during
    -- smelting (or possibly other situations?).
    local furnace_to_fix = cube_fx_data.furnace_to_fix
    if furnace_to_fix then
      if not furnace_to_fix.valid then
        cube_fx_data.furnace_to_fix = nil
      elseif furnace_to_fix.status ~= defines.entity_status.working then
        local progress = furnace_to_fix.crafting_progress
        if progress > 0.75 then
          furnace_to_fix.crafting_progress = 1.0
        end
        cube_fx_data.furnace_to_fix = nil
      end
    end
    -- We need to update locomotives every tick, since if they start burning a new item it
    -- won't be ultralocomotion and they'll immediately reset to normal maximum speed.
    for _, locomotive in pairs(cube_fx_data.last_locomotives) do
      if locomotive.valid then
        local burner = locomotive.burner
        if burner then
          local currently_burning = burner.currently_burning
          if currently_burning then
            local fuel = currently_burning.name
            local ultralocomotion_fuel = ultralocomotion_fuel_map[fuel]
            if ultralocomotion_fuel then
              burner.currently_burning = ultralocomotion_fuel
            end
          end
        end
      end
    end
    return
  end
  local alert_tick = tick % 24 == 12
  local alert_override_tick = tick % 240 >= 120
  local spark_tick = tick % 240 >= 120 and tick % 240 < 234
  local boom_tick = tick % 240 == 0
  local size, results = cube_search.update(tick)

  local x_min = nil
  local x_max = nil
  local y_min = nil
  local y_max = nil
  for i = 1, size do
    local position = results[i].position
    if position then
      local x = position.x
      local y = position.y
      if not x_min or x < x_min then x_min = x end
      if not x_max or x > x_max then x_max = x end
      if not y_min or y < y_min then y_min = y end
      if not y_max or y > y_max then y_max = y end
    end
  end
  if x_min then
    local e = nil
    local z = 1
    if size == 1 then
      local result = results[1]
      if result.entity and result.entity.valid then
        e = result.entity
      end
    else
      local d = math.max(x_max - x_min, y_max - y_min)
      if d > 20 then
        z = 20 / d
      end
    end
    local x = 0.5 * (x_min + x_max)
    local y = 0.5 * (y_min + y_max)
    cubecam.update_position(x, y, z, e)
  end

  if alert_tick then
    cube_alert(size, results, alert_override_tick)
  end
  local cube_remote = track_statistics(size, results)
  if x_min then
    cube_remote.min_position = {x = x_min, y = y_min}
    cube_remote.max_position = {x = x_max, y = y_max}
  else
    cube_remote.min_position = nil
    cube_remote.max_position = nil
  end
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
