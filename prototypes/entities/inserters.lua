local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

-- Reinstate 1.1 filter inserters.
data.raw.inserter["inserter"].filter_count = 0
data.raw.inserter["fast-inserter"].filter_count = 0
data.raw.inserter["stack-inserter"].filter_count = 0
data.raw.inserter["long-handed-inserter"].filter_count = 0

data:extend({
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
    energy_per_movement = "8KJ",
    energy_per_rotation = "8KJ",
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

    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
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
    minable = {mining_time = 0.1, result = "stack-filter-inserter"},
    max_health = 160,
    corpse = "stack-filter-inserter-remnants",
    dying_explosion = "stack-filter-inserter-explosion",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "20KJ",
    energy_per_rotation = "20KJ",
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
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
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
    energy_per_movement = "40KJ",
    energy_per_rotation = "40KJ",
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
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal,
  },
})