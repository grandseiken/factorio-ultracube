data:extend({
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
    prerequisites = {
      "cube-abstract-interrogation-card",
      "cube-logistics",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-0",
  },
  {
    type = "technology",
    name = "cube-electric-energy-distribution-2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-substation"},
    },
    prerequisites = {
      "cube-abstract-interrogation-card",
      "cube-electric-energy-distribution-1",
    },
    unit = {
      count = 120,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-1",
  },
  {
    type = "technology",
    name = "cube-electric-energy-accumulators",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electric-energy-acumulators.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-accumulator"},
    },
    prerequisites = {
      "cube-battery",
      "cube-electric-energy-distribution-2",
    },
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-2",
  },
  {
    type = "technology",
    name = "cube-tar-reclamation",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/recycling.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/tar.png",
        shift = {0, -40},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/fluids/heavy-oil.png",
        shift = {-0.866 * 40, 20},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/fluids/light-oil.png",
        shift = {0.866 * 40, 20},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-heavy-tar-reclamation"},
      {type = "unlock-recipe", recipe = "cube-light-tar-reclamation"},
    },
    prerequisites = {"cube-abstract-interrogation-card"},
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-3",
  },
  {
    type = "technology",
    name = "cube-sophisticated-matter-unit",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Ultracube__/graphics/sophisticated-matter-unit.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-sophisticated-matter-unit"},
    },
    prerequisites = {"cube-abstract-interrogation-card"},
    unit = {
      count = 120,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-4",
  },
  {
    type = "technology",
    name = "cube-radar",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-radar.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-radar"},
    },
    prerequisites = {"cube-sophisticated-matter-unit"},
    unit = {
      count = 120,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-5",
  },
  {
    type = "technology",
    name = "cube-roboport",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-roboports.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-roboport"},
      {type = "unlock-recipe", recipe = "cube-logistic-chest-passive-provider"},
      {type = "unlock-recipe", recipe = "cube-logistic-chest-storage"},
    },
    prerequisites = {
      "cube-radar",
      "cube-robotics",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-6",
  },
  {
    type = "technology",
    name = "cube-containers",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/containers.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-medium-container"},
      {type = "unlock-recipe", recipe = "cube-big-container"},
    },
    prerequisites = {
      "cube-sophisticated-matter-unit",
    },
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-7",
  },
  {
    type = "technology",
    name = "cube-deep-core-ultradrill",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/quarry-drill.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-deep-core-ultradrill"},
      {type = "unlock-recipe", recipe = "cube-deep-core-crushing"},
    },
    prerequisites = {
      "cube-sophisticated-matter-unit",
      "cube-concrete",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-1-0",
  },
  {
    type = "technology",
    name = "cube-improved-tar-processing",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/advanced-furnace.png",
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/matter-coal.png",
        scale = 0.625,
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-improved-gelatinous-tar"},
    },
    prerequisites = {"cube-deep-core-ultradrill"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-1-1",
  },
  {
    type = "technology",
    name = "cube-transitive-ultralocomotion",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/matter-cube.png",
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/braking-force.png",
      },
    },
    effects = {
      {
        type = "nothing",
        icons = {
          {
            icon = "__base__/graphics/icons/locomotive.png",
            icon_size = 64, icon_mipmaps = 4,
          },
          {
            icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-blueprint.png",
            icon_size = 64, icon_mipmaps = 2,
          }
        },
        effect_description = {"effect-description.cube-transitive-ultralocomotion"},
      },
    },
    prerequisites = {
      "cube-abstract-interrogation-card",
      "cube-railway",
    },
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-1-2",
  },
  {
    type = "technology",
    name = "cube-emotional-decomposition",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/backgrounds/matter.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/joy.png",
        shift = {-24, 0},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/anguish.png",
        shift = {24, 0},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-emotional-decomposition"},
    },
    prerequisites = {"cube-abstract-interrogation-card"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-3-0",
  },
})
