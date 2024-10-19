local smoke_animations = require("__base__/prototypes/entity/smoke-animations")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
require("__Ultracube__/prototypes/entities/lib/pipe")
require("__Ultracube__/prototypes/entities/lib/module_effects")
require("__Ultracube__/scripts/lib")

local function stygian_smoke()
  local smoke = {}
  for i = 8, 16 do
    smoke[#smoke+1] = {
      name = "cube-stygian-energy-lab-smoke",
      position = from_polar(3, 2 * math.pi * i / 16),
      deviation = {0.1, 0.1},
      frequency = 8,
      starting_vertical_speed = 1.0 / 16,
      starting_frame_deviation = i * 10,
      starting_frame = i * 5,
    }
  end
  return smoke
end

data:extend({
  smoke_animations.trivial_smoke {
    name = "cube-stygian-energy-lab-smoke",
    color = {r = 0.4, g = 1, b = 0.8},
    start_scale = 1,
    end_scale = 3,
    duration = 120,
    fade_in_duration = 10,
    render_layer = "object",
  },
  {
    type = "assembling-machine",
    name = "cube-stygian-energy-lab",
    icon_size = 64,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/icons/entities/bio-lab.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 1, mining_time = 1, result = "cube-stygian-energy-lab"},
    max_health = 500,
    corpse = "cube-big-random-pipes-remnant",
    dying_explosion = "big-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    fluid_boxes = {
      {
        production_type = "output",
        pipe_picture = pipe_path,
        pipe_covers = pipecoverspictures(),
        volume = 4000,
        pipe_connections = {
          {flow_direction = "output", direction = defines.direction.east, position = {3, 0}},
          {flow_direction = "output", direction = defines.direction.west, position = {-3, 0}},
          {flow_direction = "output", direction = defines.direction.north, position = {0, -3}},
          {flow_direction = "output", direction = defines.direction.south, position = {0, 3}},
        },
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = false,
    collision_box = {{-3.25, -3.25}, {3.25, 3.25}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    fast_replaceable_group = "cube-stygian-energy-lab",
    module_slots = 2,
    allowed_effects = module_effects.fuel_speed_only,
    animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/bio-lab/bio-lab.png",
          priority = "high",
          width = 512,
          height = 512,
          frame_count = 1,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/entities/bio-lab/bio-lab-sh.png",
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
          filename = "__Krastorio2Assets__/entities/bio-lab/bio-lab-working.png",
          width = 387,
          height = 342,
          shift = {0.05, -0.31},
          frame_count = 30,
          line_length = 5,
          scale = 0.5,
          animation_speed = 0.35,
        },
      },
    },
    fixed_recipe = "cube-stygian-power-generation",
    crafting_categories = {"cube-stygian-energy-lab"},
    show_recipe_icon = false,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Ultracube__/assets/sounds/stygian-energy-lab.ogg",
        volume = 0.8,
      },
      idle_sound = {filename = "__base__/sound/idle1.ogg"},
      aggregation = {
        max_count = 4,
        remove = false,
        count_already_playing = true,
      },
      fade_in_ticks = 10,
      fade_out_ticks = 10,
    },
    crafting_speed = 1,
    return_ingredients_on_change = true,
    energy_source = {
      type = "burner",
      light_flicker = {
        color = {r = 0.4, g = 1, b = 0.8},
        light_intensity_to_size_coefficient = 1.5,
      },
      fuel_categories = {"cube-haunted-energy"},
      fuel_inventory_size = 1,
      emissions_per_minute = {},
      smoke = stygian_smoke(),
    },
    energy_usage = "16MW",
    ingredient_count = 4,
  },
})