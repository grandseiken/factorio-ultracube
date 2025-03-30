local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local ziggurat_animations = {
  {
    constant_speed = true,
    always_draw = true,
    animation = {
      layers = {
        {
          filename = "__krastorio2-assets-ultracube__/buildings/intergalactic-transceiver/intergalactic-transceiver-charging.png",
          priority = "high",
          width = 800,
          height = 800,
          scale = 0.5,
          frame_count = 60,
          line_length = 10,
          animation_speed = 0.3447,
          shift = {0, -0.8},
          draw_as_glow = true,
        },
      },
    },
  },
  {
    constant_speed = true,
    always_draw = true,
    draw_as_light = true,
    animation = {
      layers = {
        {
          filename = "__krastorio2-assets-ultracube__/buildings/intergalactic-transceiver/intergalactic-transceiver-charging-light.png",
          priority = "high",
          width = 800,
          height = 800,
          scale = 0.5,
          frame_count = 60,
          line_length = 10,
          animation_speed = 0.3447,
          shift = {0, -0.8},
          draw_as_light = true,
        },
      },
    },
  },
  {
    constant_speed = true,
    animation = {
      layers = {
        {
          filename = "__krastorio2-assets-ultracube__/buildings/intergalactic-transceiver/intergalactic-transceiver-charge.png",
          priority = "high",
          width = 800,
          height = 800,
          scale = 0.5,
          frame_count = 60,
          line_length = 10,
          animation_speed = 0.3447,
          shift = {0, -0.8},
          draw_as_glow = true,
        },
      },
    },
  },
  {
    constant_speed = true,
    draw_as_light = true,
    animation = {
      layers = {
        {
          filename = "__krastorio2-assets-ultracube__/buildings/intergalactic-transceiver/intergalactic-transceiver-charge-light.png",
          priority = "high",
          width = 800,
          height = 800,
          scale = 0.5,
          frame_count = 60,
          line_length = 10,
          animation_speed = 0.3447,
          shift = {0, -0.8},
          draw_as_light = true,
        },
      },
    },
  },
}

local ziggurat_working_sound = {
  sound = {
    variations = {
      {
        filename = "__krastorio2-assets-ultracube__/sounds/buildings/intergalactic-transceiver-charge.ogg",
        volume = 1,
        preload = true,
      },
      {
        filename = "__krastorio2-assets-ultracube__/sounds/buildings/intergalactic-transceiver-charge.ogg",
        volume = 1,
        preload = true,
      },
      {
        filename = "__krastorio2-assets-ultracube__/sounds/buildings/intergalactic-transceiver-charge-morse.ogg",
        volume = 1,
        preload = true,
      },
    },
  },
  idle_sound = {
    filename = "__krastorio2-assets-ultracube__/sounds/buildings/intergalactic-transceiver.ogg",
    volume = 1,
    audible_distance_modifier = 1,
  },
  max_sounds_per_type = 3,
  fade_in_ticks = 10,
  fade_out_ticks = 30,
}

local ziggurat_picture = {
  layers = {
    {
      filename = "__krastorio2-assets-ultracube__/buildings/intergalactic-transceiver/intergalactic-transceiver-light.png",
      width = 800,
      height = 800,
      scale = 0.5,
      frame_count = 1,
      shift = {0, -0.8},
      draw_as_light = true,
    },
    {
      filename = "__krastorio2-assets-ultracube__/buildings/intergalactic-transceiver/intergalactic-transceiver.png",
      width = 800,
      height = 800,
      scale = 0.5,
      frame_count = 1,
      shift = {0, -0.8},
    },
    {
      filename = "__krastorio2-assets-ultracube__/buildings/intergalactic-transceiver/intergalactic-transceiver-sh.png",
      width = 867,
      height = 626,
      scale = 0.5,
      frame_count = 1,
      draw_as_shadow = true,
      shift = {0.52, 0.5},
    },
  },
}

data:extend({
  {
    type = "assembling-machine",
    name = "cube-forbidden-ziggurat",
    icon = "__krastorio2-assets-ultracube__/icons/entities/intergalactic-transceiver.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    map_color = {r = 0.37, g = 0.18, b = 0.47},
    max_health = 20000,
    minable = {mining_time = 10, result = "cube-forbidden-ziggurat"},
    placeable_by = {item = "cube-forbidden-ziggurat", count = 1},
    corpse = "cube-big-random-pipes-remnant",
    show_recipe_icon = false,
    dying_explosion = "nuclear-reactor-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    collision_box = {{-5.75, -5.25}, {5.75, 5.25}},
    selection_box = {{-6, -5.5}, {6, 5.5}},
    drawing_box_vertical_extension = 0.5,
    crafting_categories = {"cube-forbidden-ziggurat"},
    crafting_speed = 1,
    energy_usage = "4GW",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {},
      drain = "50MW",
    },
    graphics_set = {
      animation = ziggurat_picture,
      working_visualisations = ziggurat_animations,
    },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = ziggurat_working_sound,
    audible_distance_modifier = 30,
    module_slots = 10,
    icons_positioning = {{
      inventory_index = defines.inventory.assembling_machine_modules,
      shift = {0, 1.8},
      scale = 1,
      max_icon_rows = 2,
      max_icons_per_row = 5,
    }},
    allowed_effects = module_effects.all,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
  },
})