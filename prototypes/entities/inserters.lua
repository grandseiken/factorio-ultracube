local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local explosion_animations = require("__base__/prototypes/entity/explosion-animations")

-- Reinstate 1.1 filter inserters.
data.raw.inserter["inserter"].filter_count = 0
data.raw.inserter["fast-inserter"].filter_count = 0
data.raw.inserter["bulk-inserter"].filter_count = 0
data.raw.inserter["long-handed-inserter"].filter_count = 0

local particle_animations = {}
particle_animations.get_metal_particle_medium_pictures = function(options)
  local options = options or {}
  return {
    sheet = {
      filename = "__base__/graphics/particle/metal-particle/hr-metal-particle-medium.png",
      priority = "extra-high",
      width = 30,
      height = 30,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(2.25,0.75), options.shift),
      scale = 0.5,
    }
  }
end
particle_animations.get_metal_particle_small_pictures = function(options)
  local options = options or {}
  return {
    sheet = {
      filename = "__base__/graphics/particle/metal-particle/hr-metal-particle-small.png",
      priority = "extra-high",
      width = 20,
      height = 16,
      tint = options.tint,
      frame_count = 12,
      animation_speed = 0.5,
      variation_count = 10,
      shift = util.add_shift(util.by_pixel(2.25,-0.25), options.shift),
      scale = 0.5,
    }
  }
end

local default_ended_in_water_trigger_effect = function()
  return {
    {
      type = "create-particle",
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "secondary",
      offset_deviation = {{-0.05, -0.05}, {0.05, 0.05}},
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.05,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 3,
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 6,
      probability = 0.03,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "primary",
      offsets = {
        {0, 0},
        {0.01563, -0.09375},
        {0.0625, 0.09375},
        {-0.1094, 0.0625}
      },
      offset_deviation = {{-0.2969, -0.1992}, {0.2969, 0.1992}},
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.053,
      initial_vertical_speed_deviation = 0.005,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 9,
      tail_length_deviation = 0,
      tail_width = 1,
    },
    {
      type = "play-sound",
      sound = sounds.small_splash,
    }
  }
end

local small_smoke_trigger_effect = function()
  return {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-particle-small",
    starting_frame_deviation = 0,
    starting_frame_speed_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local make_particle = function(params)
  return {
    type = "optimized-particle",
    name = params.name,
    life_time = 60 * 15,
    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = "corpse",
    regular_trigger_effect_frequency = 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    pictures = params.pictures,
    shadows = params.shadows,
  }
end

data:extend({
  make_particle {
    name = "filter-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.648, g = 0.648, b = 0.648, a = 1.0}}),
    shadows = particle_animations.get_metal_particle_small_pictures({tint = {r = 0, g = 0, b = 0}, shift = util.by_pixel(1, 0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },
  make_particle {
    name = "filter-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.571, g = 0.419, b = 0.594, a = 1.0}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0, g = 0, b = 0}, shift = util.by_pixel(1, 0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },
  make_particle {
    name = "stack-filter-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.590, g = 0.502, b = 0.401, a = 1.0}}),
    shadows = particle_animations.get_metal_particle_small_pictures({tint = {r = 0, g = 0, b = 0}, shift = util.by_pixel(1, 0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },
  make_particle {
    name = "stack-filter-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.731, g = 0.731, b = 0.731, a = 1.0}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0, g = 0, b = 0}, shift = util.by_pixel(1, 0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },
  {
    type = "corpse",
    name = "filter-inserter-remnants",
    icon = "__base__/graphics/icons/filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-e-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(4, {
      filename = "__base__/graphics/entity/filter-inserter/remnants/hr-filter-inserter-remnants.png",
      line_length = 1,
      width = 134,
      height = 94,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(3.5, -2),
      scale = 0.5,
    })
  },
  {
    type = "corpse",
    name = "stack-filter-inserter-remnants",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-g-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(4, {
      filename = "__base__/graphics/entity/stack-filter-inserter/remnants/hr-stack-filter-inserter-remnants.png",
      line_length = 1,
      width = 132,
      height = 96,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(3, -1.5),
      scale = 0.5,
    })
  },
  {
    type = "explosion",
    name = "filter-inserter-explosion",
    icon = "__base__/graphics/icons/filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "inserter-explosions",
    order = "c-e-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    --light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "filter-inserter-metal-particle-medium",
            offset_deviation = {{-0.5, -0.4922}, {0.5, 0.4922}},
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "filter-inserter-metal-particle-small",
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
            initial_height = 0.3,
            initial_height_deviation = 0.4,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "stack-filter-inserter-explosion",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "inserter-explosions",
    order = "c-g-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    --light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "stack-filter-inserter-metal-particle-medium",
            offset_deviation = {{-0.5, -0.4922}, {0.5, 0.4922}},
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "stack-filter-inserter-metal-particle-small",
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
            initial_height = 0.3,
            initial_height_deviation = 0.4,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
          }
        }
      }
    }
  },
  {
    type = "inserter",
    name = "filter-inserter",
    icon = "__base__/graphics/icons/filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "filter-inserter"},
    max_health = 150,
    corpse = "filter-inserter-remnants",
    dying_explosion = "filter-inserter-explosion",
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.inserter_fast,
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "8kJ",
    energy_per_rotation = "8kJ",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.5kW"
    },
    extension_speed = 0.07,
    rotation_speed = 0.04,
    fast_replaceable_group = "inserter",
    filter_count = 5,
    hand_base_picture = {
      filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25,
    },
    hand_closed_picture = {
      filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-hand-closed.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25,
    },
    hand_open_picture = {
      filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-hand-open.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25,
    },
    hand_base_shadow = {
      filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25,
    },
    hand_closed_shadow = {
      filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25,
    },
    hand_open_shadow = {
      filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25,
    },
    platform_picture = {
      sheet = {
        filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5,
      }
    },

    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = "bulk-filter-inserter",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    stack = true,
    filter_count = 1,
    minable = {mining_time = 0.1, result = "bulk-filter-inserter"},
    max_health = 160,
    corpse = "stack-filter-inserter-remnants",
    dying_explosion = "stack-filter-inserter-explosion",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "20kJ",
    energy_per_rotation = "20kJ",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW",
    },
    extension_speed = 0.07,
    rotation_speed = 0.04,
    fast_replaceable_group = "inserter",
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.inserter_fast,
    hand_base_picture = {
      filename = "__base__/graphics/entity/stack-filter-inserter/hr-stack-filter-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25,
    },
    hand_closed_picture = {
      filename = "__base__/graphics/entity/stack-filter-inserter/hr-stack-filter-inserter-hand-closed.png",
      priority = "extra-high",
      width = 100,
      height = 164,
      scale = 0.25,
    },
    hand_open_picture = {
      filename = "__base__/graphics/entity/stack-filter-inserter/hr-stack-filter-inserter-hand-open.png",
      priority = "extra-high",
      width = 130,
      height = 164,
      scale = 0.25,
    },
    hand_base_shadow = {
      filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25,
    },
    hand_closed_shadow = {
      filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 100,
      height = 164,
      scale = 0.25,
    },
    hand_open_shadow = {
      filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 130,
      height = 164,
      scale = 0.25,
    },
    platform_picture = {
      sheet = {
        filename = "__base__/graphics/entity/stack-filter-inserter/hr-stack-filter-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5,
      }
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal,
  },
})

data.raw.inserter["bulk-inserter"].stack_size_bonus = 3
data.raw.inserter["bulk-filter-inserter"].stack_size_bonus = 3
data.raw.inserter["long-handed-inserter"].fast_replaceable_group = "inserter"

-- Extremely long-handed inserter.
data:extend({
  {
    type = "corpse",
    name = "cube-extremely-long-inserter-remnants",
    localised_name = {"remnant-name", {"entity-name.cube-extremely-long-inserter"}},
    icon = "__Ultracube__/assets/icons/extremely-long-inserter.png",
    icon_size = 64,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order = "cube-d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(3, {
      filename = "__Krastorio2Assets__/entities/remnants/superior-inserter/hr-superior-inserter-remnant.png",
      line_length = 1,
      width = 102,
      height = 80,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0.5, 4.5),
      scale = 0.5,
    }),
  },
  {
    type = "inserter",
    name = "cube-extremely-long-inserter",
    icon = "__Ultracube__/assets/icons/extremely-long-inserter.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    filter_count = 4,
    minable = {mining_time = 0.1, result = "cube-extremely-long-inserter"},
    max_health = 200,
    corpse = "cube-extremely-long-inserter-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -5},
    insert_position = {0, 5.2},
    energy_per_movement = "40kJ",
    energy_per_rotation = "40kJ",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW",
    },
    extension_speed = 0.0957,
    rotation_speed = 0.02,
    fast_replaceable_group = "inserter",
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = sounds.inserter_fast,
    hand_size = 2.625,
    hand_base_picture = {
      filename = "__Ultracube__/assets/inserter/hr-extremely-long-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 272,
      scale = 0.25,
    },
    hand_closed_picture = {
      filename = "__Ultracube__/assets/inserter/hr-extremely-long-inserter-hand-closed.png",
      priority = "extra-high",
      width = 72,
      height = 328,
      scale = 0.25,
    },
    hand_open_picture = {
      filename = "__Ultracube__/assets/inserter/hr-extremely-long-inserter-hand-open.png",
      priority = "extra-high",
      width = 72,
      height = 328,
      scale = 0.25,
    },
    hand_base_shadow = {
      filename = "__Ultracube__/assets/inserter/hr-extremely-long-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 272,
      scale = 0.25,
    },
    hand_closed_shadow = {
      filename = "__Ultracube__/assets/inserter/hr-extremely-long-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 328,
      scale = 0.25,
    },
    hand_open_shadow = {
      filename = "__Ultracube__/assets/inserter/hr-extremely-long-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 328,
      scale = 0.25,
    },
    platform_picture = {
      sheet = {
        filename = "__Krastorio2Assets__/entities/superior-inserters/hr-superior-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5 - 1),
        scale = 0.5,
      },
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal,
  },
})