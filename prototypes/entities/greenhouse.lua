local hit_effects = require("__base__/prototypes/entity/hit-effects")
require("__Ultracube__/prototypes/entities/lib/pipe")
require("__Ultracube__/prototypes/entities/lib/module_effects")

data:extend({
  {
    type = "assembling-machine",
    name = "cube-greenhouse",
    icon_size = 64,
    icon = "__krastorio2-assets-ultracube__/icons/entities/greenhouse.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 1, mining_time = 1, result = "cube-greenhouse"},
    max_health = 500,
    corpse = "cube-big-random-pipes-remnant",
    dying_explosion = "big-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = pipe_path,
        pipe_covers = pipecoverspictures(),
        volume = 2000,
        pipe_connections = {
          {flow_direction = "input-output", direction = defines.direction.north, position = {0, -3}},
          {flow_direction = "input-output", direction = defines.direction.west, position = {-3, 0}},
          {flow_direction = "input-output", direction = defines.direction.east, position = {3, 0}},
          {flow_direction = "input-output", direction = defines.direction.south, position = {0, 3}},
        },
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = false,
    collision_box = {{-3.25, -3.25}, {3.25, 3.25}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    fast_replaceable_group = "cube-greenhouse",
    module_slots = 2,
    icons_positioning = {{
      inventory_index = defines.inventory.assembling_machine_modules,
      shift = {0, 1.7},
      scale = 1,
    }},
    allowed_effects = module_effects.speed_efficiency,
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__krastorio2-assets-ultracube__/buildings/greenhouse/greenhouse.png",
            priority = "high",
            width = 512,
            height = 512,
            frame_count = 1,
            scale = 0.5,
          },
          {
            filename = "__krastorio2-assets-ultracube__/buildings/greenhouse/greenhouse-sh.png",
            priority = "high",
            width = 512,
            height = 512,
            shift = {0.32, 0},
            frame_count = 1,
            draw_as_shadow = true,
            scale = 0.5,
          },
        },
      },
      working_visualisations = {
        {
          animation = {
            filename = "__krastorio2-assets-ultracube__/buildings/greenhouse/greenhouse-light.png",
            width = 512,
            height = 512,
            frame_count = 1,
            repeat_count = 10,
            scale = 0.5,
            draw_as_light = true,
            animation_speed = 0.35,
          },
        },
        {
          animation = {
            filename = "__krastorio2-assets-ultracube__/buildings/greenhouse/greenhouse-working.png",
            width = 512,
            height = 512,
            frame_count = 10,
            line_length = 5,
            scale = 0.5,
            animation_speed = 0.35,
          },
        },
      },
    },
    crafting_categories = {"cube-greenhouse"},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
      filename = "__krastorio2-assets-ultracube__/sounds/buildings/greenhouse.ogg",
      volume = 0.75,
      idle_sound = {filename = "__base__/sound/idle1.ogg"},
      aggregation = {
        max_count = 3,
        remove = false,
        count_already_playing = true,
      },
    },
    crafting_speed = 1,
    return_ingredients_on_change = true,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {},
    },
    energy_usage = "500kW",
    ingredient_count = 4,
  },
})