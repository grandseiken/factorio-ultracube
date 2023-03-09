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
    icon = "__base__/graphics/technology/logistics-2.png",
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
    name = "cube-electric-mining-drill",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/electric-mining-drill-mk2.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-electric-mining-drill"},
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
    name = "cube-ultradense-furnace",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-furnace.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-ultradense-furnace"},
      {type = "unlock-recipe", recipe = "cube-rare-metals"},
    },
    prerequisites = {"cube-electric-mining-drill"},
    unit =
    {
      count = 40,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-3-0"
  },
  {
    type = "technology",
    name = "cube-electronics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electronics.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-electronic-circuit"},
    },
    prerequisites = {"cube-ultradense-furnace"},
    unit = {
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-1-1",
  },
  {
    type = "technology",
    name = "cube-n-dimensional-widgets",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/matter-processing.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-n-dimensional-widget-0"},
    },
    prerequisites = {"cube-ultradense-furnace"},
    unit =
    {
      count = 120,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-2-0"
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
    prerequisites = {"cube-electronics"},
    unit = {
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-0-0",
  },
  {
    type = "technology",
    name = "cube-fabricator",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-assembling-machine.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-fabricator"},
    },
    prerequisites = {"cube-electronics"},
    unit = {
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-0-1",
  },
  {
    type = "technology",
    name = "cube-optics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/optics.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-lamp"},
    },
    prerequisites = {"cube-electronics"},
    unit = {
      count = 30,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-0-2",
  },
  {
    type = "technology",
    name = "cube-fluid-handling",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/fluid-handling.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-pump"},
    },
    prerequisites = {"cube-electronics"},
    unit =
    {
      count = 60,
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
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-2-0",
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
      count = 120,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "1-2-2",
  },

  -- TODO: below here are draft techs.
  {
    type = "technology",
    name = "cube-electric-energy-distribution-1",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-big-electric-pole"},
    },
    prerequisites = {"cube-electronics"},
    unit =
    {
      count = 60,
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
      count = 120,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "2-1-0"
  },

  {
    type = "technology",
    name = "cube-inserter-capacity-bonus-1",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "inserter-stack-size-bonus", modifier = 1},
    },
    prerequisites = {"cube-inserters", "cube-combinatorics"},
    unit =
    {
      count = 240,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10
    },
    upgrade = true,
    order = "3-0-0",
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
      count = 240,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "3-0-1",
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
    prerequisites = {"cube-logistics", "cube-electronics", "cube-n-dimensional-widgets"},
    unit = {
      count = 240,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "3-1-0",
  },
})
