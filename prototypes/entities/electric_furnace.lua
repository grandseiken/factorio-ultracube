local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
require("__Ultracube__/prototypes/entities/lib/module_effects")

data:extend({
  {
    type = "assembling-machine",
    name = "cube-electric-furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "cube-electric-furnace"},
    max_health = 400,
    corpse = "electric-furnace-remnants",
    dying_explosion = "electric-furnace-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{flow_direction = "input", direction = defines.direction.north, position = {0, -1}}},
        secondary_draw_orders = {north = -1},
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    module_specification =
    {
      module_slots = 2,
      module_info_icon_shift = {0, 0.8},
    },
    allowed_effects = module_effects.all,
    crafting_categories = {"cube-furnace"},
    fast_replaceable_group = "furnace",
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "500kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {},
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = data.raw.furnace["electric-furnace"].working_sound,
    animation = data.raw.furnace["electric-furnace"].animation,
    working_visualisations = data.raw.furnace["electric-furnace"].working_visualisations,
    water_reflection = data.raw.furnace["electric-furnace"].water_reflection,
  },
})