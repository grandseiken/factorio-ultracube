local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
require("__Ultracube__/prototypes/entities/lib/module_effects")

circuit_connector_definitions["cube-deep-core-ultradrill"] = circuit_connector_definitions.create_vector(universal_connector_template, {
  {
    variation = 0,
    main_offset = util.by_pixel(5, -118),
    shadow_offset = util.by_pixel(7, -118),
    show_shadow = true,
  },
  {
    variation = 2,
    main_offset = util.by_pixel(100, -22),
    shadow_offset = util.by_pixel(102, -22),
    show_shadow = true,
  },
  {
    variation = 4,
    main_offset = util.by_pixel(-4, 82),
    shadow_offset = util.by_pixel(-2, 82),
    show_shadow = true,
  },
  {
    variation = 6,
    main_offset = util.by_pixel(-100, -15),
    shadow_offset = util.by_pixel(-98, -15),
    show_shadow = true,
  },
})

data:extend({
  {
    type = "mining-drill",
    name = "cube-deep-core-ultradrill",
    icon = "__Krastorio2Assets__/icons/entities/quarry-drill.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 2, result = "cube-deep-core-ultradrill"},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "cube-deep-core-drills",
    max_health = 1000,
    resource_categories = {"cube-deep-core"},
    corpse = "cube-big-random-pipes-remnant",
    dying_explosion = "big-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_slots = 4,
    allowed_effects = module_effects.speed_productivity,
    energy_source = {
      type = "burner",
      fuel_categories = {"cube-cube"},
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
      emissions_per_minute = {},
      smoke = {
        {
          name = "cube-ultradense-furnace-smoke",
          deviation = {0.1, 0.1},
          frequency = 20,
          starting_vertical_speed = 1.0 / 16,
          starting_frame_deviation = 60,
        }
      },
      render_no_power_icon = false,
    },
    energy_usage = "125MW",
    mining_speed = 500,
    mining_power = 4,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, -3.65},
    radius_visualisation_picture = {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 12,
      height = 12,
    },
    animations = {
      layers = {
        {
          priority = "extra-high",
          filename = "__Krastorio2Assets__/entities/quarry-drill/quarry-drill-light.png",
          width = 440,
          height = 464,
          frame_count = 90,
          line_length = 10,
          shift = {0, -0.18},
          draw_as_light = true,
          blend_mode = "additive",
          flags = {"light"},
          animation_speed = 0.3,
          scale = 0.52,
        },
        {
          priority = "high",
          filename = "__Krastorio2Assets__/entities/quarry-drill/quarry-drill.png",
          width = 440,
          height = 464,
          frame_count = 90,
          line_length = 10,
          shift = {0, -0.18},
          animation_speed = 0.3,
          scale = 0.52,
        },
        {
          priority = "medium",
          filename = "__Krastorio2Assets__/entities/quarry-drill/quarry-drill-sh.png",
          width = 500,
          height = 422,
          frame_count = 1,
          repeat_count = 90,
          shift = {0, 0.05},
          draw_as_shadow = true,
          animation_speed = 0.3,
          scale = 0.52,
        },
      },
    },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/quarry-drill.ogg",
        volume = 0.5,
      },
      idle_sound = {filename = "__base__/sound/idle1.ogg"},
      max_sounds_per_type = 2,
    },
    circuit_connector = circuit_connector_definitions["cube-deep-core-ultradrill"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
})