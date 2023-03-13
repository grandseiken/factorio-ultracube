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

data:extend({
  {
    type = "explosion",
    name = "cube-periodic-ultradense-high-spark",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"placeable-off-grid", "not-on-map", "hidden"},
    subgroup = "explosions",
    light = {intensity = 0.25, size = 4, color = {r=0.6, g=0.7, b=1.0}},
    animations = {
      filename = "__Krastorio2Assets__/entities/empty.png",
      priority = "high",
      width = 1,
      height = 1,
      frame_count = 1,
    },
    sound = {
      aggregation = {
        max_count = 1,
        remove = true
      },
      audible_distance_modifier = 0.5,
      variations = {
        {filename = "__base__/sound/fight/electric-beam.ogg", volume = 0.0125, min_speed = 0.875, max_speed = 1.125},
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          {
            type = "create-particle",
            particle_name = "pole-spark-particle",
            repeat_count = 4,
            repeat_count_deviation = 2,
            initial_height = 0.75,
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
  },
  {
    type = "explosion",
    name = "cube-periodic-ultradense-low-spark",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"placeable-off-grid", "not-on-map", "hidden"},
    subgroup = "explosions",
    light = {intensity = 0.25, size = 4, color = {r=0.6, g=0.7, b=1.0}},
    animations = {
      filename = "__Krastorio2Assets__/entities/empty.png",
      priority = "high",
      width = 1,
      height = 1,
      frame_count = 1,
    },
    sound = {
      aggregation = {
        max_count = 1,
        remove = true
      },
      audible_distance_modifier = 0.5,
      variations = {
        {filename = "__base__/sound/fight/electric-beam.ogg", volume = 0.0125, min_speed = 0.875, max_speed = 1.125},
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          {
            type = "create-particle",
            particle_name = "pole-spark-particle",
            repeat_count = 4,
            repeat_count_deviation = 2,
            initial_height = 0.125,
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
  },

  {
    type = "explosion",
    name = "cube-periodic-ultradense-explosion",
    localised_name = {"entity-name.big-explosion"},
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"placeable-off-grid", "not-on-map", "hidden"},
    subgroup = "explosions",
    render_layer = "higher-object-above",
    animations = {
      {
        filename = "__Hypercube__/graphics/cube-medium-explosion-1.png",
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
          filename = "__Hypercube__/graphics/hr-cube-medium-explosion-1.png",
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
        filename = "__Hypercube__/graphics/cube-medium-explosion-2.png",
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
          filename = "__Hypercube__/graphics/hr-cube-medium-explosion-2.png",
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
        filename = "__Hypercube__/graphics/cube-medium-explosion-3.png",
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
          filename = "__Hypercube__/graphics/hr-cube-medium-explosion-3.png",
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
    light = {intensity = 1, size = 16, color = {r=0.6, g=0.7, b=1.0}},
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
                  aggregation = {
                    max_count = 1,
                    remove = true
                  },
                  audible_distance_modifier = 1,
                  variations = {
                    {filename = "__base__/sound/fight/nuclear-explosion-1.ogg", volume = 0.25, min_speed = 1.25, max_speed = 1.5},
                    {filename = "__base__/sound/fight/nuclear-explosion-2.ogg", volume = 0.25, min_speed = 1.25, max_speed = 1.5},
                    {filename = "__base__/sound/fight/nuclear-explosion-3.ogg", volume = 0.25, min_speed = 1.25, max_speed = 1.5},
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
    type = "optimized-particle",
    name = "cube-ultradense-shockwave-1",
    life_time = 100,
    vertical_acceleration = 0,
    fade_away_duration = 60,
    render_layer = "higher-object-under",
    pictures = {
      filename = "__Hypercube__/graphics/cube-shockwave-1.png",
      priority = "high",
      flags = { "smoke" },
      line_length = 8,
      width = 66,
      height = 68,
      frame_count = 32,
      animation_speed = 0.5,
      variation_count = 1,
      scale = 1.0 / 8,
      shift = util.by_pixel(-1, 0),
      tint = {0.5, 0.5, 0.5, 1.0},
      blend_mode = "additive-soft",
      hr_version = {
        filename = "__Hypercube__/graphics/hr-cube-shockwave-1.png",
        priority = "high",
        flags = { "smoke" },
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
      filename = "__Hypercube__/graphics/cube-shockwave-1.png",
      priority = "high",
      flags = { "smoke" },
      line_length = 8,
      width = 66,
      height = 68,
      frame_count = 32,
      animation_speed = 0.5,
      variation_count = 1,
      scale = 1.0 / 8,
      shift = util.by_pixel(-1, 0),
      tint = {0, 0, 0, 0.5},
      hr_version = {
        filename = "__Hypercube__/graphics/hr-cube-shockwave-1.png",
        priority = "high",
        flags = { "smoke" },
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
  },
  {
    type = "optimized-particle",
    name = "cube-ultradense-shockwave-2",
    vertical_acceleration = 0,
    life_time = 100,
    fade_away_duration = 60,
    render_layer = "higher-object-under",
    pictures = {
      filename = "__Hypercube__/graphics/cube-shockwave-2.png",
      priority = "high",
      flags = { "smoke" },
      line_length = 8,
      width = 56,
      height = 64,
      frame_count = 32,
      animation_speed = 0.5,
      variation_count = 1,
      scale = 1.0 / 8,
      shift = util.by_pixel(-1, 0),
      tint = {0.5, 0.5, 0.5, 1.0},
      blend_mode = "additive-soft",
      hr_version = {
        filename = "__Hypercube__/graphics/hr-cube-shockwave-2.png",
        priority = "high",
        flags = { "smoke" },
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
      filename = "__Hypercube__/graphics/cube-shockwave-2.png",
      priority = "high",
      flags = { "smoke" },
      line_length = 8,
      width = 56,
      height = 64,
      frame_count = 32,
      animation_speed = 0.5,
      variation_count = 1,
      scale = 1.0 / 8,
      shift = util.by_pixel(-1, 0),
      tint = {0, 0, 0, 0.5},
      hr_version = {
        filename = "__Hypercube__/graphics/hr-cube-shockwave-2.png",
        priority = "high",
        flags = { "smoke" },
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
})
