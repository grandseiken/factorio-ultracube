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
      {type = "fluid", name = "cube-matter-replication-gel", amount = 100},
    },
    results = {
      {"cube-dormant-utility-cube", 1},
      {"cube-basic-contemplation-unit", 100},
      {type = "fluid", name = "steam", amount = 8000},
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
})
