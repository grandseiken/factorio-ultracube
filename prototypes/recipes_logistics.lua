data:extend({
  {
    type = "recipe",
    name = "cube-iron-chest",
    ingredients = {{type = "item", name = "cube-basic-matter-unit", amount = 10}},
    results = {{type = "item", name = "iron-chest", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
  },
  {
    type = "recipe",
    name = "cube-pipe",
    ingredients = {{type = "item", name = "cube-basic-matter-unit", amount = 2}},
    results = {{type = "item", name = "pipe", amount = 1}},
    energy_required = 0.5,
    category = "cube-fabricator-handcraft",
  },
  {
    type = "recipe",
    name = "cube-underground-pipe",
    ingredients = {
      {type = "item", name = "pipe", amount = 8},
      {type = "item", name = "stone", amount = 8},
    },
    results = {{type = "item", name = "pipe-to-ground", amount = 2}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
  },
  {
    type = "recipe",
    name = "cube-storage-tank",
    ingredients = {
      {type = "item", name = "pipe", amount = 4},
      {type = "item", name = "cube-basic-matter-unit", amount = 40},
    },
    results = {{type = "item", name = "storage-tank", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
  },
  {
    type = "recipe",
    name = "cube-pump",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 12},
      {type = "item", name = "cube-basic-motor-unit", amount = 1},
      {type = "item", name = "cube-electronic-circuit", amount = 1},
      {type = "item", name = "pipe", amount = 2},
    },
    results = {{type = "item", name = "pump", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-transport-belt",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 8},
      {type = "item", name = "cube-basic-motor-unit", amount = 1},
    },
    results = {{type = "item", name = "fast-transport-belt", amount = 4}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-underground-belt",
    ingredients = {
      {type = "item", name = "fast-transport-belt", amount = 8},
      {type = "item", name = "cube-basic-matter-unit", amount = 8},
    },
    results = {{type = "item", name = "fast-underground-belt", amount = 2}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-splitter",
    ingredients = {
      {type = "item", name = "fast-transport-belt", amount = 2},
      {type = "item", name = "cube-basic-motor-unit", amount = 2},
      {type = "item", name = "cube-electronic-circuit", amount = 2},
    },
    results = {{type = "item", name = "fast-splitter", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-transport-belt-2",
    ingredients = {
      {type = "item", name = "fast-transport-belt", amount = 4},
      {type = "item", name = "cube-advanced-engine", amount = 1},
      {type = "fluid", name = "cube-elbow-grease", amount = 80},
    },
    results = {{type = "item", name = "express-transport-belt", amount = 4}},
    energy_required = 2,
    category = "cube-fabricator",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-underground-belt-2",
    ingredients = {
      {type = "item", name = "express-transport-belt", amount = 10},
      {type = "item", name = "cube-basic-matter-unit", amount = 16},
    },
    results = {{type = "item", name = "express-underground-belt", amount = 2}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-splitter-2",
    ingredients = {
      {type = "item", name = "express-transport-belt", amount = 2},
      {type = "item", name = "cube-advanced-engine", amount = 1},
      {type = "item", name = "cube-advanced-circuit", amount = 2},
      {type = "fluid", name = "cube-elbow-grease", amount = 40},
    },
    results = {{type = "item", name = "express-splitter", amount = 1}},
    energy_required = 2,
    category = "cube-fabricator",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-transport-belt-3",
    ingredients = {
      {type = "item", name = "express-transport-belt", amount = 4},
      {type = "item", name = "cube-resplendent-plate", amount = 4},
      {type = "fluid", name = "cube-elbow-grease", amount = 80},
    },
    results = {{type = "item", name = "cube-v4-transport-belt", amount = 4}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-underground-belt-3",
    ingredients = {
      {type = "item", name = "cube-v4-transport-belt", amount = 12},
      {type = "item", name = "cube-resplendent-plate", amount = 4},
    },
    results = {{type = "item", name = "cube-v4-underground-belt", amount = 2}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-splitter-3",
    ingredients = {
      {type = "item", name = "cube-v4-transport-belt", amount = 2},
      {type = "item", name = "cube-advanced-engine", amount = 1},
      {type = "item", name = "cube-spectral-processor", amount = 2},
      {type = "fluid", name = "cube-elbow-grease", amount = 120},
    },
    results = {{type = "item", name = "cube-v4-splitter", amount = 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-v2-loader",
    ingredients = {
      {type = "item", name = "fast-transport-belt", amount = 1},
      {type = "item", name = "cube-electronic-circuit", amount = 20},
      {type = "item", name = "cube-basic-motor-unit", amount = 20},
      {type = "item", name = "cube-spectralite", amount = 20},
    },
    results = {{type = "item", name = "aai-v2-loader", amount = 1}},
    energy_required = 8,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-v3-loader",
    ingredients = {
      {type = "item", name = "aai-v2-loader", amount = 1},
      {type = "item", name = "express-transport-belt", amount = 1},
      {type = "item", name = "cube-advanced-circuit", amount = 20},
      {type = "item", name = "cube-advanced-engine", amount = 20},
      {type = "item", name = "cube-ghost-wire", amount = 100},
    },
    results = {{type = "item", name = "aai-v3-loader", amount = 1}},
    energy_required = 12,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-v4-loader",
    ingredients = {
      {type = "item", name = "aai-v3-loader", amount = 1},
      {type = "item", name = "cube-v4-transport-belt", amount = 1},
      {type = "item", name = "cube-spectral-processor", amount = 20},
      {type = "item", name = "cube-arcane-drive", amount = 20},
      {type = "item", name = "cube-resplendent-plate", amount = 20},
    },
    results = {{type = "item", name = "aai-v4-loader", amount = 1}},
    energy_required = 16,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-stone-wall",
    ingredients = {{type = "item", name = "stone-brick", amount = 5}},
    results = {{type = "item", name = "stone-wall", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-gate",
    ingredients = {
      {type = "item", name = "stone-wall", amount = 2},
      {type = "item", name = "concrete", amount = 4},
      {type = "item", name = "cube-basic-matter-unit", amount = 4},
      {type = "item", name = "cube-electronic-circuit", amount = 2},
    },
    results = {{type = "item", name = "gate", amount = 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-concrete",
    ingredients = {
      {type = "item", name = "stone-brick", amount = 6},
      {type = "item", name = "cube-sand", amount = 4},
      {type = "item", name = "cube-calcium", amount = 2},
      {type = "fluid", name = "water", amount = 100},
    },
    results = {{type = "item", name = "concrete", amount = 10}},
    energy_required = 8,
    category = "cube-fabricator",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-hazard-concrete",
    energy_required = 1,
    ingredients = {
      {type = "item", name = "concrete", amount = 10},
    },
    results = {{type = "item", name = "hazard-concrete", amount = 10}},
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-refined-concrete",
    ingredients = {
      {type = "item", name = "concrete", amount = 20},
      {type = "item", name = "stone-brick", amount = 6},
      {type = "item", name = "cube-refined-rare-metals", amount = 4},
      {type = "item", name = "cube-calcium", amount = 2},
      {type = "fluid", name = "cube-mineral-water", amount = 20},
    },
    results = {{type = "item", name = "refined-concrete", amount = 10}},
    energy_required = 8,
    category = "cube-fabricator",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-refined-hazard-concrete",
    energy_required = 1,
    ingredients = {
      {type = "item", name = "refined-concrete", amount = 10},
    },
    results = {{type = "item", name = "refined-hazard-concrete", amount = 10}},
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-landfill",
    ingredients = {
      {type = "item", name = "stone", amount = 10},
      {type = "item", name = "cube-sand", amount = 5},
    },
    results = {{type = "item", name = "landfill", amount = 1}},
    energy_required = 8,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-cliff-explosives",
    ingredients = {
      {type = "item", name = "explosives", amount = 8},
      {type = "item", name = "cube-basic-matter-unit", amount = 4},
      {type = "item", name = "cube-rare-metals", amount = 4},
    },
    results = {{type = "item", name = "cliff-explosives", amount = 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-lamp",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 1},
      {type = "item", name = "cube-electronic-circuit", amount = 1},
    },
    results = {{type = "item", name = "small-lamp", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-medium-electric-pole",
    ingredients = {{type = "item", name = "cube-basic-matter-unit", amount = 10}},
    results = {{type = "item", name = "medium-electric-pole", amount = 1}},
    energy_required = 0.5,
    category = "cube-fabricator-handcraft",
  },
  {
    type = "recipe",
    name = "cube-big-electric-pole",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 40},
      {type = "item", name = "copper-cable", amount = 8},
    },
    results = {{type = "item", name = "big-electric-pole", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-substation",
    ingredients = {
      {type = "item", name = "big-electric-pole", amount = 1},
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 40},
      {type = "item", name = "copper-cable", amount = 16},
      {type = "item", name = "cube-advanced-circuit", amount = 2},
    },
    results = {{type = "item", name = "substation", amount = 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-constant-combinator",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 2},
      {type = "item", name = "cube-electronic-circuit", amount = 1},
    },
    results = {{type = "item", name = "constant-combinator", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-arithmetic-combinator",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 2},
      {type = "item", name = "cube-electronic-circuit", amount = 2},
    },
    results = {{type = "item", name = "arithmetic-combinator", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-decider-combinator",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 2},
      {type = "item", name = "cube-electronic-circuit", amount = 2},
    },
    results = {{type = "item", name = "decider-combinator", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-selector-combinator",
    ingredients =
    {
      {type = "item", name = "decider-combinator", amount = 4},
      {type = "item", name = "cube-advanced-circuit", amount = 2},
    },
    results = {{type = "item", name = "selector-combinator", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-power-switch",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 10},
      {type = "item", name = "cube-electronic-circuit", amount = 2},
      {type = "item", name = "copper-cable", amount = 4},
    },
    results = {{type = "item", name = "power-switch", amount = 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-programmable-speaker",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 10},
      {type = "item", name = "cube-electronic-circuit", amount = 2},
      {type = "item", name = "copper-cable", amount = 2},
    },
    results = {{type = "item", name = "programmable-speaker", amount = 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-display-panel",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 1},
      {type = "item", name = "cube-electronic-circuit", amount = 1},
      {type = "item", name = "cube-glass", amount = 1},
    },
    results = {{type = "item", name = "display-panel", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-fast-inserter",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 4},
      {type = "item", name = "cube-basic-motor-unit", amount = 1},
    },
    results = {{type = "item", name = "fast-inserter", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-long-inserter",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 8},
      {type = "item", name = "cube-basic-motor-unit", amount = 1},
    },
    results = {{type = "item", name = "long-handed-inserter", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-bulk-inserter",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 10},
      {type = "item", name = "cube-advanced-engine", amount = 1},
    },
    results = {{type = "item", name = "bulk-inserter", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-extremely-long-inserter",
    ingredients = {
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 4},
      {type = "item", name = "cube-resplendent-plate", amount = 8},
      {type = "item", name = "cube-advanced-engine", amount = 1},
      {type = "item", name = "decider-combinator", amount = 1},
    },
    results = {{type = "item", name = "cube-extremely-long-inserter", amount = 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-car",
    ingredients = {
      {type = "item", name = "iron-chest", amount = 2},
      {type = "item", name = "cube-glass", amount = 8},
      {type = "item", name = "cube-advanced-engine", amount = 2},
      {type = "item", name = "cube-basic-matter-unit", amount = 40},
    },
    results = {{type = "item", name = "car", amount = 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-spidertron",
    ingredients = {
      {type = "item", name = "exoskeleton-equipment", amount = 4},
      {type = "item", name = "cube-spectral-processor", amount = 40},
      {type = "item", name = "cube-advanced-engine", amount = 20},
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 80},
      {type = "item", name = "cube-efficiency-module-v2", amount = 4},
      {type = "item", name = "radar", amount = 1},
      {type = "item", name = "raw-fish", amount = 1},
    },
    results = {{type = "item", name = "spidertron", amount = 1}},
    energy_required = 20,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-locomotive",
    ingredients = {
      {type = "item", name = "cube-advanced-engine", amount = 4},
      {type = "item", name = "cube-glass", amount = 10},
      {type = "item", name = "cube-basic-matter-unit", amount = 80},
      {type = "item", name = "cube-electronic-circuit", amount = 8},
    },
    results = {{type = "item", name = "locomotive", amount = 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-cargo-wagon",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 100},
      {type = "item", name = "cube-rare-metals", amount = 20},
    },
    results = {{type = "item", name = "cargo-wagon", amount = 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-fluid-wagon",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 60},
      {type = "item", name = "cube-rare-metals", amount = 20},
      {type = "item", name = "storage-tank", amount = 1},
    },
    results = {{type = "item", name = "fluid-wagon", amount = 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-train-stop",
    ingredients = {
      {type = "item", name = "cube-electronic-circuit", amount = 4},
      {type = "item", name = "cube-basic-matter-unit", amount = 20},
      {type = "item", name = "stone-brick", amount = 20},
    },
    results = {{type = "item", name = "train-stop", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-rail-signal",
    ingredients = {
      {type = "item", name = "small-lamp", amount = 3},
      {type = "item", name = "cube-electronic-circuit", amount = 1},
      {type = "item", name = "cube-basic-matter-unit", amount = 1},
    },
    results = {{type = "item", name = "rail-signal", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-chain-signal",
    ingredients = {
      {type = "item", name = "small-lamp", amount = 1},
      {type = "item", name = "cube-electronic-circuit", amount = 1},
      {type = "item", name = "cube-basic-matter-unit", amount = 1},
      {type = "item", name = "copper-cable", amount = 1},
    },
    results = {{type = "item", name = "rail-chain-signal", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-rail",
    ingredients = {
      {type = "item", name = "stone", amount = 4},
      {type = "item", name = "cube-basic-matter-unit", amount = 2},
      {type = "item", name = "cube-rare-metals", amount = 2},
    },
    results = {{type = "item", name = "rail", amount = 2}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-radar",
    ingredients = {
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 12},
      {type = "item", name = "cube-rare-metals", amount = 8},
      {type = "item", name = "cube-electronic-circuit", amount = 4},
    },
    results = {{type = "item", name = "radar", amount = 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-construction-robot",
    icon = "__base__/graphics/icons/construction-robot.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 1},
      {type = "item", name = "flying-robot-frame", amount = 1},
      {type = "item", name = "cube-advanced-circuit", amount = 1},
      {type = "item", name = "cube-bottled-consciousness", amount = 1},
    },
    results = {{type = "item", name = "construction-robot", amount = 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    subgroup = "logistic-network",
    order = "cube-a[robot]-b[construction-robot]",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-logistic-robot",
    icon = "__base__/graphics/icons/logistic-robot.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "flying-robot-frame", amount = 2},
      {type = "item", name = "cube-advanced-circuit", amount = 2},
      {type = "item", name = "cube-bottled-euphoria", amount = 1},
      {type = "item", name = "cube-bottled-anguish", amount = 1},
    },
    results = {
      {type = "item", name = "cube-logistic-robot-0", amount = 1},
      {type = "item", name = "cube-logistic-robot-1", amount = 1},
    },
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    subgroup = "logistic-network",
    order = "cube-a[robot]-a[logistic-robot]",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-roboport",
    ingredients = {
      {type = "item", name = "stone-brick", amount = 60},
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 20},
      {type = "item", name = "cube-n-dimensional-widget", amount = 1},
      {type = "item", name = "cube-advanced-circuit", amount = 16},
      {type = "item", name = "radar", amount = 1},
    },
    results = {{type = "item", name = "cube-roboport", amount = 1}},
    energy_required = 8,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-logistic-chest-passive-provider",
    ingredients = {
      {type = "item", name = "iron-chest", amount = 1},
      {type = "item", name = "cube-basic-matter-unit", amount = 1},
      {type = "item", name = "cube-advanced-circuit", amount = 1},
    },
    results = {{type = "item", name = "passive-provider-chest", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-logistic-chest-active-provider",
    ingredients = {
      {type = "item", name = "iron-chest", amount = 1},
      {type = "item", name = "cube-basic-matter-unit", amount = 1},
      {type = "item", name = "cube-advanced-circuit", amount = 1},
    },
    results = {{type = "item", name = "active-provider-chest", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-logistic-chest-storage",
    ingredients = {
      {type = "item", name = "iron-chest", amount = 1},
      {type = "item", name = "cube-basic-matter-unit", amount = 1},
      {type = "item", name = "cube-advanced-circuit", amount = 1},
    },
    results = {{type = "item", name = "storage-chest", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-logistic-chest-buffer",
    ingredients = {
      {type = "item", name = "iron-chest", amount = 1},
      {type = "item", name = "cube-basic-matter-unit", amount = 1},
      {type = "item", name = "cube-advanced-circuit", amount = 1},
    },
    results = {{type = "item", name = "buffer-chest", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-logistic-chest-requester",
    ingredients = {
      {type = "item", name = "iron-chest", amount = 1},
      {type = "item", name = "cube-basic-matter-unit", amount = 1},
      {type = "item", name = "cube-advanced-circuit", amount = 1},
    },
    results = {{type = "item", name = "requester-chest", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-barrel",
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 2},
      {type = "item", name = "cube-rare-metals", amount = 4},
    },
    results = {{type = "item", name = "barrel", amount = 1}},
    energy_required = 1,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-medium-container",
    ingredients = {
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 10},
      {type = "item", name = "cube-rare-metals", amount = 2},
    },
    results = {{type = "item", name = "cube-medium-container", amount = 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-big-container",
    ingredients = {
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 20},
      {type = "item", name = "cube-rare-metals", amount = 4},
    },
    results = {{type = "item", name = "cube-big-container", amount = 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-fluid-storage-1",
    ingredients = {
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 12},
      {type = "item", name = "pipe", amount = 8},
    },
    results = {{type = "item", name = "cube-fluid-storage-1", amount = 1}},
    energy_required = 6,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-fluid-storage-2",
    ingredients = {
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 48},
      {type = "item", name = "pipe", amount = 24},
    },
    results = {{type = "item", name = "cube-fluid-storage-2", amount = 1}},
    energy_required = 8,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
})
