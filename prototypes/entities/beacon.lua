local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
require("__Ultracube__/prototypes/entities/lib/module_effects")
require("__Ultracube__/prototypes/entities/lib/pipe")

local beacon_scale = 2
local beacon_picture = {
  filename = "__Krastorio2Assets__/entities/singularity-beacon/singularity-beacon.png",
  width = 360,
  height = 360,
  shift = util.by_pixel(0, -5),
  scale = 0.25 * beacon_scale,
}

data:extend({
  {
    type = "virtual-signal",
    name = "cube-beacon-overload",
    icon = "__Krastorio2Assets__/icons/virtual-signals/attention-2.png",
    icon_size = 64,
    order = "x[special-signals]",
  },
  {
    type = "beacon",
    name = "cube-beacon",
    icon = "__Krastorio2Assets__/icons/entities/singularity-beacon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "cube-beacon"},
    max_health = 300,
    corpse = "medium-remnants",
    dying_explosion = "cube-medium-matter-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.25, -1.5}, {1.25, 1.0}},
    selection_priority = 100,
    damaged_trigger_effect = hit_effects.entity(),

    base_picture = beacon_picture,
    animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/singularity-beacon/singularity-beacon-w-light.png",
          width = 190,
          height = 214,
          frame_count = 10,
          line_length = 5,
          shift = util.by_pixel(0, -11.5),
          draw_as_light = true,
          flags = {"light"},
          scale = 0.25 * beacon_scale,
          animation_speed = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/entities/singularity-beacon/singularity-beacon-w.png",
          width = 190,
          height = 214,
          frame_count = 10,
          line_length = 5,
          shift = util.by_pixel(0, -11.5),
          scale = 0.25 * beacon_scale,
          animation_speed = 0.5,
        },
      },
    },
    animation_shadow = {
      filename = "__Krastorio2Assets__/entities/singularity-beacon/singularity-beacon-ws.png",
      width = 10,
      height = 10,
      frame_count = 10,
      line_length = 5,
      scale = 0.5 * beacon_scale,
      animation_speed = 0.5,
    },
    radius_visualisation_picture = {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10,
    },
    vehicle_impact_sound = sounds.generic_impact,

    water_reflection = {
      pictures = {
        filename = "__Krastorio2Assets__/entities/singularity-beacon/singularity-beacon-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 25,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5 * beacon_scale,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    energy_usage = "800kW",
    energy_source = {type = "void"},
    allowed_effects = module_effects.fuel_speed_only,
    module_slots = 4,
    icons_positioning = {{
      inventory_index = defines.inventory.beacon_modules,
      shift = {0, -0.25},
      scale = 0.625,
      max_icon_rows = 2,
      max_icons_per_row = 2,
    }},
    supply_area_distance = 3.0,
    distribution_effectivity = 0.5,

    open_sound = {filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1},
    close_sound = {filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1},
  },
  {
    type = "assembling-machine",
    name = "cube-beacon-fluid-source",
    localised_name = {"entity-name.cube-beacon"},
    localised_description = {"entity-description.cube-beacon"},
    icon = "__Krastorio2Assets__/icons/entities/singularity-beacon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-rotatable", "not-repairable", "not-blueprintable", "not-deconstructable"},
    placeable_by = {item = "cube-beacon", count = 1},
    allow_copy_paste = false,
    selectable_in_game = true,
    show_recipe_icon_on_map = false,
    hidden = true,
    max_health = 300,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers = {}},

    energy_usage = "800kW",
    energy_source = {
      type = "fluid",
      render_no_power_icon = true,
      render_no_network_icon = false,
      burns_fluid = true,
      scale_fluid_usage = true,
      fluid_box = {
        volume = 100,
        filter = "cube-beacon-juice",
        production_type = "input-output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = pipe_path,
        pipe_connections = {
          {flow_direction = "input-output", direction = defines.direction.north, position = {0, -1}},
          {flow_direction = "input-output", direction = defines.direction.west, position = {-1, 0}},
          {flow_direction = "input-output", direction = defines.direction.south, position = {0, 1}},
          {flow_direction = "input-output", direction = defines.direction.east, position = {1, 0}},
        },
      },
    },
    crafting_categories = {"cube-uncraftable"},
    crafting_speed = 0.5,  -- Must match by_tick size.
    fixed_recipe = "cube-uncraftable-dummy-recipe",
    show_recipe_icon = false,
    match_animation_speed_to_activity = false,
    allowed_effects = module_effects.none,
    module_slots = 0,
  }
})