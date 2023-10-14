for _, animation in ipairs(data.raw.character.character.animations) do
  if animation.armors then
    for _, armor in ipairs(animation.armors) do
      if armor == "heavy-armor" then
        animation.armors[#animation.armors + 1] = "cube-regulation-armor"
        animation.armors[#animation.armors + 1] = "cube-modular-armor"
        break
      end
      if armor == "power-armor" then
        animation.armors[#animation.armors + 1] = "cube-power-armor"
        animation.armors[#animation.armors + 1] = "cube-power-armor-mk2"
        break
      end
    end
  end
end

data:extend({
  {
    type = "equipment-category",
    name = "cube-armor",
    order = "0",
  },
  {
    type = "equipment-grid",
    name = "cube-tiny-equipment-grid",
    width = 4,
    height = 4,
    equipment_categories = {"cube-armor"}
  },
  {
    type = "equipment-grid",
    name = "cube-small-equipment-grid",
    width = 5,
    height = 5,
    equipment_categories = {"cube-armor"}
  },
  {
    type = "equipment-grid",
    name = "cube-medium-equipment-grid",
    width = 7,
    height = 7,
    equipment_categories = {"cube-armor"}
  },
  {
    type = "equipment-grid",
    name = "cube-huge-equipment-grid",
    width = 9,
    height = 9,
    equipment_categories = {"cube-armor"}
  },
  {
    type = "solar-panel-equipment",
    name = "cube-solar-panel-equipment",
    sprite = {
      filename = "__base__/graphics/equipment/solar-panel-equipment.png",
      width = 32,
      height = 32,
      priority = "medium",
      hr_version = {
        filename = "__base__/graphics/equipment/hr-solar-panel-equipment.png",
        width = 64,
        height = 64,
        priority = "medium",
        scale = 0.5,
      },
    },
    shape = {
      width = 1,
      height = 1,
      type = "full",
    },
    energy_source = {
      type = "electric",
      usage_priority = "primary-output",
    },
    power = "40kW",
    categories = {"cube-armor"},
  },
  {
    type = "solar-panel-equipment",
    name = "cube-solar-panel-equipment-mk2",
    sprite = {
      filename = "__Krastorio2Assets__/entities/advanced-solar-panel/advanced-solar-panel.png",
      width = 140,
      height = 140,
      priority = "medium",
      hr_version = {
        filename = "__Krastorio2Assets__/entities/advanced-solar-panel/hr-advanced-solar-panel.png",
        width = 280,
        height = 280,
        priority = "medium",
        scale = 0.5,
      },
    },
    shape = {
      width = 2,
      height = 2,
      type = "full",
    },
    energy_source = {
      type = "electric",
      usage_priority = "primary-output",
    },
    power = "480kW",
    categories = {"cube-armor"},
  },
  {
    type = "movement-bonus-equipment",
    name = "cube-exoskeleton-equipment-mk2",
    categories = {"cube-armor"},
    energy_consumption = "300kW",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    movement_bonus = 0.4,
    shape = {
      width = 2,
      height = 4,
      type = "full",
    },
    sprite = {
      filename = "__Krastorio2Assets__/equipments/character/advanced-exoskeleton-equipment.png",
      width = 64,
      height = 128,
      priority = "medium",
      hr_version = {
        filename = "__Krastorio2Assets__/equipments/character/hr-advanced-exoskeleton-equipment.png",
        width = 128,
        height = 256,
        priority = "medium",
        scale = 0.5,
      },
    },
  },
  {
    type = "battery-equipment",
    name = "cube-battery-equipment",
    sprite = {
      filename = "__base__/graphics/equipment/battery-equipment.png",
      width = 32,
      height = 64,
      priority = "medium",
      hr_version = {
        filename = "__base__/graphics/equipment/hr-battery-equipment.png",
        width = 64,
        height = 128,
        priority = "medium",
        scale = 0.5,
      },
    },
    shape = {
      width = 1,
      height = 2,
      type = "full",
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "20MJ",
      usage_priority = "tertiary",
    },
    categories = {"cube-armor"},
  },
  {
    type = "roboport-equipment",
    name = "cube-personal-roboport-equipment",
    sprite = {
      filename = "__base__/graphics/equipment/personal-roboport-equipment.png",
      width = 64,
      height = 64,
      priority = "medium",
      hr_version = {
        filename = "__base__/graphics/equipment/hr-personal-roboport-equipment.png",
        width = 128,
        height = 128,
        priority = "medium",
        scale = 0.5,
      },
    },
    shape = {
      width = 2,
      height = 2,
      type = "full",
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "40MJ",
      input_flow_limit = "2MW",
      usage_priority = "secondary-input",
    },
    charging_energy = "1000kW",

    robot_limit = 10,
    construction_radius = 15,
    spawn_and_station_height = 0.4,
    spawn_and_station_shadow_height_offset = 0.5,
    charge_approach_distance = 2.6,
    robots_shrink_when_entering_and_exiting = true,

    recharging_animation = {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      draw_as_glow = true,
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5,
    },
    recharging_light = {intensity = 0.2, size = 3, color = {r = 0.5, g = 0.5, b = 1.0}},
    stationing_offset = {0, -0.6},
    charging_station_shift = {0, 0.5},
    charging_station_count = 2,
    charging_distance = 1.6,
    charging_threshold_distance = 5,
    categories = {"cube-armor"},
  },
})
