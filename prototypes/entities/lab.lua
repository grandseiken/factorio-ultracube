local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
require("__Ultracube__/prototypes/entities/lib/module_effects")

data:extend({
  {
    type = "lab",
    name = "cube-lab",
    icon = "__krastorio2-assets-ultracube__/icons/entities/biusart-lab.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.25, result = "cube-lab"},
    max_health = 200,
    corpse = "lab-remnants",
    dying_explosion = "lab-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    light = {
      intensity = 0.8,
      size = 4,
      color = {r = 255, g = 255, b = 255},
    },
    on_animation = {
      layers = {
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab-anim-light.png",
          width = 150,
          height = 150,
          frame_count = 29,
          line_length = 10,
          animation_speed = 1 / 3,
          shift = { 0, -0.05 },
          draw_as_light = true,
          scale = 0.64,
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab-anim.png",
          width = 150,
          height = 150,
          frame_count = 29,
          line_length = 10,
          animation_speed = 1 / 3,
          shift = { 0, -0.05 },
          scale = 0.64,
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab-anim.png",
          width = 150,
          height = 150,
          frame_count = 29,
          line_length = 10,
          animation_speed = 1 / 3,
          shift = { 0, -0.05 },
          scale = 0.64,
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab-anim.png",
          width = 150,
          height = 150,
          frame_count = 29,
          line_length = 10,
          animation_speed = 1 / 3,
          shift = { 0, -0.05 },
          scale = 0.64,
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab-light-anim.png",
          width = 150,
          height = 150,
          frame_count = 29,
          line_length = 10,
          animation_speed = 1 / 3,
          shift = { 0, -0.05 },
          scale = 0.64,
          blend_mode = "additive-soft",
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab-light-anim.png",
          width = 150,
          height = 150,
          frame_count = 29,
          line_length = 10,
          animation_speed = 1 / 3,
          shift = { 0, -0.05 },
          draw_as_light = true,
          scale = 0.64,
          blend_mode = "additive-soft",
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab-shadow.png",
          width = 240,
          height = 240,
          frame_count = 1,
          line_length = 1,
          repeat_count = 29,
          animation_speed = 1,
          shift = { 0, -0.20 },
          scale = 0.75,
          draw_as_shadow = true,
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab-ao.png",
          width = 220,
          height = 220,
          frame_count = 1,
          repeat_count = 29,
          animation_speed = 1 / 3,
          shift = { 0, -0.05 },
          scale = 0.50,
        },
      },
    },
    off_animation = {
      layers = {
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab.png",
          width = 150,
          height = 150,
          frame_count = 1,
          shift = { 0, -0.05 },
          scale = 0.64,
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab-shadow.png",
          width = 240,
          height = 240,
          frame_count = 1,
          repeat_count = 1,
          shift = { 0, -0.20 },
          scale = 0.75,
          draw_as_shadow = true,
        },
        {
          filename = "__krastorio2-assets-ultracube__/buildings/biusart-lab/biusart-lab-ao.png",
          width = 220,
          height = 220,
          frame_count = 1,
          repeat_count = 1,
          animation_speed = 1 / 3,
          shift = { 0, -0.05 },
          scale = 0.5,
        },
      },
    },
    working_sound = {
      sound = {
        filename = "__krastorio2-assets-ultracube__/sounds/buildings/biusart-lab.ogg",
        volume = 0.7
      },
      audible_distance_modifier = 0.7,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "10kW",
    },
    energy_usage = "250kW",
    researching_speed = 1,
    inputs = {
      "cube-basic-contemplation-unit",
      "cube-fundamental-comprehension-card",
      "cube-abstract-interrogation-card",
      "cube-deep-introspection-card",
      "cube-synthetic-premonition-card",
      "cube-complete-annihilation-card",
    },
    module_slots = 2,
    icons_positioning = {{
      inventory_index = defines.inventory.lab_modules,
      shift = {0, 0.9},
    }},
    allowed_effects = module_effects.all,
  },
})
