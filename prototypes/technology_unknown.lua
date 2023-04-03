data:extend({
  {
    type = "technology",
    name = "cube-stack-inserters",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/stack-inserter.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-stack-inserter"},
      {type = "unlock-recipe", recipe = "cube-stack-filter-inserter"},
    },
    prerequisites = {"cube-inserters", "cube-fundamental-comprehension-card"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "9-0-0",
  },
  {
    type = "technology",
    name = "cube-electric-energy-distribution-2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-substation"},
    },
    prerequisites = {"cube-electric-energy-distribution-1"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "9-0-1",
  },
  {
    type = "technology",
    name = "cube-express-logistics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/logistics-3.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-transport-belt-2"},
      {type = "unlock-recipe", recipe = "cube-underground-belt-2"},
      {type = "unlock-recipe", recipe = "cube-splitter-2"},
    },
    prerequisites = {"cube-logistics", "cube-fundamental-comprehension-card"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "9-0-2",
  },
})
