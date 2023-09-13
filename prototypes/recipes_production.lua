data:extend({
  {
    type = "recipe",
    name = "cube-offshore-pump",
    ingredients = {
      {"cube-basic-matter-unit", 40},
      {"cube-basic-motor-unit", 1},
      {"pipe", 1},
    },
    results = {{"offshore-pump", 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
  },
  {
    type = "recipe",
    name = "cube-boiler",
    ingredients = {
      {"cube-basic-matter-unit", 20},
      {"pipe", 4},
    },
    results = {{"cube-boiler", 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
  },
  {
    type = "recipe",
    name = "cube-lab",
    ingredients = {
      {"cube-basic-matter-unit", 40},
      {"cube-basic-contemplation-unit", 10},
    },
    results = {{"cube-lab", 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
  },
  {
    type = "recipe",
    name = "cube-steam-engine",
    ingredients = {
      {"cube-basic-matter-unit", 20},
      {"cube-basic-motor-unit", 1},
      {"pipe", 2},
    },
    results = {{"steam-engine", 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
  },
  {
    type = "recipe",
    name = "cube-electric-mining-drill",
    ingredients = {
      {"cube-basic-matter-unit", 120},
      {"cube-basic-motor-unit", 4},
    },
    results = {{"cube-electric-mining-drill", 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-electric-mining-drill-mk2",
    ingredients = {
      {"cube-electric-mining-drill", 1},
      {"cube-advanced-engine", 10},
      {"cube-resplendent-plate", 20},
    },
    results = {{"cube-electric-mining-drill-mk2", 1}},
    energy_required = 16,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-deep-core-ultradrill",
    ingredients = {
      {"cube-sophisticated-matter-unit", 200},
      {"cube-advanced-engine", 40},
      {"cube-advanced-circuit", 20},
      {"cube-rare-metals", 200},
      {"concrete", 400},
    },
    results = {{"cube-deep-core-ultradrill", 1}},
    energy_required = 40,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ultradense-furnace",
    ingredients = {
      {"stone-brick", 100},
      {"cube-basic-matter-unit", 400},
      {"cube-basic-motor-unit", 10},
      {"pipe", 20},
    },
    results = {{"cube-ultradense-furnace", 1}},
    energy_required = 20,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-electric-furnace",
    ingredients = {
      {"cube-basic-matter-unit", 100},
      {"cube-basic-motor-unit", 2},
    },
    results = {{"cube-electric-furnace", 1}},
    energy_required = 6,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-greenhouse",
    ingredients = {
      {"cube-basic-matter-unit", 200},
      {"cube-glass", 40},
      {"small-lamp", 16},
      {"wood", 20},
      {"pipe", 12},
    },
    results = {{"cube-greenhouse", 1}},
    energy_required = 6,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-crusher",
    ingredients = {
      {"cube-basic-matter-unit", 160},
      {"cube-basic-motor-unit", 8},
      {"cube-rare-metals", 40},
    },
    results = {{"cube-crusher", 1}},
    energy_required = 6,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-fabricator",
    ingredients = {
      {"cube-basic-matter-unit", 160},
      {"cube-basic-motor-unit", 4},
      {"cube-electronic-circuit", 4},
    },
    results = {{"cube-fabricator", 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-chemical-plant",
    ingredients = {
      {"cube-basic-matter-unit", 80},
      {"cube-electronic-circuit", 4},
      {"cube-glass", 20},
      {"stone-brick", 40},
      {"pipe", 8},
    },
    results = {{"cube-chemical-plant", 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-distillery",
    ingredients = {
      {"cube-electric-furnace", 1},
      {"storage-tank", 2},
      {"cube-glass", 20},
      {"stone-brick", 80},
      {"pipe", 20},
    },
    results = {{"cube-distillery", 1}},
    energy_required = 8,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-fluid-burner",
    ingredients = {
      {"cube-basic-matter-unit", 20},
      {"stone-brick", 20},
      {"pipe", 4},
    },
    results = {{"cube-fluid-burner", 1}},
    energy_required = 2,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-fuel-refinery",
    ingredients = {
      {"cube-basic-matter-unit", 80},
      {"cube-electronic-circuit", 2},
      {"cube-rare-metals", 40},
      {"stone-brick", 40},
      {"pipe", 8},
    },
    results = {{"cube-fuel-refinery", 1}},
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-accumulator",
    ingredients = {
      {"cube-rare-metals", 40},
      {"cube-basic-matter-unit", 40},
      {"battery", 8},
    },
    results = {{"accumulator", 1}},
    energy_required = 8,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-recovery-bay",
    ingredients = {
      {"stone-brick", 20},
      {"cube-basic-matter-unit", 250},
      {"cube-n-dimensional-widget", 5},
      {"copper-cable", 20},
    },
    results = {{"cube-recovery-bay", 1}},
    energy_required = 12,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-synthesizer",
    ingredients = {
      {"stone-brick", 100},
      {"cube-basic-matter-unit", 400},
      {"cube-electronic-circuit", 20},
      {"cube-n-dimensional-widget", 20},
    },
    results = {{"cube-synthesizer", 1}},
    energy_required = 20,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-dimension-folding-engine",
    ingredients = {
      {"concrete", 160},
      {"cube-sophisticated-matter-unit", 100},
      {"cube-n-dimensional-widget", 80},
      {"cube-advanced-circuit", 40},
      {"battery", 40},
    },
    results = {{"cube-dimension-folding-engine", 1}},
    energy_required = 40,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-stygian-energy-lab",
    ingredients = {
      {"cube-sophisticated-matter-unit", 40},
      {"cube-spectralite", 80},
      {"cube-glass", 20},
      {"cube-n-dimensional-widget", 10},
      {"pipe", 12},
    },
    results = {{"cube-stygian-energy-lab", 1}},
    energy_required = 20,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-heavy-turbine",
    ingredients = {
      {"cube-sophisticated-matter-unit", 40},
      {"cube-advanced-engine", 20},
      {"pipe", 20},
    },
    results = {{"cube-heavy-turbine", 1}},
    energy_required = 20,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },


})
