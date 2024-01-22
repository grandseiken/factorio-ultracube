local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local construction_robot = data.raw["construction-robot"]["construction-robot"]
local logistic_robot = data.raw["logistic-robot"]["logistic-robot"]

construction_robot.energy_per_tick = "0.02kJ"
construction_robot.energy_per_move = "2kJ"

local logistic_robot_0 = {
  type = "logistic-robot",
  name = "cube-logistic-robot-0",
  localised_name = {"entity-name.logistic-robot"},
  icon = "__base__/graphics/icons/logistic-robot.png",
  icon_size = 64, icon_mipmaps = 4,
  flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
  minable = {mining_time = 0.1, result = "cube-logistic-robot-0"},
  resistances = {
    {
      type = "fire",
      percent = 85
    },
  },
  max_health = 100,
  collision_box = {{0, 0}, {0, 0}},
  selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
  hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
  damaged_trigger_effect = hit_effects.flying_robot(),
  dying_explosion = "logistic-robot-explosion",
  max_payload_size = 1,
  speed = 0.05,
  max_energy = "1.5MJ",
  energy_per_tick = "0.05kJ",
  speed_multiplier_when_out_of_energy = 0.2,
  energy_per_move = "5kJ",
  min_to_charge = 0.2,
  max_to_charge = 0.95,
  working_sound = sounds.flying_robot(0.48),
  cargo_centered = {0.0, 0.2},
  water_reflection = logistic_robot.water_reflection,
  idle = logistic_robot.idle,
  idle_with_cargo = logistic_robot.idle_with_cargo,
  in_motion = logistic_robot.in_motion,
  in_motion_with_cargo = logistic_robot.in_motion_with_cargo,
  shadow_idle = logistic_robot.shadow_idle,
  shadow_idle_with_cargo = logistic_robot.shadow_idle_with_cargo,
  shadow_in_motion = logistic_robot.shadow_in_motion,
  shadow_in_motion_with_cargo = logistic_robot.shadow_in_motion_with_cargo,
}

local logistic_robot_1 = table.deepcopy(logistic_robot_0)
logistic_robot_1.name = "cube-logistic-robot-1"
logistic_robot_1.minable.result = "cube-logistic-robot-1"
logistic_robot_1.speed = 0.025
logistic_robot_1.max_payload_size = 2
logistic_robot_1.max_energy = "1.0MJ"
logistic_robot_1.energy_per_tick = "0.05kJ"
logistic_robot_1.speed_multiplier_when_out_of_energy = 0.5
logistic_robot_1.energy_per_move = "2.5kJ"

data:extend({
  logistic_robot_0,
  logistic_robot_1,
})