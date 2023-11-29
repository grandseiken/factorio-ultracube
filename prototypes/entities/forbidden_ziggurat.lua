local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local ziggurat_light = {
  intensity = 0.75,
  size = 20,
  shift = {0, -0.5},
  color = {r = 1, g = 0.2, b = 1},
}

local activated_ziggurat_light = {
  intensity = 1.75,
  size = 30,
  shift = {0, -0.5},
  color = {r = 1, g = 0.2, b = 1},
}

local ziggurat_animations = {
  {
    constant_speed = true,
    always_draw = true,
    animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/intergalactic-transceiver-charging.png",
          priority = "high",
          width = 400,
          height = 400,
          frame_count = 60,
          line_length = 10,
          animation_speed = 0.3447,
          shift = {0, -0.8},
          draw_as_glow = true,
          hr_version = {
            filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/hr-intergalactic-transceiver-charging.png",
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
  },
  {
    constant_speed = true,
    always_draw = true,
    draw_as_light = true,
    animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/intergalactic-transceiver-charging-light.png",
          priority = "high",
          width = 400,
          height = 400,
          frame_count = 60,
          line_length = 10,
          animation_speed = 0.3447,
          shift = {0, -0.8},
          draw_as_light = true,
          hr_version = {
            filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/hr-intergalactic-transceiver-charging-light.png",
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
  },
  {
    constant_speed = true,
    animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/intergalactic-transceiver-charge.png",
          priority = "high",
          width = 400,
          height = 400,
          frame_count = 60,
          line_length = 10,
          animation_speed = 0.3447,
          shift = {0, -0.8},
          draw_as_glow = true,
          hr_version = {
            filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/hr-intergalactic-transceiver-charge.png",
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
  },
  {
    constant_speed = true,
    draw_as_light = true,
    animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/intergalactic-transceiver-charge-light.png",
          priority = "high",
          width = 400,
          height = 400,
          frame_count = 60,
          line_length = 10,
          animation_speed = 0.3447,
          shift = {0, -0.8},
          draw_as_light = true,
          hr_version = {
            filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/hr-intergalactic-transceiver-charge-light.png",
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
  },
}

local ziggurat_working_sound = {
  sound = {
    variations = {
      {
        filename = "__Krastorio2Assets__/sounds/buildings/intergalactic-transceiver-charge.ogg",
        volume = 1,
      },
      {
        filename = "__Krastorio2Assets__/sounds/buildings/intergalactic-transceiver-charge.ogg",
        volume = 1,
      },
      {
        filename = "__Krastorio2Assets__/sounds/buildings/intergalactic-transceiver-charge-morse.ogg",
        volume = 1,
      },
    },
  },
  idle_sound = {
    filename = "__Krastorio2Assets__/sounds/buildings/intergalactic-transceiver.ogg",
    volume = 1,
  },
  max_sounds_per_type = 3,
  fade_in_ticks = 10,
  fade_out_ticks = 30,
}

local ziggurat_picture = {
  layers = {
    {
      filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/intergalactic-transceiver-light.png",
      width = 400,
      height = 400,
      frame_count = 1,
      shift = {0, -0.8},
      draw_as_light = true,
      hr_version = {
        filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/hr-intergalactic-transceiver-light.png",
        width = 800,
        height = 800,
        scale = 0.5,
        frame_count = 1,
        shift = {0, -0.8},
        draw_as_light = true,
      },
    },
    {
      filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/intergalactic-transceiver.png",
      width = 400,
      height = 400,
      frame_count = 1,
      shift = {0, -0.8},
      hr_version = {
        filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/hr-intergalactic-transceiver.png",
        width = 800,
        height = 800,
        scale = 0.5,
        frame_count = 1,
        shift = {0, -0.8},
      },
    },
    {
      filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/intergalactic-transceiver-sh.png",
      width = 434,
      height = 313,
      frame_count = 1,
      draw_as_shadow = true,
      shift = {0.52, 0.5},
      hr_version = {
        filename = "__Krastorio2Assets__/entities/intergalactic-transceiver/hr-intergalactic-transceiver-sh.png",
        width = 867,
        height = 626,
        scale = 0.5,
        frame_count = 1,
        draw_as_shadow = true,
        shift = {0.52, 0.5},
      },
    },
  },
}

data:extend({
  {
    type = "assembling-machine",
    name = "cube-forbidden-ziggurat",
    icon = "__Krastorio2Assets__/icons/entities/intergalactic-transceiver.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
    map_color = {r = 0.37, g = 0.18, b = 0.47},
    max_health = 20000,
    minable = {mining_time = 10, result = "cube-forbidden-ziggurat"},
    placeable_by = {item = "cube-forbidden-ziggurat", count = 1},
    corpse = "cube-big-random-pipes-remnant",
    dying_explosion = "nuclear-reactor-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    collision_box = {{-5.75, -5.25}, {5.75, 5.25}},
    selection_box = {{-6, -5.5}, {6, 5.5}},
    drawing_box = {{-6, -6.5}, {6, 4.5}},
    crafting_categories = {"cube-forbidden-ziggurat"},
    crafting_speed = 1,
    energy_usage = "1GW",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 0,
    },

    animation = ziggurat_picture,
    working_visualisations = ziggurat_animations,

    vehicle_impact_sound = sounds.generic_impact,
    working_sound = ziggurat_working_sound,
    audible_distance_modifier = 30,
    module_specification = {
      module_slots = 10,
      module_info_icon_shift = {0, 1.8},
      module_info_icon_scale = 0.6,
    },
    allowed_effects = module_effects.all,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
  },
})