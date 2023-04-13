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
    unit = {
      count = 20,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-1-0"
  },
  {
    type = "technology",
    name = "cube-electric-furnace",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/advanced-material-processing-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-electric-furnace"},
      {type = "unlock-recipe", recipe = "cube-stone-brick"},
    },
    unit = {
      count = 20,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10
    },
    order = "0-1-1",
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
    prerequisites = {
      "cube-electric-mining-drill",
      "cube-electric-furnace",
    },
    unit = {
      count = 40,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-2-0"
  },
  {
    type = "technology",
    name = "cube-electronics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electronics.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-conductive-wire"},
      {type = "unlock-recipe", recipe = "cube-electronic-circuit"},
    },
    prerequisites = {"cube-ultradense-furnace"},
    unit = {
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-2-1",
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
    unit = {
      count = 80,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-2-2"
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
    unit = {
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-2-3"
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
      count = 60,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-2-4",
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
    order = "0-2-5",
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
    order = "0-2-6",
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
      count = 80,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-3-0",
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
      count = 80,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-3-1",
  },
  {
    type = "technology",
    name = "cube-fundamental-comprehension-card",
    icon = "__Krastorio2Assets__/technologies/logistic-tech-card.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-fundamental-comprehension-card"},
      {
        type = "nothing",
        icons = {
          {
            icon = "__Krastorio2Assets__/icons/entities/biusart-lab.png",
            icon_size = 64, icon_mipmaps = 4,
          },
          {
            icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-capacity.png",
            icon_size = 64, icon_mipmaps = 2,
          }
        },
        effect_description = {"effect-description.cube-technology-unlock"},
      },
    },
    prerequisites = {
      "cube-electronics",
      "cube-n-dimensional-widgets",
    },
    unit = {
      count = 120,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    order = "0-4-0",
  },
})
