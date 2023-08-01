local sounds = require("__base__/prototypes/entity/sounds")

local loader_names = {
  [1] = "cube-fast-loader",
  [2] = "cube-express-loader",
  [3] = "cube-v4-loader",
}

local function color_convert(red, green, blue, alpha)
  return {r = red / 255, g = green / 255, b = blue / 255, a = (alpha or 255) / 255}
end

local function create_loader(data)
  local name = data.name
  local speed = data.speed
  local icon_size = data.icon_size or 64
  local icon_mipmaps = data.icon_mipmaps or 4
  local belt_animation_set = data.belt_animation_set
  local order = data.order
  local upgrade = data.upgrade or nil
  local loader_tint = data.tint or {r = 1.0, g = 1.0, b = 1.0}
  local rust_layer_direction_in, rust_layer_direction_out = nil, nil
  if data.apply_rust ~= false then
    rust_layer_direction_in = {
      filename = "__Krastorio2Assets__/entities/loader/kr-loader-rust.png",
      priority = "extra-high",
      shift = {0.15625, 0.0703125},
      width = 53,
      height = 43,
      y = 43,
      hr_version = {
        filename = "__Krastorio2Assets__/entities/loader/hr-kr-loader-rust.png",
        priority = "extra-high",
        shift = {0.15625, 0.0703125},
        width = 106,
        height = 85,
        y = 85,
        scale = 0.5,
      },
    }
    rust_layer_direction_out = {
      filename = "__Krastorio2Assets__/entities/loader/kr-loader-rust.png",
      priority = "extra-high",
      shift = {0.15625, 0.0703125},
      width = 53,
      height = 43,
      hr_version = {
        filename = "__Krastorio2Assets__/entities/loader/hr-kr-loader-rust.png",
        priority = "extra-high",
        shift = {0.15625, 0.0703125},
        width = 106,
        height = 85,
        scale = 0.5,
      },
    }
  end

  return {
    type = "loader-1x1",
    name = name,
    localised_name = data.localised_name,
    icon = data.icon,
    icon_size = icon_size,
    icon_mipmaps = icon_mipmaps,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {mining_time = 0.25, result = data.result or name},
    placeable_by = {item = data.result or name, count = 1},
    max_health = 300,
    filter_count = 5,
    corpse = "small-remnants",
    collision_box = {{-0.4, -0.45}, {0.4, 0.45}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.4, -0.4}, {0.4, 0.4}},
    animation_speed_coefficient = 32,
    container_distance = 1.5,
    belt_length = 0.5,
    structure_render_layer = "object",
    -- structure_render_layer = "transport-belt-circuit-connector", --Default:"lower-object"
    belt_animation_set = belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = upgrade,
    speed = speed,
    allow_container_interaction = true,
    allow_rail_interaction = true,

    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    structure = {
      direction_in = {
        sheets = {
          {
            filename = "__Krastorio2Assets__/entities/loader/kr-loader.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            y = 43,
            hr_version = {
              filename = "__Krastorio2Assets__/entities/loader/hr-kr-loader.png",
              priority = "extra-high",
              shift = { 0.15625, 0.0703125 },
              width = 106,
              height = 85,
              y = 85,
              scale = 0.5,
            },
          },
          {
            filename = "__Krastorio2Assets__/entities/loader/kr-loader-mask.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            y = 43,
            tint = loader_tint,
            hr_version = {
              filename = "__Krastorio2Assets__/entities/loader/hr-kr-loader-mask.png",
              priority = "extra-high",
              shift = { 0.15625, 0.0703125 },
              width = 106,
              height = 85,
              y = 85,
              scale = 0.5,
              tint = loader_tint,
            },
          },
          rust_layer_direction_in,
        },
      },
      direction_out = {
        sheets = {
          {
            filename = "__Krastorio2Assets__/entities/loader/kr-loader.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 53,
            height = 43,
            hr_version = {
              filename = "__Krastorio2Assets__/entities/loader/hr-kr-loader.png",
              priority = "extra-high",
              shift = {0.15625, 0.0703125},
              width = 106,
              height = 85,
              scale = 0.5,
            },
          },
          {
            filename = "__Krastorio2Assets__/entities/loader/kr-loader-mask.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 53,
            height = 43,
            tint = loader_tint,
            hr_version = {
              filename = "__Krastorio2Assets__/entities/loader/hr-kr-loader-mask.png",
              priority = "extra-high",
              shift = {0.15625, 0.0703125},
              width = 106,
              height = 85,
              scale = 0.5,
              tint = loader_tint,
            },
          },
          rust_layer_direction_out,
        },
      },
    },
    order = order,
  }
end

data:extend({
  create_loader({
    name = loader_names[1],
    icon = "__Krastorio2Assets__/icons/entities/loaders/kr-fast-loader.png",
    speed = data.raw["transport-belt"]["fast-transport-belt"].speed,
    upgrade = loader_names[2],
    belt_animation_set = data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set,
    tint = color_convert(228, 24, 38), -- 210, 70, 80
  }),
  create_loader({
    name = loader_names[2],
    icon = "__Krastorio2Assets__/icons/entities/loaders/kr-express-loader.png",
    speed = data.raw["transport-belt"]["express-transport-belt"].speed,
    upgrade = loader_names[3],
    belt_animation_set = data.raw["transport-belt"]["express-transport-belt"].belt_animation_set,
    tint = color_convert(90, 190, 220),
  }),
  create_loader({
    name = loader_names[3],
    icon = "__Krastorio2Assets__/icons/entities/loaders/kr-superior-loader.png",
    speed = data.raw["transport-belt"]["cube-v4-transport-belt"].speed,
    belt_animation_set = data.raw["transport-belt"]["cube-v4-transport-belt"].belt_animation_set,
    tint = color_convert(151, 34, 191),
  }),
})