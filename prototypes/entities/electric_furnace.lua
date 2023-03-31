local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
  {
    type = "furnace",
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
    module_specification =
    {
      module_slots = 0,
      module_info_icon_shift = {0, 0.8},
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"smelting"},
    fast_replaceable_group = "furnace",
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "500kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 1,
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