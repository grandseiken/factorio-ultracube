require("__base__/prototypes/entity/combinator-pictures")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local function generate_2x1_combinator(data)
  data.icon = "__base__/graphics/icons/decider-combinator.png"
  data.icon_size = 64
  data.flags = {"placeable-neutral", "placeable-player", "player-creation"}
  data.max_health = 150
  data.corpse = "decider-combinator-remnants"
  data.dying_explosion = "decider-combinator-explosion"
  data.collision_box = {{-0.35, -0.65}, {0.35, 0.65}}
  data.selection_box = {{-0.5, -1}, {0.5, 1}}
  data.damaged_trigger_effect = hit_effects.entity()
  data.fast_replaceable_group = "cube-mechanical-2x1-combinator"
  data.energy_source = {
    type = "electric",
    usage_priority = "secondary-input"
  }
  data.vehicle_impact_sound = sounds.generic_impact
  data.open_sound = sounds.machine_open
  data.close_sound = sounds.machine_close
  data.open_sound.filename = "__base__/sound/power-switch-activate-3.ogg"
  data.close_sound.filename = "__base__/sound/power-switch-activate-1.ogg"
  data.close_sound.voume = 0.2
  data.working_sound = {
    sound = {
      filename = "__base__/sound/combinator.ogg",
      volume = 0.45
    },
    -- max_sounds_per_type = 2,
    fade_in_ticks = 4,
    fade_out_ticks = 20,
    audible_distance_modifier = 0.2,
    match_speed_to_activity = true
  }
  data.show_recipe_icon = false
  data.show_recipe_icon_on_map = false
  generate_decider_combinator(data)
  data.animation = data.sprites
  if not data.is_transition then
    data.working_visualisations = {
      {
          draw_as_light = true,
          north_animation = data.activity_led_sprites.north,
          south_animation = data.activity_led_sprites.south,
          east_animation = data.activity_led_sprites.east,
          west_animation = data.activity_led_sprites.west,
      }
    }
  end
  return data
end

local function generate_1x1_combinator(data, is_final)
  data.icon = "__base__/graphics/icons/constant-combinator.png"
  data.icon_size = 64
  data.flags = {"placeable-neutral", "placeable-player", "player-creation"}
  data.max_health = 120
  data.corpse = "constant-combinator-remnants"
  data.dying_explosion = "constant-combinator-explosion"
  data.collision_box = {{-0.35, -0.35}, {0.35, 0.35}}
  data.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
  data.damaged_trigger_effect = hit_effects.entity()
  data.fast_replaceable_group = "cube-mechanical-1x1-combinator"
  data.energy_source = {
    type = "electric",
    usage_priority = "secondary-input"
  }
  data.vehicle_impact_sound = sounds.generic_impact
  data.open_sound = sounds.machine_open
  data.close_sound = sounds.machine_close
  data.open_sound.filename = "__base__/sound/power-switch-activate-3.ogg"
  data.close_sound.filename = "__base__/sound/power-switch-activate-1.ogg"
  data.close_sound.voume = 0.2
  data.working_sound = {
    sound = {
      filename = "__base__/sound/combinator.ogg",
      volume = 0.45
    },
    -- max_sounds_per_type = 2,
    fade_in_ticks = 4,
    fade_out_ticks = 20,
    audible_distance_modifier = 0.2,
    match_speed_to_activity = true
  }
  data.show_recipe_icon = false
  data.show_recipe_icon_on_map = false
  generate_constant_combinator(data)
  data.animation = data.sprites
  if not data.is_transition then
    data.working_visualisations = {
      {
          draw_as_light = true,
          north_animation = data.activity_led_sprites.north,
          south_animation = data.activity_led_sprites.south,
          east_animation = data.activity_led_sprites.east,
          west_animation = data.activity_led_sprites.west,
      }
    }
  end
  return data
end

data:extend({
  generate_1x1_combinator {
    type = "assembling-machine",
    name = "cube-mechanical-network-source",
    fast_replaceable_group = "cube-mechanical-network-1x1-gate",
    minable = {mining_time = 0.1, result = "cube-mechanical-network-source"},
    crafting_categories = {"cube-mechanical-network-source"},
    fixed_recipe = "cube-mechanical-network-source-0",
    crafting_speed = 1,
    source_inventory_size = 0,
    result_inventory_size = 1,
    energy_usage = "100kW",
  },
  generate_1x1_combinator {
    type = "furnace",
    name = "cube-mechanical-network-sink",
    fast_replaceable_group = "cube-mechanical-network-1x1-gate",
    minable = {mining_time = 0.1, result = "cube-mechanical-network-sink"},
    crafting_categories = {"cube-mechanical-network-consume"},
    crafting_speed = 1,
    source_inventory_size = 1,
    result_inventory_size = 0,
    energy_usage = "100kW",
  },
  generate_1x1_combinator {
    type = "furnace",
    name = "cube-mechanical-network-not-gate",
    fast_replaceable_group = "cube-mechanical-network-1x1-gate",
    minable = {mining_time = 0.1, result = "cube-mechanical-network-not-gate"},
    crafting_categories = {"cube-mechanical-network-not-gate"},
    crafting_speed = 1,
    source_inventory_size = 1,
    result_inventory_size = 1,
    energy_usage = "10kW",
  },

  generate_2x1_combinator {
    type = "furnace",
    name = "cube-mechanical-network-and-gate",
    fast_replaceable_group = "cube-mechanical-network-2x1-gate",
    minable = {mining_time = 0.1, result = "cube-mechanical-network-and-gate"},
    crafting_categories = {"cube-mechanical-network-consume"},
    crafting_speed = 1,
    source_inventory_size = 1,
    result_inventory_size = 1,
    energy_usage = "20kW",
    is_transition = true,
  },
  generate_2x1_combinator {
    type = "furnace",
    name = "cube-mechanical-network-or-gate",
    fast_replaceable_group = "cube-mechanical-network-2x1-gate",
    minable = {mining_time = 0.1, result = "cube-mechanical-network-or-gate"},
    crafting_categories = {"cube-mechanical-network-consume"},
    crafting_speed = 1,
    source_inventory_size = 1,
    result_inventory_size = 1,
    energy_usage = "20kW",
    is_transition = true,
  },
  generate_2x1_combinator {
    type = "furnace",
    name = "cube-mechanical-network-xor-gate",
    fast_replaceable_group = "cube-mechanical-network-2x1-gate",
    minable = {mining_time = 0.1, result = "cube-mechanical-network-xor-gate"},
    crafting_categories = {"cube-mechanical-network-consume"},
    crafting_speed = 1,
    source_inventory_size = 1,
    result_inventory_size = 1,
    energy_usage = "20kW",
    is_transition = true,
  },
})