data:extend({
  {
    type = "recipe",
    name = "cube-modular-casing",
    ingredients = {
      {"cube-sophisticated-matter-unit", 1},
      {"cube-electronic-circuit", 10},
      {"cube-advanced-circuit", 10},
    },
    results = {{"cube-modular-casing", 1}},
    energy_required = 15,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-burnt-out-modular-casing",
    icon = "__Ultracube__/graphics/burnt-out-modular-casing.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {{"cube-burnt-out-modular-casing", 1}},
    results = {
      {type = "item", name = "cube-basic-matter-unit", amount_min = 0, amount_max = 100, probability = 0.5},
      {type = "item", name = "cube-rare-metals", amount_min = 0, amount_max = 50, probability = 0.5},
      {type = "item", name = "cube-electronic-circuit", amount_min = 0, amount_max = 10, probability = 0.5},
      {type = "item", name = "cube-advanced-circuit", amount_min = 0, amount_max = 10, probability = 0.5},
      {type = "item", name = "cube-glass", amount_min = 0, amount_max = 10, probability = 0.5},
      {type = "item", name = "copper-cable", amount_min = 0, amount_max = 100, probability = 0.5},
    },
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    subgroup = "cube-module-intermediates",
    order = "b[burnt-out-modular-casing]",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-inductance-module",
    ingredients = {
      {"cube-modular-casing", 1},
      {"cube-spectralite", 10},
    },
    results = {
      {type = "item", name = "cube-inductance-module", amount = 1, probability = 0.25},
      {type = "item", name = "cube-modular-casing", amount = 1, probability = 0.75},
    },
    main_product = "cube-inductance-module",
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-compression-module",
    ingredients = {
      {"cube-modular-casing", 1},
      {"cube-deep-crystal", 10},
    },
    results = {
      {type = "item", name = "cube-compression-module", amount = 1, probability = 0.25},
      {type = "item", name = "cube-modular-casing", amount = 1, probability = 0.75},
    },
    main_product = "cube-compression-module",
    energy_required = 4,
    category = "cube-fabricator-handcraft",
    enabled = false,
  },
})