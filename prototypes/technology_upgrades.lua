require("prototypes.lib.tech_costs")

data:extend({
  {
    type = "technology",
    name = "cube-toolbelt",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
    effects = {
      {type = "character-inventory-slots-bonus", modifier = 10},
    },
    prerequisites = {"cube-modular-armor"},
    unit = tech_cost_unit("1b", 240),
    upgrade = true,
    order = "10-0-0",
  },
  {
    type = "technology",
    name = "cube-toolbelt-extension-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
    effects = {
      {type = "character-inventory-slots-bonus", modifier = 2},
    },
    prerequisites = {
      "cube-toolbelt",
      "cube-containers",
    },
    unit = tech_cost_formula("2", "2^L*60"),
    max_level = "infinite",
    upgrade = true,
    order = "10-0-0",
  },

  {
    type = "technology",
    name = "cube-braking-force-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
    effects = {
      {type = "train-braking-force-bonus", modifier = 0.2},
    },
    prerequisites = {"cube-railway"},
    unit = tech_cost_unit("1b", 240),
    upgrade = true,
    order = "10-1-0",
  },
  {
    type = "technology",
    name = "cube-braking-force-2",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
    effects = {
      {type = "train-braking-force-bonus", modifier = 0.3},
    },
    prerequisites = {
      "cube-braking-force-1",
      "cube-transitive-ultralocomotion",
    },
    unit = tech_cost_unit("2", 240),
    upgrade = true,
    order = "10-1-1",
  },
  {
    type = "technology",
    name = "cube-braking-force-3",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
    effects = {
      {type = "train-braking-force-bonus", modifier = 0.3},
    },
    prerequisites = {
      "cube-braking-force-2",
      "cube-deep-introspection-card",
    },
    unit = tech_cost_unit("3", 300),
    upgrade = true,
    order = "10-1-2",
  },
  {
    type = "technology",
    name = "cube-braking-force-4",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
    effects = {
      {type = "train-braking-force-bonus", modifier = 0.3},
    },
    prerequisites = {"cube-braking-force-3"},
    unit = tech_cost_unit("3", 360),
    upgrade = true,
    order = "10-1-3",
  },
  {
    type = "technology",
    name = "cube-braking-force-5",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
    effects = {
      -- Base game goes up to 1.0.
      {type = "train-braking-force-bonus", modifier = 0.4},
    },
    prerequisites = {
      "cube-braking-force-4",
      "cube-unobtainium",
    },
    unit = tech_cost_unit("x", 360),
    upgrade = true,
    order = "10-1-4",
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
    unit = tech_cost_unit("0", 240),
    upgrade = true,
    order = "10-2-0",
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
    unit = tech_cost_unit("1a", 240),
    upgrade = true,
    order = "10-2-1",
  },
  {
    type = "technology",
    name = "cube-mining-productivity-3",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects = {
      {type = "mining-drill-productivity-bonus", modifier = 0.05},
    },
    prerequisites = {
      "cube-mining-productivity-2",
      "cube-rare-metal-crushing",
    },
    unit = tech_cost_unit("1b", 480),
    upgrade = true,
    order = "10-2-2",
  },
  {
    type = "technology",
    name = "cube-mining-productivity-4",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects = {
      {type = "mining-drill-productivity-bonus", modifier = 0.05},
    },
    prerequisites = {
      "cube-mining-productivity-3",
      "cube-deep-core-ultradrill",
    },
    unit = tech_cost_unit("2", 480),
    upgrade = true,
    order = "10-2-3",
  },
  {
    type = "technology",
    name = "cube-mining-productivity-5",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects = {
      {type = "mining-drill-productivity-bonus", modifier = 0.05},
    },
    prerequisites = {
      "cube-mining-productivity-4",
      "cube-deep-introspection-card",
    },
    unit = tech_cost_unit("3", 600),
    upgrade = true,
    order = "10-2-4",
  },
  {
    type = "technology",
    name = "cube-mining-productivity-6",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects = {
      -- TODO: base game goes up to 0.4 (before infinite). Need (one?) more of these!
      {type = "mining-drill-productivity-bonus", modifier = 0.1},
    },
    prerequisites = {
      "cube-mining-productivity-5",
      "cube-unobtainium",
    },
    unit = tech_cost_unit("x", 720),
    upgrade = true,
    order = "10-2-5",
  },

  {
    type = "technology",
    name = "cube-stack-inserter-capacity-bonus-1",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/stack-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "stack-inserter-capacity-bonus", modifier = 1},
    },
    prerequisites = {
      "cube-stack-inserters",
      "cube-abstract-interrogation-card",
    },
    unit = tech_cost_unit("2", 240),
    upgrade = true,
    order = "10-3-0",
  },
  {
    type = "technology",
    name = "cube-stack-inserter-capacity-bonus-2",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/stack-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "stack-inserter-capacity-bonus", modifier = 1},
    },
    prerequisites = {"cube-stack-inserter-capacity-bonus-1"},
    unit = tech_cost_unit("2", 300),
    upgrade = true,
    order = "10-3-1",
  },
  {
    type = "technology",
    name = "cube-stack-inserter-capacity-bonus-3",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/stack-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "stack-inserter-capacity-bonus", modifier = 1},
    },
    prerequisites = {
      "cube-deep-introspection-card",
      "cube-stack-inserter-capacity-bonus-2",
    },
    unit = tech_cost_unit("3", 300),
    upgrade = true,
    order = "10-3-2",
  },
  {
    type = "technology",
    name = "cube-stack-inserter-capacity-bonus-4",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/stack-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "stack-inserter-capacity-bonus", modifier = 1},
    },
    prerequisites = {"cube-stack-inserter-capacity-bonus-3"},
    unit = tech_cost_unit("3", 360),
    upgrade = true,
    order = "10-3-3",
  },
  {
    type = "technology",
    name = "cube-stack-inserter-capacity-bonus-5",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/stack-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "stack-inserter-capacity-bonus", modifier = 1},
    },
    prerequisites = {
      "cube-erudite-interpretation-card",
      "cube-stack-inserter-capacity-bonus-4",
    },
    unit = tech_cost_unit("5", 360),
    upgrade = true,
    order = "10-3-4",
  },
  {
    type = "technology",
    name = "cube-stack-inserter-capacity-bonus-6",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/stack-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "stack-inserter-capacity-bonus", modifier = 1},
    },
    prerequisites = {"cube-stack-inserter-capacity-bonus-5"},
    unit = tech_cost_unit("5", 420),
    upgrade = true,
    order = "10-3-5",
  },
  {
    type = "technology",
    name = "cube-stack-inserter-capacity-bonus-7",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/stack-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "stack-inserter-capacity-bonus", modifier = 1},
    },
    prerequisites = {
      "cube-stack-inserter-capacity-bonus-6",
      "cube-unobtainium",
    },
    unit = tech_cost_unit("x", 420),
    upgrade = true,
    order = "10-3-6",
  },
  {
    type = "technology",
    name = "cube-stack-inserter-capacity-bonus-8",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/stack-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      -- Base game goes up to 12, we start at 4
      {type = "stack-inserter-capacity-bonus", modifier = 1},
    },
    prerequisites = {"cube-stack-inserter-capacity-bonus-7"},
    unit = tech_cost_unit("x", 480),
    upgrade = true,
    order = "10-3-7",
  },

  {
    type = "technology",
    name = "cube-inserter-capacity-bonus-1",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/fast-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "inserter-stack-size-bonus", modifier = 1},
    },
    prerequisites = {
      "cube-inserters",
      "cube-erudite-interpretation-card",
    },
    unit = tech_cost_unit("4", 300),
    upgrade = true,
    order = "10-4-0",
  },
  {
    type = "technology",
    name = "cube-inserter-capacity-bonus-2",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/fast-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "inserter-stack-size-bonus", modifier = 1},
    },
    prerequisites = {
      "cube-inserter-capacity-bonus-1",
      "cube-deep-introspection-card",
    },
    unit = tech_cost_unit("5", 300),
    upgrade = true,
    order = "10-4-1",
  },
  {
    type = "technology",
    name = "cube-inserter-capacity-bonus-3",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/fast-inserter.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      -- Base game goes up to 3.
      {type = "inserter-stack-size-bonus", modifier = 1},
    },
    prerequisites = {
      "cube-inserter-capacity-bonus-2",
      "cube-unobtainium",
    },
    unit = tech_cost_unit("x", 360),
    upgrade = true,
    order = "10-4-2",
  },

  {
    type = "technology",
    name = "cube-worker-robot-speed-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects = {
      {type = "worker-robot-speed", modifier = 0.4},
    },
    prerequisites = {"cube-fundamental-comprehension-card"},
    unit = tech_cost_unit("1a", 120),
    upgrade = true,
    order = "10-5-0",
  },
  {
    type = "technology",
    name = "cube-worker-robot-speed-2",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects = {
      {type = "worker-robot-speed", modifier = 0.4},
    },
    prerequisites = {
      "cube-worker-robot-speed-1",
      "cube-construction-robotics",
    },
    unit = tech_cost_unit("1b", 240),
    upgrade = true,
    order = "10-5-1",
  },
  {
    type = "technology",
    name = "cube-worker-robot-speed-3",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects = {
      {type = "worker-robot-speed", modifier = 0.4},
    },
    prerequisites = {
      "cube-worker-robot-speed-2",
      "cube-roboport",
    },
    unit = tech_cost_unit("2", 240),
    upgrade = true,
    order = "10-5-2",
  },
  {
    type = "technology",
    name = "cube-worker-robot-speed-4",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects = {
      {type = "worker-robot-speed", modifier = 0.5},
    },
    prerequisites = {
      "cube-worker-robot-speed-3",
      "cube-logistic-robotics",
    },
    unit = tech_cost_unit("2", 300),
    upgrade = true,
    order = "10-5-3",
  },
  {
    type = "technology",
    name = "cube-worker-robot-speed-5",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects = {
      {type = "worker-robot-speed", modifier = 0.5},
    },
    prerequisites = {
      "cube-worker-robot-speed-4",
      "cube-logistic-system",
    },
    unit = tech_cost_unit("4", 300),
    upgrade = true,
    order = "10-5-4",
  },
  {
    type = "technology",
    name = "cube-worker-robot-speed-6",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects = {
      {type = "worker-robot-speed", modifier = 0.6},
    },
    prerequisites = {
      "cube-worker-robot-speed-5",
      "cube-deep-introspection-card",
    },
    unit = tech_cost_unit("5", 360),
    upgrade = true,
    order = "10-5-5",
  },
  {
    type = "technology",
    name = "cube-worker-robot-speed-7",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects = {
      -- Base game goes up to ~3 before infinite.
      {type = "worker-robot-speed", modifier = 0.6},
    },
    prerequisites = {
      "cube-worker-robot-speed-6",
      "cube-unobtainium",
    },
    unit = tech_cost_unit("x", 420),
    upgrade = true,
    order = "10-5-6",
  },

  {
    type = "technology",
    name = "cube-worker-robot-storage-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
    effects = {
      {type = "worker-robot-storage", modifier = 1},
    },
    prerequisites = {"cube-logistic-robotics"},
    unit = tech_cost_unit("2", 240),
    upgrade = true,
    order = "10-6-0",
  },
  {
    type = "technology",
    name = "cube-worker-robot-storage-2",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
    effects = {
      {type = "worker-robot-storage", modifier = 1},
    },
    prerequisites = {
      "cube-worker-robot-storage-1",
      "cube-deep-introspection-card",
    },
    unit = tech_cost_unit("3", 300),
    upgrade = true,
    order = "10-6-1",
  },
  {
    type = "technology",
    name = "cube-worker-robot-storage-3",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
    effects = {
      {type = "worker-robot-storage", modifier = 1},
    },
    prerequisites = {
      "cube-worker-robot-storage-2",
      "cube-logistic-system",
    },
    unit = tech_cost_unit("5", 360),
    upgrade = true,
    order = "10-6-2",
  },
  {
    type = "technology",
    name = "cube-worker-robot-storage-4",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
    effects = {
      -- Base game goes up to ~3 before infinite.
      {type = "worker-robot-storage", modifier = 1},
    },
    prerequisites = {
      "cube-worker-robot-storage-3",
      "cube-unobtainium",
    },
    unit = tech_cost_unit("x", 420),
    upgrade = true,
    order = "10-6-3",
  },

  {
    type = "technology",
    name = "cube-research-speed-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_speed("__Krastorio2Assets__/technologies/biusart-lab.png"),
    effects = {
      {type = "laboratory-speed", modifier = 0.25},
    },
    prerequisites = {"cube-sentience-extraction"},
    unit = tech_cost_unit("1b", 180),
    upgrade = true,
    order = "10-7-0",
  },
  {
    type = "technology",
    name = "cube-research-speed-2",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_speed("__Krastorio2Assets__/technologies/biusart-lab.png"),
    effects = {
      {type = "laboratory-speed", modifier = 0.25},
    },
    prerequisites = {
      "cube-research-speed-1",
      "cube-electric-energy-accumulators",
    },
    unit = tech_cost_unit("2", 240),
    upgrade = true,
    order = "10-7-1",
  },
  {
    type = "technology",
    name = "cube-research-speed-3",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_speed("__Krastorio2Assets__/technologies/biusart-lab.png"),
    effects = {
      {type = "laboratory-speed", modifier = 0.25},
    },
    prerequisites = {
      "cube-research-speed-2",
      "cube-erudite-interpretation-card",
    },
    unit = tech_cost_unit("4", 300),
    upgrade = true,
    order = "10-7-2",
  },
  {
    type = "technology",
    name = "cube-research-speed-4",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_speed("__Krastorio2Assets__/technologies/biusart-lab.png"),
    effects = {
      -- Base game goes up to 2.5 before infinite.
      {type = "laboratory-speed", modifier = 0.25},
    },
    prerequisites = {
      "cube-research-speed-3",
      "cube-unobtainium",
    },
    unit = tech_cost_unit("x", 300),
    upgrade = true,
    order = "10-7-3",
  },
})
