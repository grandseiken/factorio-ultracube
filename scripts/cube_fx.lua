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
    utilization = {
      idle = 0,     -- The unit here doesn't matter, as long as it's consistent
      working = 0,  -- between `idle` and `working`.
    }
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

---Map to determine if some machine is using the cube
---in an "efficient" manner. Returns true if the cube is
---being used productively. Try to get out of the function
---as fast as possible!
---@type table<string, fun(entity: LuaEntity, cube_type: string): boolean>
local cube_machine_condition_handlers = {
  ["status"] = function(entity, cube_type)
    return entity.status == defines.entity_status.working
  end,
  ["crafter"] = function(entity, cube_type)
    if entity.status ~= defines.entity_status.working then return false end

    -- First handle the case where it could be a burner fuel source.
    local burner = entity.burner
    if burner
      and burner.currently_burning
      and burner.currently_burning.name == cube_type
    then
      return true
    end

    -- Now handle the case where it's an ingredient. At this point we don't
    -- have to verify that it's currently crafting because we know the status
    -- is working. Therefore we only have to check if it's an ingredient.
    local recipe = entity.get_recipe()
    if not recipe then return false end
    for  _, ingredient in pairs(recipe.ingredients) do
      if ingredient.name == cube_type then return true end
    end

    return false
  end,
  ['burner'] = function(entity, cube_type)
    if entity.status ~= defines.entity_status.working then return false end
    local burner = entity.burner
    if not burner then return false end
    -- Now we know this entity is currently burning
    if burner.currently_burning and burner.currently_burning.name == cube_type then return true end
    return false -- This burner is burning something else
  end,
  ["handcrafting"] = function(character, cube_type)
    -- We could search through the crafting queue, but this function
    -- needs to be quick because it's called every 6 ticks. Lets
    -- rather assume that if the player doesn't have it in their
    -- inventory or cursor then the player is crafting with it.
    -- That doesn't handle it being in queues though, but it's
    -- better than nothing.
    local player = character.player
    if not player then return false end
    local cursor_stack = player.cursor_stack
    if cursor_stack.valid and cursor_stack.valid_for_read then
      if cursor_stack.name == cube_type then return false end
    end
    local inventory = player.get_main_inventory()
    if inventory.find_item_stack(cube_type) then return false end
    return true
  end,
}

---Map to determine in which machine types the cube can be
---seen as being "utilization". The value will show what 
---requirement this machine has to be "productive" with
---the cube. 
---@type table<string, fun(entity: LuaEntity, cube_type: string): boolean>
local cube_working_machine_types = {
  ["character"]           = cube_machine_condition_handlers["handcrafting"],

  -- These two types could have the cube as a burner source or as ingredient
  ["assembling-machine"]  = cube_machine_condition_handlers["crafter"],
  ["furnace"]             = cube_machine_condition_handlers["crafter"],
  ["rocket-silo"]         = cube_machine_condition_handlers["crafter"],

  -- For the following entity-types we only ever have to check the entity status.
  -- This is because in 99% of cases if the cube can only be placed in the machine
  -- then it has to be an ingredient or fuel. And thus, if the cube is in a machine
  -- and it's not currently "working" then it would mean the cube is idling due to
  -- `no_fuel`, `output_full`, `no_ingredients`, etc.
  ["generator"]           = cube_machine_condition_handlers["status"],
  ["burner-generator"]    = cube_machine_condition_handlers["status"],

  -- The boiler and reactor could have the cube currently being burned, or sitting
  -- in the burnt_result slot while an alternative fuel is being used.
  -- Thus we'll add a special check to ensure it's burning the cube.
  ["boiler"]              = cube_machine_condition_handlers["burner"],
  ["reactor"]             = cube_machine_condition_handlers["burner"],
}

local function track_victory_statistics(size, results)

  -- We will only track the distance if there is only one cube.
  -- There is no guarentee to the order of results, meaning the 
  -- new position might not relate to the old position, resulting
  -- in really bad measurements. Therefore when the cube is split
  -- apart we clear the previous_position, only only start tracking
  -- again when the cube is back into one piece.
  -- The last position is nilled when:
  --   - There are no cubes
  --   - There are more than one cube
  --   - The one cube is invalid for some reason (should never happen)
  if size == 1 then
    local entity = results[1].entity
    if entity and entity.valid then
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
    else
      victory_statistics.cube_last_position = nil -- Invalid entity
    end
  else
    victory_statistics.cube_last_position = nil   -- Wrong number of cubes
  end

  -- Track cube "utilization". This is done when there is at least one cube.
  -- Something is wrong when there are no cubes so we won't count that as idling.
  -- When there are multiple cubes we will pick one at random to get
  -- a less biased sampling
  if size > 0 then
    local entity = results[math.random(size)].entity
    if not (entity and entity.valid) then return end -- Should never happen
    local machine_conditional = cube_working_machine_types[entity.type]
    if machine_conditional and machine_conditional(entity, results[1].item) then
      -- The cube is in some entity that's using the cube "utilization"
      victory_statistics.utilization.working = victory_statistics.utilization.working + 1
    else
      -- The cube is idling!
      victory_statistics.utilization.idle = victory_statistics.utilization.idle + 1
    end
  end
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
