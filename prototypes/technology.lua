data:extend({
  {
    type = "technology",
    name = "cube-inserters",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/fast-inserter.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-fast-inserter"},
      {type = "unlock-recipe", recipe = "cube-long-inserter"},
      {type = "unlock-recipe", recipe = "cube-filter-inserter"},
    },
    unit = {
      count = 10,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-0-0",
  },
  {
    type = "technology",
    name = "cube-logistics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/logistics-3.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-transport-belt"},
      {type = "unlock-recipe", recipe = "cube-underground-belt"},
      {type = "unlock-recipe", recipe = "cube-splitter"},
    },
    unit = {
      count = 20,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-0-1",
  },
  {
    type = "technology",
    name = "cube-n-dimensional-widgets",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/matter-processing.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-n-dimensional-widget-0"},
    },
    unit =
    {
      count = 20,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-1-0"
  },

  {
    type = "technology",
    name = "cube-combinatorics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/circuit-network.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-constant-combinator"},
      {type = "unlock-recipe", recipe = "cube-arithmetic-combinator"},
      {type = "unlock-recipe", recipe = "cube-decider-combinator"},
      {type = "unlock-recipe", recipe = "cube-red-wire"},
      {type = "unlock-recipe", recipe = "cube-green-wire"},
      {type = "unlock-recipe", recipe = "cube-programmable-speaker"},
      {type = "unlock-recipe", recipe = "cube-power-switch"},
    },
    prerequisites = {"cube-n-dimensional-widgets"},
    unit = {
      count = 20,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-0-0",
  },
  {
    type = "technology",
    name = "cube-optics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/optics.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-lamp"},
    },
    prerequisites = {"cube-n-dimensional-widgets"},
    unit = {
      count = 20,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-0-1",
  },
  {
    type = "technology",
    name = "cube-fluid-handling",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/fluid-handling.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-pump"},
    },
    prerequisites = {"cube-n-dimensional-widgets"},
    unit =
    {
      count = 30,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-1-0"
  },
  {
    type = "technology",
    name = "cube-recovery-bay",
    icon_size = 128, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/icons/entities/stabilizer-charging-station.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-recovery-bay"},
      {type = "unlock-recipe", recipe = "cube-utility-cube-recharge"},
    },
    prerequisites = {"cube-n-dimensional-widgets"},
    unit = {
      count = 20,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-2-0",
  },
  {
    type = "technology",
    name = "cube-fabricator",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-assembling-machine.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-fabricator"},
    },
    prerequisites = {"cube-n-dimensional-widgets"},
    unit = {
      count = 30,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-2-1",
  },
  {
    type = "technology",
    name = "cube-synthesizer",
    icon = "__Krastorio2Assets__/icons/entities/matter-assembler.png",
    icon_size = 128, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-synthesizer"},
    },
    prerequisites = {"cube-n-dimensional-widgets"},
    unit = {
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-2-2",
  },

  {
    type = "technology",
    name = "cube-electric-energy-distribution-1",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-big-electric-pole"},
    },
    prerequisites = {"cube-n-dimensional-widgets"},
    unit =
    {
      count = 30,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "2-0-0"
  },
  {
    type = "technology",
    name = "cube-stack-inserters",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/stack-inserter.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-stack-inserter"},
      {type = "unlock-recipe", recipe = "cube-stack-filter-inserter"},
    },
    prerequisites = {"cube-inserters", "cube-combinatorics"},
    unit = {
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "2-0-1",
  },
  {
    type = "technology",
    name = "cube-matter-duplication",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/plastics.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-basic-matter-unit-1"},
      {type = "unlock-recipe", recipe = "cube-n-dimensional-widget-1"},
      {type = "unlock-recipe", recipe = "cube-basic-contemplation-unit-1"},
    },
    prerequisites = {"cube-recovery-bay", "cube-synthesizer"},
    unit =
    {
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "2-1-0"
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
    unit =
    {
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "3-0-0"
  },
})
