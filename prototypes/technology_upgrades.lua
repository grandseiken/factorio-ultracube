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
      -- Base game goes up to 1.0.
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
      -- Base game goes up to 0.4 (before infinite).
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
      -- Base game goes up to 0.4 (before infinite).
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
      -- Base game goes up to 12, we start at 4
      {type = "stack-inserter-capacity-bonus", modifier = 1},
    },
    prerequisites = {
      "cube-stack-inserter-capacity-bonus-1",
    },
    unit = tech_cost_unit("2", 320),
    upgrade = true,
    order = "10-3-1",
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
      "cube-containers",  -- TODO.
    },
    unit = tech_cost_unit("2", 300),
    upgrade = true,
    order = "10-4-0",
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
      -- Base game goes up to ~3 before infinite, so 0.4+0.4+0.4+0.5+0.6+0.7?
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
    name = "cube-worker-robot-storage-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
    effects = {
      -- Base game goes up to ~3 before infinite.
      {type = "worker-robot-storage", modifier = 1},
    },
    prerequisites = {"cube-logistic-robotics"},
    unit = tech_cost_unit("2", 240),
    upgrade = true,
    order = "10-6-0",
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
      -- Base game goes up to ~2.5 before infinite.
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
})
