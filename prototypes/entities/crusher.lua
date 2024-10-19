require("__Ultracube__/prototypes/entities/lib/module_effects")

data:extend({
  {
    type = "furnace",
    name = "cube-crusher",
    icon_size = 64,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/icons/entities/crusher.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 1, mining_time = 1, result = "cube-crusher"},
    max_health = 1000,
    corpse = "cube-big-random-pipes-remnant",
    dying_explosion = "big-explosion",
    collision_box = {{-3.25, -3.25}, {3.25, 3.25}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__Krastorio2Assets__/entities/crusher/crusher.png",
            priority = "high",
            width = 512,
            height = 512,
            frame_count = 30,
            line_length = 6,
            animation_speed = 0.75,
            scale = 0.5,
          },
          {
            filename = "__Krastorio2Assets__/entities/crusher/crusher-shadow.png",
            priority = "high",
            width = 512,
            height = 512,
            frame_count = 30,
            line_length = 6,
            draw_as_shadow = true,
            scale = 0.5,
          },
        },
      },
    },
    crafting_categories = {"cube-crusher"},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/crusher.ogg",
        volume = 1.25,
      },
      idle_sound = {filename = "__base__/sound/idle1.ogg"},
      apparent_volume = 1.5,
    },
    crafting_speed = 1,
    source_inventory_size = 1,
    result_inventory_size = 4,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {},
      drain = "10kW",
    },

    water_reflection = {
      pictures = {
        filename = "__Krastorio2Assets__/entities/crusher/crusher-reflection.png",
        priority = "extra-high",
        width = 80,
        height = 60,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    energy_usage = "250kW",
    module_slots = 2,
    icons_positioning = {{
      inventory_index = defines.inventory.furnace_modules,
      shift = {0, 1.7},
      scale = 1,
    }},
    allowed_effects = module_effects.all,
    --open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.75},
    --close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75}
  },
})