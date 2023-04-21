data:extend({
  {
    type = "technology",
    name = "cube-electric-energy-distribution-1",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-big-electric-pole"},
    },
    prerequisites = {"cube-fundamental-comprehension-card"},
    unit = {
      count = 60,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-0-0",
  },
  {
    type = "technology",
    name = "cube-crusher",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/crusher.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-crusher"},
      {type = "unlock-recipe", recipe = "cube-stone-crushing"},
      {type = "unlock-recipe", recipe = "cube-glass"},
    },
    prerequisites = {"cube-fundamental-comprehension-card"},
    unit = {
      count = 120,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-0-1",
  },
  {
    type = "technology",
    name = "cube-rare-metal-crushing",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/recycling.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/items-with-variations/raw-rare-metals/raw-rare-metals.png",
        shift = {0, -40},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/items-with-variations/enriched-rare-metals/enriched-rare-metals.png",
        shift = {-0.866 * 40, 20},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__base__/graphics/icons/stone.png",
        shift = {0.866 * 40, 20},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-rare-metal-crushing"},
      {type = "unlock-recipe", recipe = "cube-refined-rare-metals"},
    },
    prerequisites = {"cube-crusher"},
    unit = {
      count = 120,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-1-0",
  },
  {
    type = "technology",
    name = "cube-greenhouse",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/greenhouse.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-greenhouse"},
      {type = "unlock-recipe", recipe = "cube-greenhouse-wood"},
    },
    prerequisites = {
      "cube-crusher",
      "cube-optics",
    },
    unit = {
      count = 120,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-1-1",
  },
  {
    type = "technology",
    name = "cube-chemical-plant",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/oil-processing.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-chemical-plant"},
      {type = "unlock-recipe", recipe = "cube-besselheim-flask"},
    },
    prerequisites = {"cube-crusher"},
    unit = {
      count = 120,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-1-2",
  },
  {
    type = "technology",
    name = "cube-sand-dilution",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/recycling.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/sand-01.png",
        shift = {0, 32},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/fluids/water.png",
        shift = {0, -32},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-sand-dilution"},
    },
    prerequisites = {"cube-chemical-plant"},
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-1-3",
  },
  {
    type = "technology",
    name = "cube-tar-processing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/fuel-refinery.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-gelatinous-tar"},
      {type = "unlock-recipe", recipe = "cube-tar-processing"},
      {type = "unlock-recipe", recipe = "cube-unstable-gas"},
    },
    prerequisites = {
      "cube-greenhouse",
      "cube-chemical-plant",
    },
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-1-4",
  },
  {
    type = "technology",
    name = "cube-elbow-grease",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/lubricant.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-elbow-grease"},
    },
    prerequisites = {"cube-tar-processing"},
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-1-5",
  },
  {
    type = "technology",
    name = "cube-fuel-refinery",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/fuel-refinery.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-fuel-refinery"},
      {type = "unlock-recipe", recipe = "cube-condensed-fuel"},
    },
    prerequisites = {"cube-tar-processing"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-1-6",
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
    prerequisites = {"cube-tar-processing"},
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-1-7",
  },
  {
    type = "technology",
    name = "cube-concrete",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/concrete.png",
    effects =
    {
      {type = "unlock-recipe", recipe = "cube-concrete"},
      {type = "unlock-recipe", recipe = "cube-hazard-concrete"},
      -- TODO: other tech?
      -- {type = "unlock-recipe", recipe = "cube-refined-concrete"},
      -- {type = "unlock-recipe", recipe = "cube-refined-hazard-concrete"},
    },
    prerequisites = {"cube-rare-metal-crushing"},
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-1-8",
  },
  {
    type = "technology",
    name = "cube-advanced-engine",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electric-engine.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-advanced-engine"},
    },
    prerequisites = {"cube-elbow-grease"},
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-2-0",
  },
  {
    type = "technology",
    name = "cube-automobilism",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/automobilism.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-car"},
    },
    prerequisites = {"cube-advanced-engine"},
    unit = {
      count = 120,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-2-1",
  },
  {
    type = "technology",
    name = "cube-railway",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/railway.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-rail"},
      {type = "unlock-recipe", recipe = "cube-locomotive"},
      {type = "unlock-recipe", recipe = "cube-cargo-wagon"},
      {type = "unlock-recipe", recipe = "cube-train-stop"},
    },
    prerequisites = {"cube-advanced-engine"},
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-2-2",
  },
  {
    type = "technology",
    name = "cube-fluid-wagon",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/fluid-wagon.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-fluid-wagon"},
    },
    prerequisites = {
      "cube-railway",
      "cube-fluid-handling",
    },
    unit = {
      count = 180,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-2-3",
  },
  {
    type = "technology",
    name = "cube-rail-signals",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/rail-signals.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-rail-signal"},
      {type = "unlock-recipe", recipe = "cube-chain-signal"},
    },
    prerequisites = {"cube-railway"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-2-4",
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
    prerequisites = {
      "cube-inserters",
      "cube-advanced-engine",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-2-5",
  },
  {
    type = "technology",
    name = "cube-matter-replication",
    icons = {
      {
        icon_size = 128, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/entities/matter-assembler.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/fluids/hydrogen.png",
        scale = 1, shift = {24, -24},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-matter-replication-gel"},
      {type = "unlock-recipe", recipe = "cube-basic-matter-unit-1"},
    },
    prerequisites = {
      "cube-recovery-bay",
      "cube-synthesizer",
      "cube-fundamental-comprehension-card",
    },
    unit = {
      count = 60,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-3-0",
  },
  {
    type = "technology",
    name = "cube-contemplative-replication",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/energy-control-unit.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/fluids/hydrogen.png",
        scale = 2, shift = {48, -48},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-basic-contemplation-unit-1"},
    },
    prerequisites = {"cube-matter-replication"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-3-1",
  },
  {
    type = "technology",
    name = "cube-widget-replication",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/matter-processing.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/fluids/hydrogen.png",
        scale = 2, shift = {48, -48},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-n-dimensional-widget-1"},
    },
    prerequisites = {"cube-matter-replication"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-3-2",
  },
  {
    type = "technology",
    name = "cube-sentience-extraction",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/backgrounds/matter.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-cerebral-substrate"},
    },
    prerequisites = {"cube-matter-replication"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-4-0",
  },
  {
    type = "technology",
    name = "cube-bottled-consciousness",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/space-science-pack.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-intelligent-calcium"},
      {type = "unlock-recipe", recipe = "cube-bottled-consciousness"},
    },
    prerequisites = {
      "cube-chemical-plant",
      "cube-rare-metal-crushing",
      "cube-sentience-extraction",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-4-1",
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
    prerequisites = {
      "cube-tar-processing",
      "cube-sentience-extraction",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-4-2",
  },
  {
    type = "technology",
    name = "cube-advanced-electronics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/advanced-electronics.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-advanced-circuit"},
    },
    prerequisites = {"cube-tar-processing"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-4-3",
  },
  {
    type = "technology",
    name = "cube-construction-robotics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/construction-robotics.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-construction-robot"},
      {type = "ghost-time-to-live", modifier = 60 * 60 * 60 * 24 * 7},
    },
    prerequisites = {
      "cube-advanced-electronics",
      "cube-bottled-consciousness",
      "cube-emotional-decomposition",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-5-0",
  },
  {
    type = "technology",
    name = "cube-modular-armor",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/armor-making.png"),
    effects = {
      {type = "unlock-recipe", recipe = "cube-modular-armor"},
      {type = "unlock-recipe", recipe = "cube-battery-equipment"},
      {type = "unlock-recipe", recipe = "cube-solar-panel-equipment"},
    },
    prerequisites = {"cube-advanced-electronics"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-5-1",
  },
  {
    type = "technology",
    name = "cube-personal-roboport-equipment",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/personal-roboport-equipment.png"),
    effects = {
      {type = "unlock-recipe", recipe = "cube-personal-roboport-equipment"},
    },
    prerequisites = {
      "cube-construction-robotics",
      "cube-modular-armor",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    order = "1-5-2",
  },
  {
    type = "technology",
    name = "cube-abstract-interrogation-card",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/matter-tech-card.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-abstract-interrogation-card"},
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
      "cube-advanced-engine",
      "cube-advanced-electronics",
      "cube-bottled-consciousness",
    },
    unit = {
      count = 320,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 30,
    },
    order = "1-6-0",
  },
})
