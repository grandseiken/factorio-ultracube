local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
require("__Ultracube__/prototypes/entities/lib/module_effects")

data:extend({
  {
    type = "assembling-machine",
    name = "cube-distillery",
    icon = "__base__/graphics/icons/oil-refinery.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.5, result = "cube-distillery"},
    max_health = 400,
    corpse = "oil-refinery-remnants",
    dying_explosion = "oil-refinery-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.3,
    module_slots = 2,
    icons_positioning = {{
      inventory_index = defines.inventory.assembling_machine_modules,
      shift = {0, 1.2},
      scale = 0.625,
    }},
    allowed_effects = module_effects.all,
    crafting_categories = {"cube-distillery"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {},
    },
    energy_usage = "400kW",
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    graphics_set = data.raw["assembling-machine"]["oil-refinery"].graphics_set,
    working_sound = data.raw["assembling-machine"]["oil-refinery"].working_sound,
    fluid_boxes = data.raw["assembling-machine"]["oil-refinery"].fluid_boxes,
    water_reflection = data.raw["assembling-machine"]["oil-refinery"].water_reflection,
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["oil-refinery"],
  }
})