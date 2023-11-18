require("prototypes.lib.tech_costs")

data:extend({
  {
    type = "technology",
    name = "cube-arcane-drive",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-additional-engine.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-arcane-drive"},
    },
    prerequisites = {
      "cube-deep-introspection-card",
      "cube-synthetic-premonition-card",
    },
    unit = tech_cost_unit("5", 240),
    order = "5-0-0",
  },
  {
    type = "technology",
    name = "cube-exoskeleton-equipment-mk2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-exoskeleton-equipment.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-exoskeleton-equipment-mk2"},
    },
    prerequisites = {
      "cube-arcane-drive",
      "cube-speed-module-v2",
      "cube-exoskeleton-equipment",
    },
    unit = tech_cost_unit("5", 300),
    order = "5-0-1",
  },
  {
    type = "technology",
    name = "cube-v4-loader",
    icons = {
      {
        icon = "__aai-loaders__/graphics/technology/loader-tech-icon.png",
        icon_size = 256,
      },
      {
        icon = "__aai-loaders__/graphics/technology/loader-tech-icon_mask.png",
        icon_size = 256,
        tint = {210, 1, 247},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-v4-loader"},
    },
    prerequisites = {
      "cube-v4-logistics",
      "cube-express-loader",
      "cube-arcane-drive",
    },
    unit = tech_cost_unit("5", 360),
    order = "5-0-2",
  },
  {
    type = "technology",
    name = "cube-productivity-module-v2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/productivity-module-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-productivity-module-v2"},
      {type = "unlock-recipe", recipe = "cube-burnt-out-modular-casing"},
    },
    prerequisites = {
      "cube-arcane-drive",
      "cube-productivity-module",
    },
    unit = tech_cost_unit("5", 300),
    order = "5-1-0",
  },
  {
    type = "technology",
    name = "cube-experimental-teleporter",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/planetary-teleporter.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-experimental-teleporter"},
      {type = "unlock-recipe", recipe = "cube-teleportation-control-module"},
    },
    prerequisites = {
      "cube-arcane-drive",
      "cube-quantum-decoder",
    },
    unit = tech_cost_unit("5", 420),
    order = "5-2-0",
  },
  {
    type = "technology",
    name = "cube-forbidden-ziggurat",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/intergalactic-transceiver.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-forbidden-ziggurat"},
      tech_unlock_effect(),
    },
    prerequisites = {
      "cube-arcane-drive",
      "cube-quantum-decoder",
    },
    unit = tech_cost_unit("5", 1200),
    order = "5-3-0",
  },
  {
    type = "technology",
    name = "cube-construct-forbidden-ziggurat",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/intergalactic-transceiver.png",
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/overlays/equipment-overlay.png",
      },
    },
    effects = {
      tech_unlock_effect(),
    },
    prerequisites = {"cube-forbidden-ziggurat"},
    unit = {
      count = 1,
      time = 1 / 1024,
      ingredients = {{"cube-construct-forbidden-ziggurat-dummy", 1}},
    },
    order = "5-3-1",
  },
  {
    type = "technology",
    name = "cube-resonance-cascade",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/intergalactic-transceiver.png",
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/matter-cube.png",
        tint = {r = 1, g = 1, b = 1, a = 0.5},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-resonance-cascade"},
      {type = "unlock-recipe", recipe = "cube-ultradense-powder"},
      {type = "unlock-recipe", recipe = "cube-ultradense-mineral"},
      {type = "unlock-recipe", recipe = "cube-ultradense-sap"},
      {type = "unlock-recipe", recipe = "cube-ultradense-matter-unit"},
      {type = "unlock-recipe", recipe = "cube-ultradense-composite"},
      {type = "unlock-recipe", recipe = "cube-ultradense-utility-cube"},
    },
    prerequisites = {"cube-construct-forbidden-ziggurat"},
    unit = tech_cost_unit("5", 800),
    order = "5-3-2",
  },
  {
    type = "technology",
    name = "cube-complete-annihilation-card",
    icon = "__Krastorio2Assets__/technologies/advanced-tech-card.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-complete-annihilation-card"},
      tech_unlock_effect(),
    },
    prerequisites = {"cube-resonance-cascade"},
    unit = tech_cost_unit("5", 1200),
    order = "5-3-3",
  },
})
