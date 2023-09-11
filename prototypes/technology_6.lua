require("prototypes.lib.tech_costs")

data:extend({
  {
    type = "technology",
    name = "cube-compression-module-v3",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/speed-module-3.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-compression-module-v3"},
    },
    prerequisites = {
      "cube-unobtainium",
      "cube-compression-module-v2",
    },
    unit = tech_cost_unit("x", 420),
    order = "6-0-0",
  },
  {
    type = "technology",
    name = "cube-inductance-module-v3",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/effectivity-module-3.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-inductance-module-v3"},
    },
    prerequisites = {
      "cube-unobtainium",
      "cube-inductance-module-v2",
    },
    unit = tech_cost_unit("x", 420),
    order = "6-0-1",
  },
  {
    type = "technology",
    name = "cube-productivity-module-v3",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/productivity-module-3.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-productivity-module-v3"},
    },
    prerequisites = {
      "cube-unobtainium",
      "cube-productivity-module-v2",
    },
    unit = tech_cost_unit("x", 420),
    order = "6-0-2",
  },
})
