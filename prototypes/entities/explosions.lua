local function add_cluster_offsets(source, count, distance, angle_offset, t)
  for i = 0, count - 1 do
    local a = 2 * math.pi * (i + angle_offset) / count
    local tt = table.deepcopy(t)
    tt.offset_deviation = {{distance * math.sin(a) * 0.75, distance * math.cos(a) * 0.75},
                           {distance * math.sin(a), distance * math.cos(a)}}
    source[#source + 1] = tt
  end
  return source
end

local function make_empty_animation(frame_count)
  return {
    filename = "__Krastorio2Assets__/entities/empty.png",
    priority = "high",
    width = 1,
    height = 1,
    frame_count = 1,
    repeat_count = frame_count,
  }
end

local blue_light = {r=0.6, g=0.7, b=1.0}
local red_light = {r=1.0, g=0.6, b=0.7}

local function blood_particle_pictures(tint, shift)
  return {
    sheet = {
      filename = "__base__/graphics/particle/blood-particle/blood-particle.png",
      line_length = 12,
      width = 10,
      height = 8,
      frame_count = 12,
      variation_count = 7,
      tint = tint,
      shift = util.add_shift(util.by_pixel(2,-1), shift),
      hr_version = {
        filename = "__base__/graphics/particle/blood-particle/hr-blood-particle.png",
        line_length = 12,
        width = 16,
        height = 16,
        frame_count = 12,
        variation_count = 7,
        tint = tint,
        scale = 0.5,
        shift = util.add_shift(util.by_pixel(1.5,-1), shift)
      }
    }
  }
end

local function make_spark_particle(name, filename, hr_filename)
  return {
    type = "optimized-particle",
    name = name,
    life_time = 20,
    fade_away_duration = 8,
    render_layer = "wires-above",
    render_layer_when_on_ground = "corpse",
    pictures = {
      sheet = {
        filename = filename,
        draw_as_glow = true,
        line_length = 12,
        width = 4,
        height = 4,
        frame_count = 12,
        variation_count = 3,
        shift = util.by_pixel(0,0),
        hr_version = {
          filename = hr_filename,
          draw_as_glow = true,
          line_length = 12,
          width = 6,
          height = 6,
          frame_count = 12,
          variation_count = 3,
          scale = 0.5,
          shift = util.by_pixel(0,0)
        }
      }
    },
    movement_modifier_when_on_ground = 0,
  }
end

local function make_spark_explosion(name, particle, color, height)
  return {
    type = "explosion",
    name = name,
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"placeable-off-grid", "not-on-map", "hidden"},
    subgroup = "explosions",
    light = {intensity = 0.25, size = 4, color = color},
    animations = make_empty_animation(),
    sound = {
      preload = true,
      aggregation = {
        max_count = 1,
        remove = true,
      },
      audible_distance_modifier = 1,
      variations = {
        {filename = "__Ultracube__/assets/sounds/zap-1.ogg", volume = 1 / 8, min_speed = 0.875, max_speed = 1.125},
        {filename = "__Ultracube__/assets/sounds/zap-2.ogg", volume = 1 / 8, min_speed = 0.875, max_speed = 1.125},
        {filename = "__Ultracube__/assets/sounds/zap-3.ogg", volume = 1 / 8, min_speed = 0.875, max_speed = 1.125},
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          {
            type = "create-particle",
            particle_name = particle,
            repeat_count = 4,
            repeat_count_deviation = 2,
            initial_height = height,
            initial_vertical_speed = 1.0 / 32,
            initial_vertical_speed_deviation = 1.0 / 128,
            tail_width = 4,
            tail_length = 10,
            frame_speed = 1,
            frame_speed_variation = 0.25,
            speed_from_center = 0.0125,
            speed_from_center_deviation = 0.005,
            offset_deviation = {{-0.125, -0.125}, {0.125, 0.125}},
          },
        },
      },
    },
  }
end

local function make_puff_explosion(name, height)
  return {
    type = "explosion",
    name = name,
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"placeable-off-grid", "not-on-map", "hidden"},
    subgroup = "explosions",
    light = {intensity = 0.25, size = 2, color = blue_light},
    animations = make_empty_animation(12),
    sound = {
      preload = true,
      aggregation = {
        max_count = 16,
        remove = true,
      },
      audible_distance_modifier = 1,
      variations = {
        {filename = "__Ultracube__/assets/sounds/celesta-08.ogg", volume = 1 / 6, min_speed = 0.925, max_speed = 1.05},
        {filename = "__Ultracube__/assets/sounds/celesta-13.ogg", volume = 1 / 6, min_speed = 0.925, max_speed = 1.05},
        {filename = "__Ultracube__/assets/sounds/celesta-15.ogg", volume = 1 / 6, min_speed = 0.925, max_speed = 1.05},
        {filename = "__Ultracube__/assets/sounds/celesta-20.ogg", volume = 1 / 6, min_speed = 0.925, max_speed = 1.05},
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          {
            type = "create-particle",
            particle_name = "cube-phantom-puff",
            repeat_count = 1,
            repeat_count_deviation = 0,
            initial_height = height,
            initial_vertical_speed = 1.5 / 64,
            initial_vertical_speed_deviation = 1.0 / 128,
            tail_width = 2,
            tail_length = 5,
            frame_speed = 1,
            frame_speed_variation = 0.25,
            speed_from_center = 0,
            speed_from_center_deviation = 0,
            offset_deviation = {{-1.0 / 8, -1.0 / 8}, {1.0 / 8, 1.0 / 8}},
          },
        },
      },
    },
  }
end

local function make_cube_shockwave_1(name, base_filename)
  return {
    type = "optimized-particle",
    name = name,
    life_time = 100,
    vertical_acceleration = 0,
    fade_away_duration = 60,
    render_layer = "object",
    pictures = {
      filename = "__Ultracube__/assets/effects/" .. base_filename .. ".png",
      priority = "high",
      flags = {"smoke"},
      line_length = 8,
      width = 66,
      height = 68,
      frame_count = 32,
      animation_speed = 0.5,
      variation_count = 1,
      scale = 3 / 8,
      shift = util.by_pixel(-1, 0),
      tint = {0.5, 0.5, 0.5, 1.0},
      blend_mode = "additive-soft",
      hr_version = {
        filename = "__Ultracube__/assets/effects/hr-" .. base_filename .. ".png",
        priority = "high",
        flags = {"smoke"},
        line_length = 8,
        width = 132,
        height = 136,
        frame_count = 32,
        animation_speed = 0.5,
        variation_count = 1,
        shift = util.by_pixel(-0.5, 0),
        scale = 1.5 / 8,
        tint = {0.5, 0.5, 0.5, 1.0},
        blend_mode = "additive-soft",
      },
    },
    shadows = {
      filename = "__Ultracube__/assets/effects/" .. base_filename .. ".png",
      priority = "high",
      flags = {"smoke"},
      line_length = 8,
      width = 66,
      height = 68,
      frame_count = 32,
      animation_speed = 0.5,
      variation_count = 1,
      scale = 3 / 8,
      shift = util.by_pixel(-1, 0),
      tint = {0, 0, 0, 0.5},
      hr_version = {
        filename = "__Ultracube__/assets/effects/hr-" .. base_filename .. ".png",
        priority = "high",
        flags = {"smoke"},
        line_length = 8,
        width = 132,
        height = 136,
        frame_count = 32,
        animation_speed = 0.5,
        variation_count = 1,
        shift = util.by_pixel(-0.5, 0),
        scale = 1.5 / 8,
        tint = {0, 0, 0, 0.5},
      },
    },
  }
end

local function make_cube_shockwave_2(name, base_filename)
  return {
    type = "optimized-particle",
    name = name,
    vertical_acceleration = 0,
    life_time = 100,
    fade_away_duration = 60,
    render_layer = "object",
    pictures = {
      filename = "__Ultracube__/assets/effects/" .. base_filename .. ".png",
      priority = "high",
      flags = {"smoke"},
      line_length = 8,
      width = 56,
      height = 64,
      frame_count = 32,
      animation_speed = 0.5,
      variation_count = 1,
      scale = 3 / 8,
      shift = util.by_pixel(-1, 0),
      tint = {0.5, 0.5, 0.5, 1.0},
      blend_mode = "additive-soft",
      hr_version = {
        filename = "__Ultracube__/assets/effects/hr-" .. base_filename .. ".png",
        priority = "high",
        flags = {"smoke"},
        line_length = 8,
        width = 110,
        height = 128,
        frame_count = 32,
        animation_speed = 0.5,
        variation_count = 1,
        shift = util.by_pixel(0, 3),
        scale = 1.5 / 8,
        tint = {0.5, 0.5, 0.5, 1.0},
        blend_mode = "additive-soft",
      },
    },
    shadows = {
      filename = "__Ultracube__/assets/effects/" .. base_filename .. ".png",
      priority = "high",
      flags = {"smoke"},
      line_length = 8,
      width = 56,
      height = 64,
      frame_count = 32,
      animation_speed = 0.5,
      variation_count = 1,
      scale = 3 / 8,
      shift = util.by_pixel(-1, 0),
      tint = {0, 0, 0, 0.5},
      hr_version = {
        filename = "__Ultracube__/assets/effects/hr-" .. base_filename .. ".png",
        priority = "high",
        flags = {"smoke"},
        line_length = 8,
        width = 110,
        height = 128,
        frame_count = 32,
        animation_speed = 0.5,
        variation_count = 1,
        shift = util.by_pixel(0, 3),
        scale = 1.5 / 8,
        tint = {0, 0, 0, 0.5},
      },
    },
  }
end

local function make_periodic_explosion(name, color, base_shockwave, base_explosion)
  return {
    type = "explosion",
    name = name,
    localised_name = {"entity-name.big-explosion"},
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"placeable-off-grid", "not-on-map", "hidden"},
    subgroup = "explosions",
    render_layer = "higher-object-above",
    animations = {
      {
        filename = "__Ultracube__/assets/effects/" .. base_explosion .. "-1.png",
        draw_as_glow = true,
        priority = "high",
        width = 62,
        height = 112,
        frame_count = 30,
        line_length = 6,
        shift = util.by_pixel(-1, -20),
        animation_speed = 0.5,
        hr_version =
        {
          filename = "__Ultracube__/assets/effects/hr-" .. base_explosion .. "-1.png",
          draw_as_glow = true,
          priority = "high",
          width = 124,
          height = 224,
          frame_count = 30,
          line_length = 6,
          shift = util.by_pixel(-1, -20),
          animation_speed = 0.5,
          scale = 0.5
        }
      },
      {
        filename = "__Ultracube__/assets/effects/" .. base_explosion .. "-2.png",
        draw_as_glow = true,
        priority = "high",
        width = 78,
        height = 106,
        frame_count = 41,
        line_length = 6,
        shift = util.by_pixel(-13, -18),
        animation_speed = 0.5,
        hr_version =
        {
          filename = "__Ultracube__/assets/effects/hr-" .. base_explosion .. "-2.png",
          draw_as_glow = true,
          priority = "high",
          width = 154,
          height = 212,
          frame_count = 41,
          line_length = 6,
          shift = util.by_pixel(-13, -18),
          animation_speed = 0.5,
          scale = 0.5
        }
      },
      {
        filename = "__Ultracube__/assets/effects/" .. base_explosion .. "-3.png",
        draw_as_glow = true,
        priority = "high",
        width = 64,
        height = 118,
        frame_count = 39,
        line_length = 6,
        shift = util.by_pixel(1, -19),
        animation_speed = 0.5,
        hr_version =
        {
          filename = "__Ultracube__/assets/effects/hr-" .. base_explosion .. "-3.png",
          draw_as_glow = true,
          priority = "high",
          width = 126,
          height = 236,
          frame_count = 39,
          line_length = 6,
          shift = util.by_pixel(0.5, -19),
          animation_speed = 0.5,
          scale = 0.5
        }
      }
    },
    light = {intensity = 1, size = 16, color = color},
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = add_cluster_offsets(
          add_cluster_offsets(
            {
              {
                type = "play-sound",
                sound = {
                  preload = true,
                  aggregation = {
                    max_count = 1,
                    remove = true,
                  },
                  audible_distance_modifier = 1,
                  variations = {
                    {filename = "__base__/sound/fight/nuclear-explosion-1.ogg", volume = 0.25, min_speed = 1.225, max_speed = 1.275},
                    {filename = "__base__/sound/fight/nuclear-explosion-2.ogg", volume = 0.25, min_speed = 1.225, max_speed = 1.275},
                    {filename = "__base__/sound/fight/nuclear-explosion-3.ogg", volume = 0.25, min_speed = 1.225, max_speed = 1.275},
                  },
                },
              },
            },
            8, 0.125, 0,
            {
              type = "create-particle",
              particle_name = base_shockwave .. "-1",
              repeat_count = 1,
              initial_height = 0.125,
              frame_speed = 1,
              frame_speed_variation = 0.25,
              tail_length = 12,
              tail_width = 8,
              speed_from_center = 0.015,
              speed_from_center_deviation = 0,
            }
          ),
          8, 0.125, 0.5,
          {
            type = "create-particle",
            particle_name = base_shockwave .. "-2",
            repeat_count = 1,
            initial_height = 0.125,
            frame_speed = 1,
            frame_speed_variation = 0.25,
            tail_length = 12,
            tail_width = 8,
            speed_from_center = 0.015,
            speed_from_center_deviation = 0,
          }
        ),
      },
    },
  }
end

data:extend({
  make_spark_particle("cube-spark-particle",
                      "__base__/graphics/particle/pole-sparks/pole-sparks.png",
                      "__base__/graphics/particle/pole-sparks/hr-pole-sparks.png"),
  make_spark_particle("cube-fuel-spark-particle",
                      "__Ultracube__/assets/effects/fuel-sparks.png",
                      "__Ultracube__/assets/effects/hr-fuel-sparks.png"),
  make_spark_explosion("cube-periodic-ultradense-high-spark",
                       "cube-spark-particle", blue_light, 0.75),
  make_spark_explosion("cube-periodic-ultradense-low-spark",
                       "cube-spark-particle", blue_light, 0.125),
  make_spark_explosion("cube-periodic-combustion-high-spark",
                       "cube-fuel-spark-particle", red_light, 0.75),
  make_spark_explosion("cube-periodic-combustion-low-spark",
                       "cube-fuel-spark-particle", red_light, 0.125),
  make_puff_explosion("cube-periodic-phantom-high-puff", 0.75),
  make_puff_explosion("cube-periodic-phantom-low-puff", 0.125),
  make_cube_shockwave_1("cube-ultradense-shockwave-1", "cube-shockwave-1"),
  make_cube_shockwave_2("cube-ultradense-shockwave-2", "cube-shockwave-2"),
  make_cube_shockwave_1("cube-combustion-shockwave-1", "cube-fuel-shockwave-1"),
  make_cube_shockwave_2("cube-combustion-shockwave-2", "cube-fuel-shockwave-2"),
  make_periodic_explosion("cube-periodic-ultradense-explosion", blue_light,
                          "cube-ultradense-shockwave", "cube-medium-explosion"),
  make_periodic_explosion("cube-periodic-combustion-explosion", red_light,
                          "cube-combustion-shockwave", "cube-fuel-medium-explosion"),

  {
    type = "optimized-particle",
    name = "cube-phantom-puff",
    vertical_acceleration = 0.0025,
    life_time = 32,
    fade_away_duration = 16,
    render_layer = "higher-object-above",
    pictures = {
      filename = "__Ultracube__/assets/effects/phantom-puff.png",
      priority = "high",
      flags = {"smoke"},
      line_length = 4,
      width = 128,
      height = 128,
      frame_count = 16,
      animation_speed = 0.5,
      variation_count = 1,
      scale = 1.0 / 8,
      tint = {1.0, 1.0, 1.0, 0.5},
      blend_mode = "additive-soft",
      hr_version = {
        filename = "__Ultracube__/assets/effects/phantom-puff.png",
        priority = "high",
        flags = {"smoke"},
        line_length = 4,
        width = 128,
        height = 128,
        frame_count = 16,
        animation_speed = 0.5,
        variation_count = 1,
        scale = 1.0 / 8,
        tint = {1.0, 1.0, 1.0, 0.5},
        blend_mode = "additive-soft",
      },
    },
    shadows = {
      filename = "__Ultracube__/assets/effects/phantom-puff.png",
      priority = "high",
      flags = {"smoke"},
      line_length = 4,
      width = 128,
      height = 128,
      frame_count = 16,
      animation_speed = 0.5,
      variation_count = 1,
      scale = 1.0 / 8,
      tint = {0, 0, 0, 0.5},
      hr_version = {
        filename = "__Ultracube__/assets/effects/phantom-puff.png",
        priority = "high",
        flags = {"smoke"},
        line_length = 4,
        width = 128,
        height = 128,
        frame_count = 16,
        animation_speed = 0.5,
        variation_count = 1,
        scale = 1.0 / 8,
        tint = {0, 0, 0, 0.5},
      },
    },
  },

  {
    type = "explosion",
    name = "cube-periodic-dormant-explosion",
    localised_name = {"entity-name.medium-explosion"},
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"placeable-off-grid", "not-on-map", "hidden"},
    subgroup = "explosions",
    render_layer = "higher-object-above",
    animations = make_empty_animation(),
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = add_cluster_offsets(
          add_cluster_offsets(
            {
              {
                type = "play-sound",
                sound = {
                  preload = true,
                  aggregation = {
                    max_count = 1,
                    remove = true,
                  },
                  audible_distance_modifier = 1,
                  variations = {
                    {filename = "__base__/sound/fight/robot-die-vox-01.ogg", volume = 0.25},
                    {filename = "__base__/sound/fight/robot-die-vox-02.ogg", volume = 0.25},
                    {filename = "__base__/sound/fight/robot-die-vox-03.ogg", volume = 0.25},
                    {filename = "__base__/sound/fight/robot-die-vox-04.ogg", volume = 0.25},
                    {filename = "__base__/sound/fight/robot-die-vox-05.ogg", volume = 0.25},
                    {filename = "__base__/sound/fight/robot-die-vox-06.ogg", volume = 0.25},
                  },
                },
              },
              {
                type = "play-sound",
                sound = {
                  preload = true,
                  aggregation = {
                    max_count = 1,
                    remove = true,
                  },
                  audible_distance_modifier = 1,
                  variations = {
                    {filename = "__base__/sound/fight/robot-die-impact-01.ogg", volume = 0.5},
                    {filename = "__base__/sound/fight/robot-die-impact-02.ogg", volume = 0.5},
                    {filename = "__base__/sound/fight/robot-die-impact-03.ogg", volume = 0.5},
                  },
                },
              },
            },
            8, 0.125, 0,
            {
              type = "create-particle",
              particle_name = "cube-ultradense-shockwave-1",
              repeat_count = 1,
              initial_height = 0.125,
              frame_speed = 1,
              frame_speed_variation = 0.25,
              tail_length = 12,
              tail_width = 8,
              speed_from_center = 0.015,
              speed_from_center_deviation = 0,
            }
          ),
          8, 0.125, 0.5,
          {
            type = "create-particle",
            particle_name = "cube-ultradense-shockwave-2",
            repeat_count = 1,
            initial_height = 0.125,
            frame_speed = 1,
            frame_speed_variation = 0.25,
            tail_length = 12,
            tail_width = 8,
            speed_from_center = 0.015,
            speed_from_center_deviation = 0,
          }
        ),
      },
    },
  },

  {
    type = "explosion",
    name = "cube-periodic-phantom-explosion",
    localised_name = {"entity-name.medium-explosion"},
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"placeable-off-grid", "not-on-map", "hidden"},
    light = {intensity = 0.5, size = 4, color = blue_light},
    subgroup = "explosions",
    render_layer = "higher-object-above",
    animations = make_empty_animation(32),
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = add_cluster_offsets(
          add_cluster_offsets(
            {
              {
                type = "play-sound",
                sound = {
                  preload = true,
                  aggregation = {
                    max_count = 16,
                    remove = true,
                  },
                  audible_distance_modifier = 0.75,
                  variations = {
                    {filename = "__base__/sound/fight/pulse.ogg", volume = 1 / 7, min_speed = 0.875, max_speed = 1.125},
                  },
                },
              },
              {
                type = "play-sound",
                sound = {
                  preload = true,
                  aggregation = {
                    max_count = 16,
                    remove = true,
                  },
                  audible_distance_modifier = 1,
                  variations = {
                    {filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg", volume = 1 / 8, min_speed = 0.875, max_speed = 1.125},
                    {filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg", volume = 1 / 8, min_speed = 0.875, max_speed = 1.125},
                    {filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg", volume = 1 / 8, min_speed = 0.875, max_speed = 1.125},
                    {filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg", volume = 1 / 8, min_speed = 0.875, max_speed = 1.125},
                  },
                },
              },
            },
            12, 0.125, 0,
            {
              type = "create-particle",
              particle_name = "cube-phantom-splat",
              repeat_count = 1,
              initial_height = 0.125,
              initial_vertical_speed = 1 / 12,
              initial_vertical_speed_deviation = 1 / 16,
              frame_speed = 1,
              frame_speed_variation = 0.25,
              tail_length = 12,
              tail_width = 8,
              speed_from_center = 1 / 128,
              speed_from_center_deviation = 1 / 64,
            }
          ),
          12, 0.125, 0.5,
          {
            type = "create-particle",
            particle_name = "cube-phantom-splat-lower-layer",
            repeat_count = 1,
            initial_height = 0.125,
            initial_vertical_speed = 1 / 16,
            initial_vertical_speed_deviation = 1 / 16,
            frame_speed = 1,
            frame_speed_variation = 0.25,
            tail_length = 12,
            tail_width = 8,
            speed_from_center = 1 / 128,
            speed_from_center_deviation = 1 / 64,
          }
        ),
      },
    },
  },

  {
    type = "optimized-particle",
    name = "cube-phantom-splat",
    life_time = 120,
    fade_away_duration = 45,
    pictures = blood_particle_pictures({0.6, 0.8, 0.7, 0.625}),
    shadows = blood_particle_pictures({0, 0, 0}, util.by_pixel(1, 0)),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = data.raw["optimized-particle"]["blood-particle"].ended_in_water_trigger_effect,
    movement_modifier_when_on_ground = 0,
    render_layer = "higher-object-under",
    render_layer_when_on_ground = "floor",
  },
  {
    type = "optimized-particle",
    name = "cube-phantom-splat-lower-layer",
    life_time = 120,
    fade_away_duration = 45,
    pictures = blood_particle_pictures({0.6, 0.8, 0.7, 0.625}),
    shadows = blood_particle_pictures({0, 0, 0}, util.by_pixel(1, 0)),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = data.raw["optimized-particle"]["blood-particle-lower-layer"].ended_in_water_trigger_effect,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow",
    render_layer_when_on_ground = "floor",
  },

  {
    type = "projectile",
    name = "cube-periodic-ultradense-projectile",
    flags = {"placeable-off-grid", "not-on-map", "hidden"},
    acceleration = 0,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-explosion",
            entity_name = "cube-periodic-ultradense-explosion",
            inherit_movement_distance_from_projectile = true,
          },
        },
      }
    },
  },
  {
    type = "projectile",
    name = "cube-periodic-combustion-projectile",
    flags = {"placeable-off-grid", "not-on-map", "hidden"},
    acceleration = 0,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-explosion",
            entity_name = "cube-periodic-combustion-explosion",
            inherit_movement_distance_from_projectile = true,
          },
        },
      }
    },
  },

  {
    type = "explosion",
    name = "cube-small-matter-explosion",
    flags = {"not-on-map"},
    animations = {
      {
        filename = "__Krastorio2Assets__/entities/explosions/small-matter-explosion.png",
        width = 400,
        height = 400,
        frame_count = 47,
        line_length = 8,
        shift = {0.1875, -0.75},
        animation_speed = 0.5,
        draw_as_glow = true,
      },
    },
    sound = {
      preload = true,
      aggregation = {max_count = 1, remove = true},
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0,
        },
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
          },
        },
      },
    },
  },

  {
    type = "explosion",
    name = "cube-medium-matter-explosion",
    flags = {"not-on-map"},
    animations = {
      {
        filename = "__Krastorio2Assets__/entities/explosions/medium-matter-explosion.png",
        width = 800,
        height = 800,
        frame_count = 47,
        line_length = 8,
        shift = {0.1875, -0.75},
        animation_speed = 0.4,
        draw_as_glow = true,
      },
    },
    sound = {
      preload = true,
      aggregation = {max_count = 1, remove = true},
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 2.0,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 2.0,
        },
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
          },
        },
      },
    },
  },
  {
    type = "explosion",
    name = "cube-matter-explosion-s",
    flags = {"not-on-map"},
    animations = {
      width = 316,
      height = 360,
      frame_count = 100,
      priority = "very-low",
      flags = {"linear-magnification"},
      shift = util.by_pixel(1, -123), --shift = util.by_pixel(1, -63), shifted by 60 due to scaling and centering
      draw_as_glow = true,
      animation_speed = 0.5 * 0.75,
      scale = 2,
      dice_y = 5,
      stripes = {
        {
          filename = "__Krastorio2Assets__/entities/explosions/matter-explosion-1.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = "__Krastorio2Assets__/entities/explosions/matter-explosion-2.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = "__Krastorio2Assets__/entities/explosions/matter-explosion-3.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = "__Krastorio2Assets__/entities/explosions/matter-explosion-4.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
      },
      hr_version = {
        width = 628,
        height = 720,
        frame_count = 100,
        priority = "very-low",
        flags = {"linear-magnification"},
        shift = util.by_pixel(0.5, -122.5), --shift = util.by_pixel(0.5, -62.5), shifted by 60 due to scaling and centering
        draw_as_glow = true,
        animation_speed = 0.5 * 0.75,
        scale = 1,
        dice_y = 5,
        stripes = {
          {
            filename = "__Krastorio2Assets__/entities/explosions/hr-matter-explosion-1.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = "__Krastorio2Assets__/entities/explosions/hr-matter-explosion-2.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = "__Krastorio2Assets__/entities/explosions/hr-matter-explosion-3.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = "__Krastorio2Assets__/entities/explosions/hr-matter-explosion-4.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
        },
      },
    },
    sound = {
      preload = true,
      aggregation = {
        max_count = 1,
        remove = true,
      },
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0,
        },
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
          },
        },
      },
    },
  },
  {
    type = "explosion",
    name = "cube-experimental-teleporter-explosion",
    flags = {"not-on-map"},
    animations = {
      width = 316,
      height = 360,
      frame_count = 100,
      priority = "very-low",
      shift = util.by_pixel(0.5, -61.5),
      tint = {1, 1, 1, 0.125},
      draw_as_glow = true,
      animation_speed = 0.5 * 0.75,
      scale = 1,
      dice_y = 5,
      stripes = {
        {
          filename = "__Krastorio2Assets__/entities/explosions/matter-explosion-1.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = "__Krastorio2Assets__/entities/explosions/matter-explosion-2.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = "__Krastorio2Assets__/entities/explosions/matter-explosion-3.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = "__Krastorio2Assets__/entities/explosions/matter-explosion-4.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
      },
      hr_version = {
        width = 628,
        height = 720,
        frame_count = 100,
        priority = "very-low",
        shift = util.by_pixel(0.25, -61.25),
        tint = {1, 1, 1, 0.125},
        draw_as_glow = true,
        animation_speed = 0.5 * 0.75,
        scale = 0.5,
        dice_y = 5,
        stripes = {
          {
            filename = "__Krastorio2Assets__/entities/explosions/hr-matter-explosion-1.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = "__Krastorio2Assets__/entities/explosions/hr-matter-explosion-2.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = "__Krastorio2Assets__/entities/explosions/hr-matter-explosion-3.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = "__Krastorio2Assets__/entities/explosions/hr-matter-explosion-4.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
        },
      },
    },
    sound = {
      preload = true,
      aggregation = {
        max_count = 1,
        remove = true,
      },
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 0.5,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 0.5,
        },
      },
    },
  },
  {
    type = "sound",
    name = "cube-experimental-teleporter-effect-sound",
    category = "alert",
    filename = "__Krastorio2Assets__/sounds/others/planetary-teleporter-effect-sound.ogg",
    volume = 2.0,
    audible_distance_modifier = 2.0,
    aggregation = {
      max_count = 2,
      remove = true,
      count_already_playing = true,
    },
  },
})
