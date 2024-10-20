local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
require("__Ultracube__/prototypes/entities/lib/module_effects")

data:extend({
  {
    type = "assembling-machine",
    name = "cube-chemical-plant",
    icon = "__base__/graphics/icons/chemical-plant.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "cube-chemical-plant"},
    max_health = 300,
    corpse = "chemical-plant-remnants",
    dying_explosion = "chemical-plant-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    module_slots = 2,
    allowed_effects = module_effects.all,
    graphics_set = data.raw["assembling-machine"]["chemical-plant"].graphics_set,
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = data.raw["assembling-machine"]["chemical-plant"].working_sound,
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {},
    },
    energy_usage = "280kW",
    crafting_categories = {"cube-chemical-plant"},
    fluid_boxes = data.raw["assembling-machine"]["chemical-plant"].fluid_boxes,
    water_reflection = data.raw["assembling-machine"]["chemical-plant"].water_reflection,
  },
})