require("__Ultracube__/scripts/lib")
local cube_search = require("__Ultracube__/scripts/cube_search")
local cube_management = require("__Ultracube__/scripts/cube_management")

local cube_ultradense = cube_management.cubes.ultradense
local cube_dormant = cube_management.cubes.dormant
local cube_ultradense_phantom = cube_management.cubes.ultradense_phantom
local cube_dormant_phantom = cube_management.cubes.dormant_phantom
local legendary_iron_gear = cube_management.cubes.legendary_iron_gear
local alert_icons = make_set({cube_ultradense, cube_dormant, cube_ultradense_phantom, cube_dormant_phantom, legendary_iron_gear})

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
        custom_alert.name = result.item
        player.add_custom_alert(result.entity, custom_alert, custom_alert_text, true)
      end
    else
      for icon, _ in pairs(alert_icons) do
        remove_alert_icon.name = icon
        player.remove_alert(remove_alert_t)
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
            result.surface.create_entity(phantom_explosion)
          end
        else
          phantom_explosion.source = result.entity
          phantom_explosion.position = result.position
          phantom_explosion.target = result.position
          result.surface.create_entity(phantom_explosion)
        end
      elseif result.item == cube_dormant then
        dormant_explosion.source = result.entity
        dormant_explosion.position = result.position
        dormant_explosion.target = result.position
        result.surface.create_entity(dormant_explosion)
      elseif result.item == cube_ultradense then
        if result.velocity then
        local position = result.position
        local velocity = result.velocity
        ultradense_projectile.source = result.entity
        ultradense_projectile.position = position
        ultradense_projectile.target.x = position.x + velocity.x
        ultradense_projectile.target.y = position.y + velocity.y
        ultradense_projectile.speed = math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y) / 8
        result.surface.create_entity(ultradense_projectile)
        else
          ultradense_explosion.source = result.entity
          ultradense_explosion.position = result.position
          ultradense_explosion.target = result.position
          result.surface.create_entity(ultradense_explosion)
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
        result.surface.create_entity(spark)
      elseif result.item == cube_ultradense_phantom then
        local puff = result.height > 0 and puff_high or puff_low
        local positions = result.positions
        if positions then
          for j = 1, #positions do
            local position = positions[j]
            puff.source = result.entity
            puff.position = position
            puff.target = position
            result.surface.create_entity(puff)
          end
        else
          puff.source = result.entity
          puff.position = result.position
          puff.target = result.position
          result.surface.create_entity(puff)
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
  cube_search.hint_entity(new_car)

  local position = car.position
  car.destroy({raise_destroy = true})
  new_car.teleport(position)
  cube_search.hint_entity(new_car)
  return new_car
end

local function cube_vehicle_mod(size, results)
  local cube_powered_cars = get_cube_powered_cars()
  local new_locomotives = {}
  local new_last_robot = false
  local boomed = false

  local cube_powered_cars_enabled = settings.global["cube-powered-cars"].value
  local last_car = cube_fx_data.last_car
  if last_car then
    if not last_car.valid then
      cube_fx_data.last_car = nil
    elseif not cube_management.is_entity_burning_fuel(last_car, cube_ultradense) then
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

      if cube_powered_cars_enabled and type == "car" and not cube_powered_cars[entity.name] and
         cube_management.is_entity_burning_fuel(entity, cube_ultradense) then
        entity = swap_car(entity, cube_powered_prefix .. entity.name)
        result.entity = entity
        cube_fx_data.last_car = entity
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

local function track_victory_statistics(size, results)
  -- Track distance only when there's a single cube, since inconsistencies in result ordering
  -- makes it very difficult otherwise.
  local tracking_position = false
  if size == 1 then
    local entity = results[1].entity
    if entity and entity.valid then
      tracking_position = true
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
  end
  if not tracking_position then
    victory_statistics.cube_last_position = nil
  end

  if size > 0 then
    -- Track cube utilisation. Pick one at random for a less-biased sampling.
    local result = results[math.random(size)]
    local entity = result.entity
    local item = result.item
    local entity_type = entity.type
    if not (entity and entity.valid) then return end -- Should never happen
    if (entity_type == "character" and is_cube_working_character(entity, item)) or
       (cube_utilisation_machine_types[entity_type] and is_cube_working(entity, item)) then
      victory_statistics.cube_working_samples = (victory_statistics.cube_working_samples or 0) + 1
    else
      victory_statistics.cube_idle_samples = (victory_statistics.cube_idle_samples or 0) + 1
    end
  end
end

function cube_fx.tick(tick)
  local update_tick = tick % 6 == 0
  if not update_tick then
    return
  end
  local alert_tick = tick % 24 == 12
  local alert_override_tick = tick % 240 >= 120
  local spark_tick = tick % 240 >= 120 and tick % 240 < 234
  local boom_tick = tick % 240 == 0
  local size, results = cube_search.update(tick)
  if alert_tick then
    cube_alert(size, results, alert_override_tick)
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
