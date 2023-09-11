require("prototypes.lib.tech_costs")

data:extend({
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
    unit = tech_cost_unit("5", 360),
    order = "5-0-0",
  },
  {
    type = "technology",
    name = "cube-experimental-teleporter",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/planetary-teleporter.png",
    -- TODO: should probably be in tech level 6.
    effects = {},
    prerequisites = {
      "cube-deep-introspection-card",
      "cube-synthetic-premonition-card",
    },
    unit = tech_cost_unit("5", 420),
    order = "5-0-1",
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
      "cube-deep-introspection-card",
      "cube-synthetic-premonition-card",
      "cube-productivity-module",
    },
    unit = tech_cost_unit("5", 300),
    order = "5-1-0",
  },
  {
    type = "technology",
    name = "cube-unobtainium",
    icon = "__Krastorio2Assets__/technologies/matter-uranium.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      tech_unlock_effect(),
    },
    prerequisites = {
      "cube-deep-introspection-card",
      "cube-synthetic-premonition-card",
    },
    unit = tech_cost_unit("x", 600),
    order = "5-9-0",
  },
})
