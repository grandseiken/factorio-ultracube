require("prototypes.lib.tech_costs")

data:extend({
  {
    type = "technology",
    name = "cube-refined-concrete",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/concrete.png",
    effects =
    {
      {type = "unlock-recipe", recipe = "cube-refined-concrete"},
      {type = "unlock-recipe", recipe = "cube-refined-hazard-concrete"},
    },
    prerequisites = {"cube-deep-introspection-card"},
    unit = tech_cost_unit("3", 180),
    order = "3-0-0",
  },
  {
    type = "technology",
    name = "cube-coal-liquefaction",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/coal-liquefaction.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-coal-liquefaction"},
    },
    prerequisites = {"cube-deep-introspection-card"},
    unit = tech_cost_unit("3", 240),
    order = "3-0-1"
  },
  {
    type = "technology",
    name = "cube-v4-logistics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/logistics-5.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-transport-belt-3"},
      {type = "unlock-recipe", recipe = "cube-underground-belt-3"},
      {type = "unlock-recipe", recipe = "cube-splitter-3"},
    },
    prerequisites = {
      "cube-deep-introspection-card",
      "cube-express-logistics",
      "cube-spectral-processor",
    },
    unit = tech_cost_unit("3", 300),
    order = "3-0-2",
  },
  {
    type = "technology",
    name = "cube-logistic-system",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/logistic-system.png",
    effects = {
      -- TODO: more complex recipes?
      {type = "unlock-recipe", recipe = "cube-logistic-chest-active-provider"},
      {type = "unlock-recipe", recipe = "cube-logistic-chest-requester"},
      {type = "unlock-recipe", recipe = "cube-logistic-chest-buffer"},
    },
    prerequisites = {
      -- TODO ???: "cube-roboport",
      "cube-logistic-robotics",
      "cube-synthetic-premonition-card",
    },
    unit = tech_cost_unit("4", 300),
    order = "3-0-3",
  },
  {
    type = "technology",
    name = "cube-personal-roboport-mk2-equipment",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/personal-roboport-mk2-equipment.png"),
    effects = {
      {type = "unlock-recipe", recipe = "cube-personal-roboport-mk2-equipment"},
    },
    prerequisites = {
      "cube-personal-roboport-equipment",
      "cube-synthetic-premonition-card",
    },
    unit = tech_cost_unit("4", 240),
    order = "3-0-4",
  },
  {
    type = "technology",
    name = "cube-compression-module-v2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/speed-module-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-compression-module-v2"},
      {type = "unlock-recipe", recipe = "cube-burnt-out-modular-casing"},
    },
    prerequisites = {
      "cube-deep-introspection-card",
      "cube-compression-module",
    },
    unit = tech_cost_unit("3", 300),
    order = "3-1-0",
  },
  {
    type = "technology",
    name = "cube-inductance-module-v2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/effectivity-module-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-inductance-module-v2"},
      {type = "unlock-recipe", recipe = "cube-burnt-out-modular-casing"},
    },
    prerequisites = {
      "cube-synthetic-premonition-card",
      "cube-inductance-module",
    },
    unit = tech_cost_unit("4", 300),
    order = "3-1-1",
  },
  {
    type = "technology",
    name = "cube-express-loader",
    icons = {
      {
        icon = "__aai-loaders__/graphics/technology/loader-tech-icon.png",
        icon_size = 256
      },
      {
        icon = "__aai-loaders__/graphics/technology/loader-tech-icon_mask.png",
        icon_size = 256,
        tint = {90, 190, 255},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-v3-loader"},
    },
    prerequisites = {
      "cube-synthetic-premonition-card",
      "cube-express-logistics",
      "cube-loader",
    },
    unit = tech_cost_unit("4", 300),
    order = "3-1-3",
  },
  {
    type = "technology",
    name = "cube-spidertron",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/spidertron.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-spidertron"},
      {type = "unlock-recipe", recipe = "cube-spidertron-remote"},
    },
    prerequisites = {
      "cube-exoskeleton-equipment",
      "cube-inductance-module-v2",
      "cube-radar",
    },
    unit = tech_cost_unit("4", 300),
    order = "3-2-0",
  },
})
