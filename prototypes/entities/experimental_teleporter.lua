local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local teleporter_animation = {
  layers = {
    {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/planetary-teleporter-shadow.png",
      priority = "low",
      width = 531,
      height = 292,
      scale = 0.5,
      frame_count = 1,
      repeat_count = 20,
      draw_as_shadow = true,
      animation_speed = 0.5,
      shift = {1.9, 1.2},
    },
    {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-base-combined.png",
      priority = "medium",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
    },
    {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-under-forward-towers.png",
      priority = "medium",
      width = 400,
      height = 475,
      scale = 0.5,
      repeat_count = 20,
      animation_speed = 0.5,
    },
    {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-base-combined-glow.png",
      priority = "high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
      draw_as_glow = true,
      fadeout = true,
      blend_mode = "additive-soft",
    },
    {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-base-combined-glow.png",
      priority = "extra-high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
      draw_as_light = true,
      blend_mode = "additive-soft",
    },
    {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-forward-towers-light.png",
      priority = "extra-high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
    },
  },
}

local teleporter_animations_red = {
  {
    animation = {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-base-combined.png",
      priority = "medium",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
    },
  },
  {
    animation = {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-under-forward-towers.png",
      priority = "medium",
      width = 400,
      height = 475,
      scale = 0.5,
      repeat_count = 20,
      animation_speed = 0.5,
    },
  },
  {
    animation = {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-base-combined-glow-red.png",
      flags = {"mask"},
      priority = "extra-high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
      apply_runtime_tint = true,
      tint = {r = 1, g = 0, b = 0, a = 1},
    },
  },
  {
    animation = {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-base-combined-glow-red.png",
      priority = "high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
      draw_as_glow = true,
      fadeout = true,
      blend_mode = "additive-soft",
    },
  },
  {
    animation = {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-base-combined-glow-red.png",
      priority = "extra-high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
      draw_as_light = true,
      blend_mode = "additive-soft",
    },
  },
  {
    animation = {
      filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-forward-towers-light.png",
      priority = "extra-high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
    },
  },
}

local collision_index = 0
local function collision_entity(collision_box)
  collision_index = collision_index + 1
  return {
    type = "simple-entity",
    name = "cube-experimental-teleporter-collision-" .. collision_index,
    flags = {"not-on-map", "not-selectable-in-game", "placeable-off-grid"},
    collision_box = collision_box,
    picture = {filename = "__core__/graphics/empty.png", size = 1},
    collision_mask = {layers = {player = true}},
    squeak_behaviour = false,
  }
end

data:extend({
  {
    type = "rocket-silo",
    name = "cube-experimental-teleporter",
    icon = "__Krastorio2Assets__/icons/entities/planetary-teleporter.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
    map_color = {r = 0.337, g = 0.011, b = 0.184},
    max_health = 1000,
    minable = {mining_time = 1, result = "cube-experimental-teleporter"},
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    collision_box = {{-2.65, -1.9}, {2.65, 3.2}},
    selection_box = {{-3, -2}, {3, 3.4}},
    drawing_box = {{-3, -3}, {3, 3}},
    collision_mask = {
      layers = {item = true, object = true, water_tile = true},
    },
    -- Disable DLC silo behaviour even if space_travel feature flag is enabled.
    launch_to_space_platforms = false,

    energy_usage = "100MW",  -- Crafting.
    active_energy_usage = "100MW",  -- ??? not sure when this applies.
    idle_energy_usage = "0W",
    lamp_energy_usage = "0W",
    rocket_entity = "cube-experimental-teleporter-rocket",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    rocket_parts_required = 4,
    rocket_result_inventory_size = 1,
    crafting_speed = 1,
    crafting_categories = {"cube-experimental-teleporter"},
    fixed_recipe = "cube-teleporter-activation",
    show_recipe_icon = false,
    module_slots = 2,
    icons_positioning = {{
      inventory_index = defines.inventory.rocket_silo_modules,
      shift = {0, 2.35},
      scale = 0.625,
      separation_multiplier = 4,
    }},
    allowed_effects = module_effects.all,

    animation = teleporter_animation,
    launch_wait_time = 8,
    rocket_rising_delay = 1,
    rocket_quick_relaunch_start_offset = 0,
    cargo_station_parameters = {hatch_definitions = {{}}},

    arm_01_back_animation = util.empty_sprite(),
    arm_02_right_animation = util.empty_sprite(),
    arm_03_front_animation = util.empty_sprite(),
    hole_light_sprite = util.empty_sprite(),
    hole_sprite = util.empty_sprite(),
    shadow_sprite = util.empty_sprite(),
    satellite_animation = util.empty_sprite(),
    satellite_shadow_animation = util.empty_sprite(),
    rocket_glow_overlay_sprite = util.empty_sprite(),
    rocket_shadow_overlay_sprite = util.empty_sprite(),
    door_back_sprite = util.empty_sprite(),
    door_front_sprite = util.empty_sprite(),
    base_front_sprite = util.empty_sprite(),
    base_day_sprite = util.empty_sprite(),
    red_lights_back_sprites = util.empty_sprite(),
    red_lights_front_sprites = util.empty_sprite(),
    silo_fade_out_start_distance = 8,
    silo_fade_out_end_distance = 16,
    times_to_blink = 0,
    light_blinking_speed = 1,
    door_opening_speed = 1,
    door_back_open_offset = {0, 0},
    door_front_open_offset = {0, 0},
    hole_clipping_box = {{0, 0}, {0, 0}},

    vehicle_impact_sound = sounds.generic_impact,
    alarm_sound = {
      filename = "__Krastorio2Assets__/sounds/buildings/planetary-teleporter-close-sound.ogg",
      volume = 1,
    },
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/planetary-teleporter-working-sound.ogg",
        volume = 0.25,
      },
      idle_sound = {filename = "__base__/sound/idle1.ogg"},
      apparent_volume = 0.25,
    },
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    audible_distance_modifier = 1,
  },

  collision_entity({{-1.5, -1.5}, {1.5, 0.5}}),
  collision_entity({{-0.8, -1.5}, {1.4, 3.2}}),
  collision_entity({{-1.4, -1.5}, {0.8, 3.2}}),
  {
    type = "assembling-machine",
    name = "cube-experimental-teleporter-ready",
    localised_name = {"entity-name.cube-experimental-teleporter"},
    localised_description = {"entity-description.cube-experimental-teleporter"},
    icon = "__Krastorio2Assets__/icons/entities/planetary-teleporter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-repairable", "not-blueprintable", "not-deconstructable"},
    max_health = 1000,
    collision_mask = {layers = {}},
    selection_box = {{-3, -2}, {3, 3.4}},
    allow_copy_paste = false,
    selectable_in_game = false,
    show_recipe_icon = false,
    match_animation_speed_to_activity = false,
    hidden = true,

    picture = util.empty_sprite(),
    crafting_categories = {"cube-uncraftable"},
    crafting_speed = 1,
    fixed_recipe = "cube-uncraftable-dummy-recipe",
    energy_usage = "1W",
    energy_source = {type = "void"},
    working_visualisations = teleporter_animations_red,
  },
  {
    type = "simple-entity",
    name = "cube-experimental-teleporter-overlay",
    flags = {"not-on-map", "not-selectable-in-game", "placeable-off-grid"},
    collision_mask = {layers = {}},
    render_layer = "higher-object-above",
    picture = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/planetary-teleporter/new/teleporter-forward-towers.png",
          width = 400,
          height = 475,
          scale = 0.5,
        },
      },
    },
  },

  {
    type = "rocket-silo-rocket",
    name = "cube-experimental-teleporter-rocket",
    flags = {"not-on-map"},
    collision_mask = {not_colliding_with_itself = true, layers = {}},
    selection_box = {{0, 0}, {0, 0}},
    inventory_size = 1,
    rising_speed = 1,
    engine_starting_speed = 1,
    flying_speed = 1,
    flying_acceleration = 1,

    cargo_pod_entity = "cargo-pod",
    rocket_sprite = util.empty_sprite(),
    rocket_shadow_sprite = util.empty_sprite(),
    rocket_glare_overlay_sprite = util.empty_sprite(),
    rocket_smoke_top1_animation = util.empty_sprite(),
    rocket_smoke_top2_animation = util.empty_sprite(),
    rocket_smoke_top3_animation = util.empty_sprite(),
    rocket_smoke_bottom1_animation = util.empty_sprite(),
    rocket_smoke_bottom2_animation = util.empty_sprite(),
    rocket_flame_animation = util.empty_sprite(),
    rocket_flame_left_animation = util.empty_sprite(),
    rocket_flame_left_rotation = 0.05,
    rocket_flame_right_animation = util.empty_sprite(),
    rocket_flame_right_rotation = 0.05,

    rocket_rise_offset = {0, 0},
    rocket_launch_offset = {0, 0},
    rocket_render_layer_switch_distance = 0,
    full_render_layer_switch_distance = 1,
    effects_fade_in_start_distance = 0,
    effects_fade_in_end_distance = 1,
    shadow_fade_out_start_ratio = 0.25,
    shadow_fade_out_end_ratio = 0.75,
    rocket_visible_distance_from_center = 0,
  },
})
