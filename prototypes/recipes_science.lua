data:extend({
  {
    type = "recipe",
    name = "cube-basic-contemplation-unit-0",
    ingredients = {{"cube-ultradense-utility-cube", 1}},
    results = {
      {"cube-ultradense-utility-cube", 1},
      {"cube-basic-contemplation-unit", 10},
    },
    main_product = "cube-basic-contemplation-unit",
    energy_required = 1,
    category = "cube-synthesizer",
    always_show_made_in = true,
    allow_decomposition = false,
  },
  {
    type = "recipe",
    name = "cube-basic-contemplation-unit-1",
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/items/energy-control-unit.png",
        icon_size = 64, icon_mipmaps = 4,
      },
      {
        icon = "__Krastorio2Assets__/icons/fluids/hydrogen.png",
        icon_size = 64, icon_mipmaps = 4,
        scale = 0.25, shift = {8, -8},
      }
    },
    ingredients = {
      {"cube-ultradense-utility-cube", 1},
      {"cube-calcium", 50},
      {type = "fluid", name = "cube-matter-replication-gel", amount = 100},
      {type = "fluid", name = "water", amount = 8000},
    },
    results = {
      {"cube-dormant-utility-cube", 1},
      {"cube-basic-contemplation-unit", 100},
      {type = "fluid", name = "steam", amount = 8000, temperature = 215},
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
    category = "cube-fabricator",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-abstract-interrogation-card",
    ingredients = {
      {"cube-advanced-engine", 1},
      {"cube-bottled-consciousness", 4},
      {"cube-advanced-circuit", 4},
    },
    results = {{"cube-abstract-interrogation-card", 2}},
    energy_required = 16,
    category = "cube-fabricator",
    enabled = false,
  },
})
