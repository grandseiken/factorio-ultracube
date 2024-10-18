local smoke_animations = require("__base__/prototypes/entity/smoke-animations")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
  smoke_animations.trivial_smoke {
    name = "cube-void-wind-smoke",
    color = {r = 0.1, g = 0.1, b = 0.1, a = 0.4},
    start_scale = 1,
    end_scale = 3,
    fade_in_duration = 20,
    duration = 500,
  },
  {
    type = "generator",
    name = "cube-heavy-turbine",
    icon = "__base__/graphics/icons/steam-turbine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.3, result = "cube-heavy-turbine"},
    max_health = 300,
    corpse = "steam-turbine-remnants",
    dying_explosion = "steam-turbine-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    effectivity = 1,
    fluid_usage_per_tick = 1,
    burns_fluid = false,
    destroy_non_fuel_fluid = false,
    maximum_temperature = 1000,
    fast_replaceable_group = "steam-engine",
    collision_box = {{-1.25, -2.35}, {1.25, 2.35}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box = {
      base_area = 1,
      height = 2,
      base_level = -1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {type = "input-output", position = {0, 3}},
        {type = "input-output", position = {0, -3}}
      },
      production_type = "input-output",
      minimum_temperature = 100.0,
    },
    max_power_output = "6MW",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation = {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-H.png",
          width = 320,
          height = 245,
          frame_count = 8,
          line_length = 4,
          shift = util.by_pixel(0, -2.75),
          run_mode = "backward",
          scale = 0.5,
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-H-shadow.png",
          width = 435,
          height = 150,
          repeat_count = 8,
          frame_count = 1,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(28.5, 18),
          run_mode = "backward",
          scale = 0.5,
        }
      }
    },
    vertical_animation = {
      layers = {
        {
          filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-V.png",
          width = 217,
          height = 347,
          frame_count = 8,
          line_length = 4,
          shift = util.by_pixel(4.75, 6.75),
          run_mode = "backward",
          scale = 0.5,
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-V-shadow.png",
          width = 302,
          height = 260,
          repeat_count = 8,
          frame_count = 1,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(39.5, 24.5),
          run_mode = "backward",
          scale = 0.5,
        }
      }
    },
    smoke = {
      {
        name = "cube-void-wind-smoke",
        north_position = {0.0, -1.0},
        east_position = {0.75, -0.75},
        frequency = 2 / 32,
        starting_vertical_speed = 0.08,
        slow_down_factor = 1,
        starting_frame_deviation = 60
      }
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = {
        filename = "__base__/sound/steam-turbine.ogg",
        volume = 0.67
      },
      match_speed_to_activity = true,
      audible_distance_modifier = 0.7,
      max_sounds_per_type = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5,
    water_reflection = {
      pictures = {
        filename = "__base__/graphics/entity/steam-turbine/steam-turbine-reflection.png",
        priority = "extra-high",
        width = 40,
        height = 36,
        shift = util.by_pixel(0, 50),
        variation_count = 2,
        repeat_count = 2,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },
})