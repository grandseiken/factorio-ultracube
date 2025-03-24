local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
require ("circuit-connector-sprites")
require("__Ultracube__/prototypes/entities/lib/pipe")

data:extend({
  {
    type = "roboport",
    name = "cube-roboport",
    localised_name = {"entity-name.roboport"},
    localised_description = {"entity-description.roboport"},
    icon = "__krastorio2-assets-ultracube__/icons/entities/big-roboport.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "cube-roboport"},
    max_health = 1500,
    corpse = "cube-medium-random-pipes-remnant",
    damaged_trigger_effect = hit_effects.entity(),
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    dying_explosion = "medium-explosion",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "8MW",   -- default 5MW
      buffer_capacity = "150MJ",  -- default 100MJ
    },
    recharge_minimum = "50MJ",
    energy_usage = "50kW",
    -- per one charge slot
    charging_energy = "1MW",
    logistics_radius = 35,     -- default 25.
    construction_radius = 75,  -- default 55.
    charge_approach_distance = 5,
    robot_slots_count = 5,
    material_slots_count = 5,
    stationing_offset = {0, 0},
    charging_offsets = {
      {-0.5 / 2, -3.3 / 2},
      {-1.7 / 2, -3.0 / 2},
      {-2.5 / 2, -2.4 / 2},
      {-3.1 / 2, -1.6 / 2},
      {-3.4 / 2, -0.6 / 2},
      {0.5 / 2, -3.3 / 2},
      {1.7 / 2, -3.0 / 2},
      {2.5 / 2, -2.4 / 2},
      {3.1 / 2, -1.6 / 2},
      {3.4 / 2, -0.6 / 2},
      {0.5 / 2, 3.1 / 2},
      {1.7 / 2, 2.8 / 2},
      {2.5 / 2, 2.2 / 2},
      {3.1 / 2, 1.5 / 2},
      {3.4 / 2, 0.4 / 2},
      {-0.5 / 2, 3.1 / 2},
      {-1.7 / 2, 2.8 / 2},
      {-2.5 / 2, 2.2 / 2},
      {-3.1 / 2, 1.5 / 2},
      {-3.4 / 2, 0.4 / 2},
    },

    base = {
      layers = {
        {
          filename = "__krastorio2-assets-ultracube__/buildings/big-roboport/big-roboport.png",
          width = 560,
          height = 560,
          shift = {0, 0.08 / 2},
          scale = 0.25,
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/big-roboport/big-roboport-sh.png",
          width = 626,
          height = 426,
          shift = {1.1 / 2, 1.19 / 2},
          draw_as_shadow = true,
          scale = 0.25,
        },
      },
    },
    base_patch = {
      filename = "__krastorio2-assets-ultracube__/buildings/big-roboport/big-roboport-patch.png",
      width = 138,
      height = 112,
      shift = {0, 0.28 / 2},
      scale = 0.25,
    },
    base_animation = {
      layers = {
        {
          filename = "__krastorio2-assets-ultracube__/buildings/big-roboport/big-roboport-animation.png",
          priority = "medium",
          width = 350,
          height = 286,
          scale = 0.25,
          line_length = 6,
          frame_count = 12,
          shift = {0, -0.75 / 2},
          draw_as_glow = true,
          animation_speed = 0.1,
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/big-roboport/big-roboport-animation-light.png",
          priority = "high",
          width = 350,
          height = 286,
          scale = 0.25,
          line_length = 6,
          frame_count = 12,
          shift = {0, -0.75 / 2},
          draw_as_light = true,
          animation_speed = 0.1,
        },
      },
    },
    door_animation_up = {
      filename = "__krastorio2-assets-ultracube__/buildings/big-roboport/big-roboport-door-up.png",
      priority = "medium",
      width = 98,
      height = 38,
      scale = 0.25,
      frame_count = 16,
      shift = {0, -0.86 / 2},
    },
    door_animation_down = {
      filename = "__krastorio2-assets-ultracube__/buildings/big-roboport/big-roboport-door-down.png",
      priority = "medium",
      width = 98,
      height = 36,
      scale = 0.25,
      frame_count = 16,
      shift = {0, -0.285 / 2},
    },
    recharging_animation = {
      layers = {
        {
          filename = "__krastorio2-assets-ultracube__/buildings/big-roboport/big-roboport-recharging.png",
          priority = "high",
          width = 37,
          height = 35,
          frame_count = 16,
          scale = 1.5 / 2,
          draw_as_glow = true,
          animation_speed = 0.5,
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/big-roboport/big-roboport-recharging-light.png",
          priority = "high",
          width = 37,
          height = 35,
          frame_count = 16,
          scale = 1.5 / 2,
          draw_as_light = true,
          animation_speed = 0.5,
        },
      },
    },

    water_reflection = {
      pictures = {
        filename = "__krastorio2-assets-ultracube__/buildings/big-roboport/big-roboport-reflection.png",
        priority = "extra-high",
        width = 60,
        height = 60,
        shift = util.by_pixel(0, 70 / 2),
        variation_count = 1,
        scale = 5 / 2,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    request_to_open_door_timeout = 15,
    spawn_and_station_height = 0,

    draw_logistic_radius_visualization = true,
    draw_construction_radius_visualization = true,
    open_door_trigger_effect = {
      {
        type = "play-sound",
        sound = {
          filename = "__base__/sound/roboport-door.ogg",
          volume = 0.5,
          min_speed = 1,
          max_speed = 1.5,
        },
      },
    },
    close_door_trigger_effect = {
      {
        type = "play-sound",
        sound = {
          filename = "__base__/sound/roboport-door-close.ogg",
          volume = 0.5,
          min_speed = 1,
          max_speed = 1.5,
        },
      },
    },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {filename = "__base__/sound/roboport-working.ogg", volume = 0.6},
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.5,
      probability = 1 / (5 * 60), -- average pause between the sound is 5 seconds
    },
    recharging_light = {
      intensity = 0.2,
      size = 1,
      color = {r = 0.196, g = 0.658, b = 0.650},
    },
    circuit_connector = circuit_connector_definitions.create_single(
      universal_connector_template,
      {variation = 27, main_offset = util.by_pixel(30.5, 38), shadow_offset = util.by_pixel(24.5, 50.5), show_shadow = false}),
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
  },
})
