local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local animation = {
  layers = {
    {
      filename = "__Krastorio2Assets__/entities/quantum-computer/quantum-computer.png",
      priority = "high",
      width = 200,
      height = 210,
      shift = {0, -0.2},
      frame_count = 48,
      line_length = 8,
      animation_speed = 1,
      hr_version = {
        filename = "__Krastorio2Assets__/entities/quantum-computer/hr-quantum-computer.png",
        priority = "high",
        width = 400,
        height = 420,
        shift = {0, -0.2},
        frame_count = 48,
        line_length = 8,
        animation_speed = 1,
        scale = 0.5,
      },
    },
    {
      filename = "__Krastorio2Assets__/entities/quantum-computer/quantum-computer-sh.png",
      priority = "medium",
      width = 201,
      height = 181,
      shift = {0.19, 0.315},
      frame_count = 1,
      repeat_count = 48,
      draw_as_shadow = true,
      animation_speed = 1,
      hr_version = {
        filename = "__Krastorio2Assets__/entities/quantum-computer/hr-quantum-computer-sh.png",
        priority = "medium",
        width = 402,
        height = 362,
        shift = {0.19, 0.315},
        frame_count = 1,
        repeat_count = 48,
        draw_as_shadow = true,
        animation_speed = 1,
        scale = 0.5,
      },
    },
  },
}

local working_visualisations = {
  {
    draw_as_light = true,
    animation = {
      filename = "__Krastorio2Assets__/entities/quantum-computer/quantum-computer-light.png",
      priority = "extra-high",
      width = 200,
      height = 210,
      shift = {0, -0.2},
      frame_count = 48,
      line_length = 8,
      animation_speed = 1,
      hr_version = {
        filename = "__Krastorio2Assets__/entities/quantum-computer/hr-quantum-computer-light.png",
        priority = "extra-high",
        width = 400,
        height = 420,
        shift = {0, -0.2},
        frame_count = 48,
        line_length = 8,
        animation_speed = 1,
        scale = 0.5,
      },
    },
  },
  {
    draw_as_glow = true,
    blend_mode = "additive-soft",
    animation = {
      filename = "__Krastorio2Assets__/entities/quantum-computer/quantum-computer-glow.png",
      priority = "extra-high",
      width = 200,
      height = 210,
      shift = {0, -0.2},
      frame_count = 48,
      line_length = 8,
      animation_speed = 1,
      hr_version = {
        filename = "__Krastorio2Assets__/entities/quantum-computer/hr-quantum-computer-glow.png",
        priority = "extra-high",
        width = 400,
        height = 420,
        shift = {0, -0.2},
        frame_count = 48,
        line_length = 8,
        animation_speed = 1,
        scale = 0.5,
      },
    },
  },
  {
    light = {
      intensity = 0.85,
      size = 5,
      shift = {0.0, 0.0},
      color = {r = 0.35, g = 0.75, b = 1},
    },
  },
}

local function make_quantum_decoder(name, hidden, crafting_categories)
  local flags = {"placeable-neutral", "placeable-player", "player-creation"}
  if hidden then
    flags[#flags+1] = "hidden"
  end
  return {
    type = "furnace",
    name = name,
    localised_name = {"entity-name.cube-quantum-decoder"},
    localised_description = {"entity-description.cube-quantum-decoder"},
    icon = "__Krastorio2Assets__/icons/entities/quantum-computer.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = flags,
    fast_replaceable_group = "cube-quantum-decoder",
    minable = {mining_time = 0.75, result = "cube-quantum-decoder"},
    damaged_trigger_effect = hit_effects.entity(),
    max_health = 1000,
    corpse = "cube-medium-random-pipes-remnant",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-2.95, -2.95}, {2.95, 2.95}},
    animation = animation,
    crafting_categories = crafting_categories,
    source_inventory_size = 1,
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 5,
    },
    energy_usage = "1MW",
    working_visualisations = working_visualisations,
    module_specification = {module_slots = 0},
    allowed_effects = {},
    open_sound = {filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1},
    close_sound = {filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1},
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/quantum-computer.ogg",
        volume = 0.75,
      },
      idle_sound = {filename = "__base__/sound/idle1.ogg"},
      apparent_volume = 1.5,
    },
  }
end

data:extend({make_quantum_decoder("cube-quantum-decoder", false, {"cube-quantum-decoder"})})

local function make_success_categories(k)
  local result = {}
  for i = 0, 5 do
    if i == k then
      result[#result + 1] = "cube-qubit-success-" .. i
    else
      result[#result + 1] = "cube-qubit-failure-" .. i
    end
  end
  return result
end
local failure_categories = make_success_categories(nil)

for i = 0, 5 do
  local name = "cube-quantum-decoder-" .. i .. "-" .. i
  data:extend({
    make_quantum_decoder(name, true, {"cube-qubit-step"}),
    make_quantum_decoder(name .. "-null", true, failure_categories),
    make_quantum_decoder(name .. "-" .. i, true, make_success_categories(i)),
  })
  for j = i + 1, 5 do
    local name = "cube-quantum-decoder-" .. i .. "-" .. j
    data:extend({
      make_quantum_decoder(name, true, {"cube-qubit-step"}),
      make_quantum_decoder(name .. "-null", true, failure_categories),
      make_quantum_decoder(name .. "-" .. i, true, make_success_categories(j)),
      make_quantum_decoder(name .. "-" .. j, true, make_success_categories(i)),
    })
  end
end