data:extend({
  {
    type = "recipe",
    name = "cube-basic-contemplation-unit-0",
    icon = "__Krastorio2Assets__/icons/cards/military-tech-card.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {
      {name = "cube-ultradense-utility-cube", amount = 1, catalyst_amount = 1},
    },
    results = {
      {name = "cube-ultradense-utility-cube", amount = 1, catalyst_amount = 1},
      {"cube-basic-contemplation-unit", 10},
    },
    main_product = "",
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-advanced",
    order = "0[b-contemplation-0]",
    always_show_made_in = true,
    allow_decomposition = false,
  },
  {
    type = "recipe",
    name = "cube-basic-contemplation-unit-1",
    icon = "__Ultracube__/assets/icons/recipe/contemplative-replication.png",
    icon_size = 128, icon_mipmaps = 5,
    ingredients = {
      {name = "cube-ultradense-utility-cube", amount = 1, catalyst_amount = 1},
      {type = "fluid", name = "cube-matter-replication-gel", amount = 100},
      {type = "fluid", name = "water", amount = 8000},
      {"cube-calcium", 50},
    },
    results = {
      {name = "cube-ultradense-utility-cube", amount = 1, catalyst_amount = 1},
      {type = "fluid", name = "steam", amount = 8000, temperature = 215},
      {"cube-basic-contemplation-unit", 100},
    },
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-advanced",
    order = "0[b-contemplation-1]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-fundamental-comprehension-card",
    ingredients = {
      {"cube-electronic-circuit", 6},
      {"cube-n-dimensional-widget", 1},
    },
    results = {{"cube-fundamental-comprehension-card", 1}},
    energy_required = 12,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-abstract-interrogation-card",
    ingredients = {
      {"cube-advanced-engine", 1},
      {"cube-advanced-circuit", 2},
      {"cube-bottled-consciousness", 4},
    },
    results = {{"cube-abstract-interrogation-card", 2}},
    energy_required = 16,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-deep-introspection-card",
    ingredients = {
      {"cube-deep-crystal", 1},
      {"cube-resplendent-plate", 1}, -- Except something from it?
      {"explosives", 1}, -- Except something from it. Or diamond?
      {"concrete", 10}, -- Or refined concrete?
    },
    results = {{"cube-deep-introspection-card", 1}},
    energy_required = 12,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-synthetic-premonition-card",
    ingredients = {
      {"cube-spectral-processor", 1},
      {"cube-haunted-energy-cell", 1},
      {"cube-bottled-anguish", 1},
    },
    results = {
      {"cube-synthetic-premonition-card", 1},
      {type = "item", name = "cube-residual-tendrils", amount_min = 4, amount_max = 16},
    },
    main_product = "cube-synthetic-premonition-card",
    energy_required = 12,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-complete-annihilation-card",
    ingredients = {
      {"cube-singularity-research-data", 1},
      {"cube-quantum-research-data", 1},
      {"cube-basic-antimatter-unit", 2},
    },
    results = {
      {"cube-complete-annihilation-card", 2},
    },
    energy_required = 30,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
})
