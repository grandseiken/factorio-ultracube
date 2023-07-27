local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local construction_robot = data.raw["construction-robot"]["construction-robot"]
local logistic_robot = data.raw["logistic-robot"]["logistic-robot"]

local construction_robot_0 = {
  type = "construction-robot",
  name = "cube-construction-robot-0",
  icon = "__base__/graphics/icons/construction-robot.png",
  icon_size = 64, icon_mipmaps = 4,
  flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
  minable = {mining_time = 0.1, result = "cube-construction-robot-0"},
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
  dying_explosion = "construction-robot-explosion",
  max_payload_size = 1,
  speed = 0.06,
  max_energy = "1.5MJ",
  energy_per_tick = "0.05kJ",
  speed_multiplier_when_out_of_energy = 0.2,
  energy_per_move = "5kJ",
  min_to_charge = 0.2,
  max_to_charge = 0.95,
  --working_light = {intensity = 0.8, size = 3, color = {r = 0.8, g = 0.8, b = 0.8}},
  smoke = {
    filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
    width = 39,
    height = 32,
    frame_count = 19,
    line_length = 19,
    shift = {0.078125, -0.15625},
    animation_speed = 0.3,
  },
  sparks = construction_robot.sparks,
  repairing_sound = {
    { filename = "__base__/sound/robot-repair-1.ogg", volume = 0.6 },
    { filename = "__base__/sound/robot-repair-2.ogg", volume = 0.6 },
    { filename = "__base__/sound/robot-repair-3.ogg", volume = 0.6 },
    { filename = "__base__/sound/robot-repair-4.ogg", volume = 0.6 },
    { filename = "__base__/sound/robot-repair-5.ogg", volume = 0.6 },
    { filename = "__base__/sound/robot-repair-6.ogg", volume = 0.6 },
  },
  working_sound = sounds.construction_robot(0.47),
  cargo_centered = {0.0, 0.2},
  construction_vector = {0.30, 0.22},
  water_reflection = construction_robot.water_reflection,
  idle = construction_robot.idle,
  idle_with_cargo = construction_robot.idle_with_cargo,
  in_motion = construction_robot.in_motion,
  in_motion_with_cargo = construction_robot.in_motion_with_cargo,
  shadow_idle = construction_robot.shadow_idle,
  shadow_idle_with_cargo = construction_robot.shadow_idle_with_cargo,
  shadow_in_motion = construction_robot.shadow_in_motion,
  shadow_in_motion_with_cargo = construction_robot.shadow_in_motion_with_cargo,
  working = construction_robot.working,
  shadow_working = construction_robot.shadow_working,
}

local logistic_robot_0 = {
  type = "logistic-robot",
  name = "cube-logistic-robot-0",
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
logistic_robot_1.speed = 0.03
logistic_robot_1.max_payload_size = 2
logistic_robot_1.max_energy = "1.0MJ"
logistic_robot_1.energy_per_tick = "0.02kJ"
logistic_robot_1.speed_multiplier_when_out_of_energy = 0.5
logistic_robot_1.energy_per_move = "2kJ"

data:extend({
  construction_robot_0,
  logistic_robot_0,
  logistic_robot_1,
})