require("prototypes.lib.tech_costs")

data:extend({
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
      "cube-processing-unit",
    },
    unit = tech_cost_unit("3", 300),
    order = "3-0-0",
  },
  {
    type = "technology",
    name = "cube-loader",
    icons = {
      {
        icon = "__aai-loaders__/graphics/technology/loader-tech-icon.png",
        icon_size = 256
      },
      {
        icon = "__aai-loaders__/graphics/technology/loader-tech-icon_mask.png",
        icon_size = 256,
        tint = {255, 24, 38},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-v2-loader"},
    },
    prerequisites = {
      "cube-logistics",
      "cube-erudite-interpretation-card",
    },
    unit = tech_cost_unit("4", 240),
    order = "3-0-1",
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
      "cube-erudite-interpretation-card",
    },
    unit = tech_cost_unit("4", 300),
    order = "3-0-2",
  },
  {
    type = "technology",
    name = "cube-compression-module",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/speed-module-1.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-compression-module"},
    },
    prerequisites = {"cube-deep-introspection-card"},
    unit = tech_cost_unit("3", 300),
    order = "3-1-0",
  },
  {
    type = "technology",
    name = "cube-inductance-module",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/effectivity-module-1.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-inductance-module"},
    },
    prerequisites = {"cube-erudite-interpretation-card"},
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
      "cube-express-logistics",
      "cube-loader",
    },
    unit = tech_cost_unit("4", 300),
    order = "3-1-0",
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
      "cube-inductance-module",
      "cube-radar",
    },
    unit = tech_cost_unit("4", 300),
    order = "3-2-0",
  },
})
