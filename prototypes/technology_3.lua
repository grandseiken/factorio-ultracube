require("prototypes.lib.tech_costs")

data:extend({
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
      "cube-abstract-interrogation-card",
    },
    unit = tech_cost_unit("x", 240),
    order = "3-0-0",
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
    unit = tech_cost_unit("x", 300),
    order = "3-0-1",
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
      "cube-express-logistics",
      "cube-deep-core-ultradrill",
    },
    unit = tech_cost_unit("x", 300),
    order = "3-1-0",
  },
  {
    type = "technology",
    name = "cube-v4-loader",
    icons = {
      {
        icon = "__aai-loaders__/graphics/technology/loader-tech-icon.png",
        icon_size = 256
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
    },
    unit = tech_cost_unit("x", 360),
    order = "3-1-1",
  },
})
