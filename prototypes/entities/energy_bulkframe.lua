local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
  {
    type = "accumulator",
    name = "cube-energy-bulkframe",
    icon = "__krastorio2-assets-ultracube__/icons/entities/energy-storage.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "cube-energy-bulkframe"},
    max_health = 750,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    collision_mask = {
      layers = {item = true, object = true, player = true, water_tile = true,
                cube_accumulator_forbidden_zone = true},
    },
    collision_box = {{-2.75, -2.75}, {2.75, 2.75}},
    selection_box = {{-3, -3}, {3, 3}},
    drawing_box_vertical_extension = 0.5,
    energy_source = {
      -- TODO: numbers (particularly input flow) tweaked upwards to handle antimatter power.
      -- Perhaps tweak down a bit if we add some other super-endgame storage solution.
      type = "electric",
      buffer_capacity = "1GJ",
      usage_priority = "tertiary",
      input_flow_limit = "50MW",
      output_flow_limit = "50MW",
    },
    chargable_graphics = {
      picture = {
        layers = {
          {
            filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage.png",
            width = 380,
            height = 380,
            scale = 0.55,
            frame_count = 1,
            shift = {0, -0.4},
          },
          {
            filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage-sh.png",
            width = 414,
            height = 270,
            scale = 0.55,
            frame_count = 1,
            draw_as_shadow = true,
            shift = {0.72, 0.56},
          },
        },
      },
      charge_animation = {
        layers = {
          {
            filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage.png",
            width = 380,
            height = 380,
            scale = 0.55,
            frame_count = 1,
            repeat_count = 2,
            animation_speed = 0.03,
            shift = {0, -0.4},
          },
          {
            filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage-sh.png",
            width = 414,
            height = 270,
            scale = 0.55,
            frame_count = 1,
            repeat_count = 2,
            animation_speed = 0.03,
            draw_as_shadow = true,
            shift = {0.72, 0.56},
          },
          {
            filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage-charge.png",
            width = 380,
            height = 380,
            scale = 0.55,
            frame_count = 2,
            line_length = 2,
            animation_speed = 0.03,
            shift = {0, -0.4},
            draw_as_glow = true,
          },
          {
            filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage-light.png",
            width = 380,
            height = 380,
            scale = 0.55,
            frame_count = 1,
            repeat_count = 2,
            animation_speed = 0.06,
            shift = {0, -0.4},
            draw_as_light = true,
          },
        },
      },
      discharge_animation = {
        layers = {
          {
            filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage.png",
            width = 380,
            height = 380,
            scale = 0.55,
            frame_count = 1,
            repeat_count = 2,
            animation_speed = 0.06,
            shift = {0, -0.4},
          },
          {
            filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage-sh.png",
            width = 414,
            height = 270,
            scale = 0.55,
            frame_count = 1,
            repeat_count = 2,
            animation_speed = 0.06,
            draw_as_shadow = true,
            shift = {0.72, 0.56},
          },
          {
            filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage-discharge.png",
            width = 380,
            height = 380,
            scale = 0.55,
            frame_count = 2,
            line_length = 2,
            animation_speed = 0.06,
            shift = {0, -0.4},
            draw_as_glow = true,
          },
          {
            filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage-light.png",
            width = 380,
            height = 380,
            scale = 0.55,
            frame_count = 1,
            repeat_count = 2,
            animation_speed = 0.06,
            shift = {0, -0.4},
            draw_as_light = true,
          },
        },
      },
    },
    charge_cooldown = 5,
    discharge_cooldown = 5,
    --[[
    charge_light =
    {
      intensity = 0.5,
      size = 1,
      color = {r=0.25, g=1, b=0.5}
    },
    discharge_light =
    {
      intensity = 0.75,
      size = 1,
      color = {r=1, g=0.75, b=0.25}
    },
    --]]
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__krastorio2-assets-ultracube__/sounds/buildings/energy-storage-working.ogg",
        volume = 0.9,
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.8,
      },
      max_sounds_per_type = 2,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
    },

    water_reflection = {
      pictures = {
        filename = "__krastorio2-assets-ultracube__/buildings/energy-storage/energy-storage-reflection.png",
        priority = "extra-high",
        width = 44,
        height = 44,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    circuit_connector = circuit_connector_definitions["accumulator"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_output_signal = { type = "virtual", name = "signal-A" },
  },
})