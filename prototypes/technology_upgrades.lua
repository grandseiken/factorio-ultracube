data:extend({
  {
    type = "technology",
    name = "cube-braking-force-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
    effects = {
      -- Base game goes up to 1.0.
      {type = "train-braking-force-bonus", modifier = 0.1},
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
    upgrade = true,
    order = "10-2-0",
  },
  {
    type = "technology",
    name = "cube-mining-productivity-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects = {
      {type = "mining-drill-productivity-bonus", modifier = 0.025},
    },
    prerequisites = {"cube-ultradense-furnace"},
    unit = {
      count = 120,
      ingredients = {{"cube-basic-contemplation-unit", 1}},
      time = 10,
    },
    upgrade = true,
    order = "10-3-0",
  },
  {
    type = "technology",
    name = "cube-mining-productivity-2",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects = {
      {type = "mining-drill-productivity-bonus", modifier = 0.025},
    },
    prerequisites = {
      "cube-mining-productivity-1",
      "cube-fundamental-comprehension-card",
    },
    unit = {
      count = 120,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    upgrade = true,
    order = "10-3-1",
  },
  {
    type = "technology",
    name = "cube-mining-productivity-3",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects = {
      -- Base game goes up to 0.4 (before infinite).
      {type = "mining-drill-productivity-bonus", modifier = 0.025},
    },
    prerequisites = {
      "cube-mining-productivity-2",
      "cube-rare-metal-crushing",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    upgrade = true,
    order = "10-3-2",
  },
  {
    type = "technology",
    name = "cube-mining-productivity-4",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects = {
      -- Base game goes up to 0.4 (before infinite).
      {type = "mining-drill-productivity-bonus", modifier = 0.025},
    },
    prerequisites = {
      "cube-mining-productivity-3",
      "cube-abstract-interrogation-card",
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
    upgrade = true,
    order = "10-3-3",
  },
  {
    type = "technology",
    name = "cube-inserter-capacity-bonus-1",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/fast-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      -- Base game goes up to 3
      {type = "inserter-stack-size-bonus", modifier = 1},
    },
    prerequisites = {
      "cube-inserters",
      "cube-abstract-interrogation-card",
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
    upgrade = true,
    order = "10-0-0",
  },
  {
    type = "technology",
    name = "cube-stack-inserter-capacity-bonus-1",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/stack-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      -- Base game goes up to 12, we start at 4
      {type = "stack-inserter-capacity-bonus", modifier = 1},
    },
    prerequisites = {
      "cube-stack-inserters",
      "cube-abstract-interrogation-card",
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
    upgrade = true,
    order = "10-1-0",
  },
  {
    type = "technology",
    name = "cube-worker-robot-speed-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects = {
      -- Base game goes up to ~3 before infinite.
      {type = "worker-robot-speed", modifier = 0.4},
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
    upgrade = true,
    order = "10-4-0",
  },
  {
    type = "technology",
    name = "cube-worker-robot-speed-2",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects = {
      -- Base game goes up to ~3 before infinite.
      {type = "worker-robot-speed", modifier = 0.4},
    },
    prerequisites = {"cube-worker-robot-speed-1", "cube-construction-robotics"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
      },
      time = 20,
    },
    upgrade = true,
    order = "10-4-1",
  },
  {
    type = "technology",
    name = "cube-worker-robot-storage-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
    effects = {
      -- Base game goes up to ~3 before infinite.
      {type = "worker-robot-storage", modifier = 1},
    },
    prerequisites = {"cube-roboport"},
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    upgrade = true,
    order = "10-5-0",
  },
  {
    type = "technology",
    name = "cube-research-speed-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_speed("__Krastorio2Assets__/technologies/biusart-lab.png"),
    effects = {
      {type = "laboratory-speed", modifier = 0.25},
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
    upgrade = true,
    order = "10-6-0",
  },
})
