local t1_t1_p = 0.25
local t1_t0_p = 1

local t2_t2_p = 0.15
local t2_t1_p = 0.60
local t2_t0_p = 0.85
local t2_destroy_p = 1

local t3_t3_p = 0.1
local t3_t2_p = 0.3
local t3_t1_p = 0.5
local t3_t0_p = 0.7
local t3_destroy_p = 1

data:extend({
  {
    type = "recipe",
    name = "cube-modular-casing",
    ingredients = {
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 1},
      {type = "item", name = "cube-electronic-circuit", amount = 5},
      {type = "item", name = "cube-advanced-circuit", amount = 5},
    },
    results = {{type = "item", name = "cube-modular-casing", amount = 1}},
    energy_required = 15,
    categories = {"cube-fabricator-handcraft"},
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-burnt-out-modular-casing",
    icon = "__Ultracube__/assets/icons/burnt-out-modular-casing.png",
    icon_size = 64,
    ingredients = {{type = "item", name = "cube-burnt-out-modular-casing", amount = 1}},
    results = {
      {type = "item", name = "cube-basic-matter-unit", amount_min = 0, amount_max = 50, independent_probability = 0.5, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-rare-metals", amount_min = 0, amount_max = 25, independent_probability = 0.5, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-electronic-circuit", amount_min = 0, amount_max = 5, independent_probability = 0.5, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-advanced-circuit", amount_min = 0, amount_max = 5, independent_probability = 0.5, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-glass", amount_min = 0, amount_max = 5, independent_probability = 0.5, show_details_in_recipe_tooltip = false},
      {type = "item", name = "copper-cable", amount_min = 0, amount_max = 50, independent_probability = 0.5, show_details_in_recipe_tooltip = false},
    },
    energy_required = 4,
    categories = {"cube-fabricator-handcraft"},
    subgroup = "cube-module-intermediates",
    order = "cube-b[burnt-out-modular-casing]",
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-efficiency-module",
    ingredients = {
      {type = "item", name = "cube-modular-casing", amount = 1},
      {type = "item", name = "cube-spectralite", amount = 10},
    },
    results = {
      {type = "item", name = "cube-efficiency-module", amount = 1, shared_probability = {min = 0, max = t1_t1_p}},
      {type = "item", name = "cube-modular-casing", amount = 1, shared_probability = {min = t1_t1_p, max = t1_t0_p}, show_details_in_recipe_tooltip = false},
    },
    main_product = "cube-efficiency-module",
    energy_required = 4,
    categories = {"cube-fabricator-handcraft"},
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-efficiency-module-v2",
    ingredients = {
      {type = "item", name = "cube-efficiency-module", amount = 1},
      {type = "item", name = "cube-haunted-energy-cell", amount = 1},
    },
    results = {
      {type = "item", name = "cube-efficiency-module-v2", amount = 1, shared_probability = {min = 0, max = t2_t2_p}},
      {type = "item", name = "cube-efficiency-module", amount = 1, shared_probability = {min = t2_t2_p, max = t2_t1_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-modular-casing", amount = 1, shared_probability = {min = t2_t1_p, max = t2_t0_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-burnt-out-modular-casing", amount = 1, shared_probability = {min = t2_t0_p, max = t2_destroy_p}},
    },
    main_product = "cube-efficiency-module-v2",
    energy_required = 8,
    categories = {"cube-fabricator-handcraft"},
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-efficiency-module-v3",
    ingredients = {
      {type = "item", name = "cube-efficiency-module-v2", amount = 1},
      {type = "item", name = "cube-basic-antimatter-unit", amount = 2},
    },
    results = {
      {type = "item", name = "cube-efficiency-module-v3", amount = 1, shared_probability = {min = 0, max = t3_t3_p}},
      {type = "item", name = "cube-efficiency-module-v2", amount = 1, shared_probability = {min = t3_t3_p, max = t3_t2_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-efficiency-module", amount = 1, shared_probability = {min = t3_t2_p, max = t3_t1_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-modular-casing", amount = 1, shared_probability = {min = t3_t1_p, max = t3_t0_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-burnt-out-modular-casing", amount = 1, shared_probability = {min = t3_t0_p, max = t3_destroy_p}},
    },
    main_product = "cube-efficiency-module-v3",
    energy_required = 12,
    categories = {"cube-fabricator-handcraft"},
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-speed-module",
    ingredients = {
      {type = "item", name = "cube-modular-casing", amount = 1},
      {type = "item", name = "cube-deep-powder", amount = 10},
    },
    results = {
      {type = "item", name = "cube-speed-module", amount = 1, shared_probability = {min = 0, max = t1_t1_p}},
      {type = "item", name = "cube-modular-casing", amount = 1, shared_probability = {min = t1_t1_p, max = t1_t0_p}, show_details_in_recipe_tooltip = false},
    },
    main_product = "cube-speed-module",
    energy_required = 4,
    categories = {"cube-fabricator-handcraft"},
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-speed-module-v2",
    ingredients = {
      {type = "item", name = "cube-speed-module", amount = 1},
      {type = "item", name = "cube-deep-crystal", amount = 1},
    },
    results = {
      {type = "item", name = "cube-speed-module-v2", amount = 1, shared_probability = {min = 0, max = t2_t2_p}},
      {type = "item", name = "cube-speed-module", amount = 1, shared_probability = {min = t2_t2_p, max = t2_t1_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-modular-casing", amount = 1, shared_probability = {min = t2_t1_p, max = t2_t0_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-burnt-out-modular-casing", amount = 1, shared_probability = {min = t2_t0_p, max = t2_destroy_p}},
    },
    main_product = "cube-speed-module-v2",
    energy_required = 8,
    categories = {"cube-fabricator-handcraft"},
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-speed-module-v3",
    ingredients = {
      {type = "item", name = "cube-speed-module-v2", amount = 1},
      {type = "item", name = "cube-basic-antimatter-unit", amount = 2},
    },
    results = {
      {type = "item", name = "cube-speed-module-v3", amount = 1, shared_probability = {min = 0, max = t3_t3_p}},
      {type = "item", name = "cube-speed-module-v2", amount = 1, shared_probability = {min = t3_t3_p, max = t3_t2_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-speed-module", amount = 1, shared_probability = {min = t3_t2_p, max = t3_t1_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-modular-casing", amount = 1, shared_probability = {min = t3_t1_p, max = t3_t0_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-burnt-out-modular-casing", amount = 1, shared_probability = {min = t3_t0_p, max = t3_destroy_p}},
    },
    main_product = "cube-speed-module-v3",
    energy_required = 12,
    categories = {"cube-fabricator-handcraft"},
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-productivity-module",
    ingredients = {
      {type = "item", name = "cube-modular-casing", amount = 1},
      {type = "item", name = "cube-advanced-engine", amount = 1},
    },
    results = {
      {type = "item", name = "cube-productivity-module", amount = 1, shared_probability = {min = 0, max = t1_t1_p}},
      {type = "item", name = "cube-modular-casing", amount = 1, shared_probability = {min = t1_t1_p, max = t1_t0_p}, show_details_in_recipe_tooltip = false},
    },
    main_product = "cube-productivity-module",
    energy_required = 4,
    categories = {"cube-fabricator-handcraft"},
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-productivity-module-v2",
    ingredients = {
      {type = "item", name = "cube-productivity-module", amount = 1},
      {type = "item", name = "cube-arcane-drive", amount = 1},
    },
    results = {
      {type = "item", name = "cube-productivity-module-v2", amount = 1, shared_probability = {min = 0, max = t2_t2_p}},
      {type = "item", name = "cube-productivity-module", amount = 1, shared_probability = {min = t2_t2_p, max = t2_t1_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-modular-casing", amount = 1, shared_probability = {min = t2_t1_p, max = t2_t0_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-burnt-out-modular-casing", amount = 1, shared_probability = {min = t2_t0_p, max = t2_destroy_p}},
    },
    main_product = "cube-productivity-module-v2",
    energy_required = 8,
    categories = {"cube-fabricator-handcraft"},
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-productivity-module-v3",
    ingredients = {
      {type = "item", name = "cube-productivity-module-v2", amount = 1},
      {type = "item", name = "cube-basic-antimatter-unit", amount = 2},
    },
    results = {
      {type = "item", name = "cube-productivity-module-v3", amount = 1, shared_probability = {min = 0, max = t3_t3_p}},
      {type = "item", name = "cube-productivity-module-v2", amount = 1, shared_probability = {min = t3_t3_p, max = t3_t2_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-productivity-module", amount = 1, shared_probability = {min = t3_t2_p, max = t3_t1_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-modular-casing", amount = 1, shared_probability = {min = t3_t1_p, max = t3_t0_p}, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-burnt-out-modular-casing", amount = 1, shared_probability = {min = t3_t0_p, max = t3_destroy_p}},
    },
    main_product = "cube-productivity-module-v3",
    energy_required = 12,
    categories = {"cube-fabricator-handcraft"},
    enabled = false,
  },
})