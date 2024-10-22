local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
require("__Ultracube__/prototypes/entities/lib/module_effects")

local animation = {
  layers = {
    {
      filename = "__Krastorio2Assets__/entities/quantum-computer/quantum-computer.png",
      priority = "high",
      width = 400,
      height = 420,
      shift = {0, -0.2},
      frame_count = 48,
      line_length = 8,
      animation_speed = 1,
      scale = 0.5,
    },
    {
      filename = "__Krastorio2Assets__/entities/quantum-computer/quantum-computer-sh.png",
      priority = "medium",
      width = 402,
      height = 362,
      shift = {0.19, 0.315},
      frame_count = 1,
      repeat_count = 48,
      draw_as_shadow = true,
      animation_speed = 1,
      scale = 0.5,
    },
  },
}

local working_visualisations = {
  {
    animation = {
      filename = "__Krastorio2Assets__/entities/quantum-computer/quantum-computer-light.png",
      priority = "extra-high",
      draw_as_light = true,
      width = 400,
      height = 420,
      shift = {0, -0.2},
      frame_count = 48,
      line_length = 8,
      animation_speed = 1,
      scale = 0.5,
    },
  },
  {
    animation = {
      filename = "__Krastorio2Assets__/entities/quantum-computer/quantum-computer-glow.png",
      priority = "extra-high",
      draw_as_glow = true,
      blend_mode = "additive-soft",
      width = 400,
      height = 420,
      shift = {0, -0.2},
      frame_count = 48,
      line_length = 8,
      animation_speed = 1,
      scale = 0.5,
    },
  },
  {
    light = {
      intensity = 0.85,
      size = 5,
      shift = {0.0, 0.0},
      color = {r = 0.35, g = 0.75, b = 1},
    },
  },
}

local function make_quantum_decoder(name)
  return {
    type = "furnace",
    name = name,
    localised_name = {"entity-name.cube-quantum-decoder"},
    localised_description = {"entity-description.cube-quantum-decoder"},
    icon = "__Krastorio2Assets__/icons/entities/quantum-computer.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    show_recipe_icon_on_map = false,
    fast_replaceable_group = "cube-quantum-decoder",
    minable = {mining_time = 0.75, result = "cube-quantum-decoder"},
    damaged_trigger_effect = hit_effects.entity(),
    max_health = 1000,
    corpse = "cube-medium-random-pipes-remnant",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-2.95, -2.95}, {2.95, 2.95}},
    crafting_categories = {name},
    source_inventory_size = 1,
    result_inventory_size = 8,
    crafting_speed = 1,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {},
    },
    energy_usage = "1MW",
    graphics_set = {
      animation = animation,
      working_visualisations = working_visualisations,
    },
    module_slots = 0,
    allowed_effects = module_effects.none,
    open_sound = {filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1},
    close_sound = {filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1},
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/quantum-computer.ogg",
        volume = 0.75,
      },
      idle_sound = {filename = "__base__/sound/idle1.ogg"},
      apparent_volume = 1.5,
      fade_in_ticks = 5,
      fade_out_ticks = 5,
    },
  }
end

data:extend({
  make_quantum_decoder("cube-quantum-decoder"),
  make_quantum_decoder("cube-quantum-decoder-dummy"),
})
