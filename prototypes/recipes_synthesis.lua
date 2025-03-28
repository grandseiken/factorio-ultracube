data:extend({
  {
    type = "recipe",
    name = "cube-utility-cube-manual-reboot",
    icon = "__Ultracube__/assets/icons/recipe/utility-cube-manual-reboot.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1},
    },
    results = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1},
    },
    main_product = "",
    energy_required = 10,
    category = "crafting",
    subgroup = "cube-synthesis-manual",
    order = "cube-0[0-reboot]",
    allow_inserter_overload = false,
    allow_decomposition = false,
    allow_intermediates = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    hide_from_signal_gui = true,
  },
  {
    type = "recipe",
    name = "cube-combustion-cube-manual-reassembly",
    icon = "__Ultracube__/assets/icons/recipe/combustion-cube-manual-reassembly.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-dormant-combustion-cube", amount = 1},
      {type = "item", name = "cube-dormant-phantom-constituent", amount = 32},
    },
    results = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1, ignored_by_productivity = 1},
    },
    main_product = "",
    energy_required = 30,
    category = "crafting",
    subgroup = "cube-synthesis-manual",
    order = "cube-0[1-reassembly]",
    allow_inserter_overload = false,
    allow_decomposition = false,
    allow_intermediates = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    hide_from_signal_gui = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-phantom-cube-manual-discharge",
    icon = "__Ultracube__/assets/icons/recipe/phantom-cube-manual-discharge.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 1},
    },
    results = {
      {type = "item", name = "cube-dormant-phantom-constituent", amount = 1, ignored_by_productivity = 1},
    },
    main_product = "",
    energy_required = 1,
    category = "crafting",
    subgroup = "cube-synthesis-manual",
    order = "cube-0[2-discharge]",
    allow_inserter_overload = false,
    allow_decomposition = false,
    allow_intermediates = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    hide_from_signal_gui = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-phantom-cube-manual-reassembly",
    icon = "__Ultracube__/assets/icons/recipe/phantom-cube-manual-reassembly.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-dormant-phantom-constituent", amount = 64},
    },
    results = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1, ignored_by_productivity = 1},
    },
    main_product = "",
    energy_required = 30,
    category = "crafting",
    subgroup = "cube-synthesis-manual",
    order = "cube-0[3-reassembly]",
    allow_inserter_overload = false,
    allow_decomposition = false,
    allow_intermediates = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    hide_from_signal_gui = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ultradense-combustion-cube",
    icon = "__Ultracube__/assets/icons/recipe/ultradense-combustion-cube.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "item", name = "cube-ghost-crystal", amount = 32},
      {type = "item", name = "cube-boson-conduit", amount = 32},
    },
    results = {
      {type = "item", name = "cube-ultradense-combustion-cube", amount = 1, ignored_by_productivity = 1},
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 32, ignored_by_productivity = 32},
    },
    main_product = "",
    energy_required = 4,
    category = "cube-dimension-folding-engine",
    subgroup = "cube-synthesis-handling",
    order = "cube-0[0-combustion]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ultradense-utility-cube-combustion",
    icon = "__Ultracube__/assets/icons/recipe/ultradense-utility-cube-combustion.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-ultradense-combustion-cube", amount = 1},
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 32},
    },
    results = {{type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1}},
    main_product = "",
    energy_required = 4,
    category = "cube-dimension-folding-engine",
    subgroup = "cube-synthesis-handling",
    order = "cube-0[1-combustion]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-phantom-ultradense-constituent",
    icon = "__Ultracube__/assets/icons/recipe/phantom-ultradense-constituent.png",
    icon_size = 128,
    ingredients = {{type = "item", name = "cube-ultradense-utility-cube", amount = 1}},
    results = {{type = "item", name = "cube-phantom-ultradense-constituent", amount = 64, ignored_by_productivity = 64}},
    main_product = "",
    energy_required = 4,
    category = "cube-dimension-folding-engine",
    subgroup = "cube-synthesis-handling",
    order = "cube-0[2-phantom]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ultradense-utility-cube-phantom",
    icon = "__Ultracube__/assets/icons/recipe/ultradense-utility-cube-phantom.png",
    icon_size = 128,
    ingredients = {{type = "item", name = "cube-phantom-ultradense-constituent", amount = 64}},
    results = {{type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1}},
    main_product = "",
    energy_required = 4,
    category = "cube-dimension-folding-engine",
    subgroup = "cube-synthesis-handling",
    order = "cube-0[3-phantom]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-utility-cube-recharge",
    icon = "__Ultracube__/assets/icons/recipe/utility-cube-recharge.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1},
    },
    results = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1},
    },
    main_product = "",
    energy_required = 2,
    category = "cube-recovery-bay",
    subgroup = "cube-synthesis-handling",
    order = "cube-x[0-recharge]",
    always_show_made_in = true,
    allow_inserter_overload = false,
    allow_decomposition = false,
    allow_intermediates = false,
    allow_as_intermediate = false,
    hide_from_signal_gui = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-combustion-cube-recharge",
    icon = "__Ultracube__/assets/icons/recipe/combustion-cube-recharge.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-dormant-combustion-cube", amount = 1},
    },
    results = {
      {type = "item", name = "cube-ultradense-combustion-cube", amount = 1, ignored_by_productivity = 1},
    },
    main_product = "",
    energy_required = 2,
    category = "cube-recovery-bay",
    subgroup = "cube-synthesis-handling",
    order = "cube-x[1-recharge]",
    always_show_made_in = true,
    allow_inserter_overload = false,
    allow_decomposition = false,
    allow_intermediates = false,
    allow_as_intermediate = false,
    hide_from_signal_gui = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-phantom-constituent-recharge",
    icon = "__Ultracube__/assets/icons/recipe/phantom-constituent-recharge.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-dormant-phantom-constituent", amount = 1},
    },
    results = {
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 1, ignored_by_productivity = 1},
    },
    main_product = "",
    energy_required = 2,
    category = "cube-recovery-bay",
    subgroup = "cube-synthesis-handling",
    order = "cube-x[2-phantom-recharge]",
    always_show_made_in = true,
    allow_inserter_overload = false,
    allow_decomposition = false,
    allow_intermediates = false,
    allow_as_intermediate = false,
    hide_from_signal_gui = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-phantom-constituent-recharge-euphoria",
    icon = "__Ultracube__/assets/icons/recipe/phantom-constituent-recharge-euphoria.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-dormant-phantom-constituent", amount = 1},
      {type = "item", name = "cube-bottled-euphoria", amount = 1},
    },
    results = {
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 1, ignored_by_productivity = 1},
      {type = "item", name = "cube-besselheim-flask", amount = 1, ignored_by_productivity = 1, probability = 0.75, show_details_in_recipe_tooltip = false},
    },
    main_product = "",
    energy_required = 1,
    category = "cube-chemical-plant",
    subgroup = "cube-synthesis-handling",
    order = "cube-x[3-phantom-recharge]",
    always_show_made_in = true,
    allow_inserter_overload = false,
    allow_decomposition = false,
    allow_intermediates = false,
    allow_as_intermediate = false,
    enabled = false,
    crafting_machine_tint = {
      primary = {r = 0.95, g = 0.15, b = 0.5, a = 0.75},
      secondary = {r = 0.8, g = 0.8, b = 0.8, a = 0.75},
      tertiary = {r = 0.85, g = 0.1, b = 0.4, a = 0.75},
      quaternary = {r = 0.2, g = 0.175, b = 0.15, a = 0.75},
    },
  },

  {
    type = "recipe",
    name = "cube-basic-matter-unit-0",
    icon = "__base__/graphics/icons/plastic-bar.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
    },
    results = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-basic-matter-unit", amount = 100},
    },
    main_product = "",
    energy_required = 1,
    category = "cube-synthesizer-handcraft",
    subgroup = "cube-synthesis-basics",
    order = "cube-0[a-matter]",
    always_show_made_in = true,
    allow_decomposition = false,
  },
  {
    type = "recipe",
    name = "cube-basic-matter-unit-1",
    icon = "__Ultracube__/assets/icons/recipe/basic-matter-unit-replication.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "fluid", name = "cube-matter-replication-gel", amount = 400},
      {type = "fluid", name = "steam", amount = 2000},
    },
    results = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-basic-matter-unit", amount = 1000},
    },
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-basics",
    order = "cube-1[a-matter]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-basic-matter-unit-phantom",
    icon = "__Ultracube__/assets/icons/recipe/basic-matter-unit-phantom.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 1},
      {type = "fluid", name = "cube-matter-replication-gel", amount = 40},
    },
    results = {
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-basic-matter-unit", amount = 100},
    },
    main_product = "",
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-basics",
    order = "cube-2[a-matter]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-n-dimensional-widget-0",
    icon = "__krastorio2-assets-ultracube__/icons/items/automation-core.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "item", name = "cube-rare-metals", amount = 50},
    },
    results = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1, ignored_by_productivity = 1},
      {type = "item", name = "cube-n-dimensional-widget", amount = 5},
    },
    main_product = "",
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-advanced",
    order = "cube-1[widget-0]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-n-dimensional-widget-1",
    icon = "__Ultracube__/assets/icons/recipe/n-dimensional-widget-replication.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "item", name = "cube-rare-metals", amount = 200},
      {type = "fluid", name = "cube-matter-replication-gel", amount = 200},
      {type = "fluid", name = "steam", amount = 1000},
    },
    results = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-n-dimensional-widget", amount = 50},
      {type = "fluid", name = "water", amount = 1000, show_details_in_recipe_tooltip = false},
    },
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-advanced",
    order = "cube-1[widget-1]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-phantom-components",
    icon = "__Ultracube__/assets/icons/recipe/phantom-components.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 1},
      {type = "fluid", name = "cube-matter-replication-gel", amount = 50},
      {type = "fluid", name = "steam", amount = 100},
      {type = "item", name = "cube-rare-metals", amount = 100},
      {type = "item", name = "cube-calcium", amount = 5},
    },
    results = {
      {type = "item", name = "cube-dormant-phantom-constituent", amount = 1, ignored_by_productivity = 1},
      {type = "fluid", name = "water", amount = 100, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-n-dimensional-widget", amount = 10},
      {type = "item", name = "cube-basic-contemplation-unit", amount = 10},
    },
    main_product = "",
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-advanced",
    order = "cube-2[components]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-matter-replication-gel",
    icon = "__krastorio2-assets-ultracube__/icons/fluids/hydrogen.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 200},
      {type = "fluid", name = "steam", amount = 8000, ignored_by_stats = 2000},
      {type = "fluid", name = "water", amount = 2000, ignored_by_stats = 2000},
    },
    results = {
      {type = "fluid", name = "cube-matter-replication-gel", amount = 4000},
      {type = "fluid", name = "steam", amount = 2000, ignored_by_stats = 2000, ignored_by_productivity = 2000, temperature = 215, show_details_in_recipe_tooltip = false},
      {type = "fluid", name = "water", amount = 4000, ignored_by_stats = 2000, ignored_by_productivity = 2000, show_details_in_recipe_tooltip = false},
    },
    energy_required = 4,
    category = "cube-ultradense-furnace",
    subgroup = "cube-synthesis-basics",
    order = "cube-1[0-cube-matter-replication-gel]",
    always_show_made_in = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-cerebral-substrate",
    icon = "__krastorio2-assets-ultracube__/icons/fluids/matter.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1},
      {type = "fluid", name = "cube-matter-replication-gel", amount = 400},
    },
    results = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "fluid", name = "cube-cerebral-substrate", amount = 8000},
    },
    energy_required = 2,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-sentience",
    order = "cube-0[a-cube-cerebral-substrate]",
    always_show_made_in = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-cerebral-substrate-phantom",
    icon = "__Ultracube__/assets/icons/recipe/cerebral-substrate-phantom.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-dormant-phantom-constituent", amount = 1},
      {type = "fluid", name = "cube-matter-replication-gel", amount = 40},
      {type = "item", name = "cube-bottled-euphoria", amount = 1},
    },
    results = {
      {type = "item", name = "cube-dormant-phantom-constituent", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "fluid", name = "cube-cerebral-substrate", amount = 1000},
      {type = "item", name = "cube-besselheim-flask", amount = 1, ignored_by_productivity = 1, probability = 0.5, show_details_in_recipe_tooltip = false},
    },
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-sentience",
    order = "cube-0[b-cube-cerebral-substrate-phantom]",
    always_show_made_in = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-emotional-decomposition",
    icon = "__Ultracube__/assets/icons/recipe/emotional-decomposition.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "fluid", name = "cube-cerebral-substrate", amount = 25000},
      {type = "fluid", name = "cube-ethanol", amount = 2000},
    },
    results = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1, ignored_by_productivity = 1},
      {type = "fluid", name = "cube-joy", amount = 10000},
      {type = "fluid", name = "cube-despair", amount = 10000},
    },
    energy_required = 4,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-sentience",
    order = "cube-1[cube-emotional-decomposition]",
    always_show_made_in = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ghost-crystal",
    icons = {{
      icon = "__krastorio2-assets-ultracube__/icons/items/quartz.png",
      icon_size = 64,
      tint = {r = 1, g = 1, b = 1, a = 0.5},
    }},
    ingredients = {
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 1},
    },
    results = {
      {type = "item", name = "cube-dormant-phantom-constituent", amount = 1, ignored_by_productivity = 1},
      {type = "item", name = "cube-ghost-crystal", amount = 100},
    },
    main_product = "",
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-ethereal",
    order = "cube-b[crystal]",
    always_show_made_in = true,
    allow_inserter_overload = false,
    allow_decomposition = false,
    allow_intermediates = false,
    allow_as_intermediate = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ectoplasm",
    icon = "__Ultracube__/assets/icons/ectoplasm.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 1},
      {type = "item", name = "cube-bottled-anguish", amount = 1},
      {type = "item", name = "cube-ghost-crystal", amount = 1},
      {type = "fluid", name = "cube-unstable-gas", amount = 50},
    },
    results = {
      {type = "item", name = "cube-dormant-phantom-constituent", amount = 1, ignored_by_productivity = 1},
      {type = "fluid", name = "cube-ectoplasm", amount = 200},
      {type = "item", name = "cube-besselheim-flask", amount = 1, ignored_by_productivity = 1, probability = 0.5, show_details_in_recipe_tooltip = false},
    },
    main_product = "",
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-sentience",
    order = "cube-2[ectoplasm]",
    always_show_made_in = true,
    allow_inserter_overload = false,
    allow_decomposition = false,
    allow_intermediates = false,
    allow_as_intermediate = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-arcane-drive",
    icon = "__krastorio2-assets-ultracube__/icons/equipment/advanced-additional-engine-equipment.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 1},
      {type = "item", name = "cube-advanced-engine", amount = 1},
      {type = "item", name = "cube-resplendent-plate", amount = 1},
      {type = "item", name = "cube-spectral-processor", amount = 1},
      {type = "fluid", name = "cube-ectoplasm", amount = 20},
    },
    results = {
      {type = "item", name = "cube-phantom-ultradense-constituent", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-arcane-drive", amount = 1}
    },
    main_product = "",
    energy_required = 1,
    category = "cube-synthesizer",
    subgroup = "cube-synthesis-ethereal",
    order = "cube-a[0-arcane-drive]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-residual-tendrils",
    icon = "__Ultracube__/assets/icons/recipe/residual-tendrils.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "item", name = "cube-residual-tendrils", amount = 20000, ignored_by_stats = 20000},
    },
    results = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1, ignored_by_productivity = 1},
      {type = "item", name = "cube-residual-tendrils", amount_min = 4800, amount_max = 6400, ignored_by_stats = 20000, show_details_in_recipe_tooltip = false},
    },
    main_product = "",
    energy_required = 2,
    category = "cube-dimension-folding-engine",
    subgroup = "cube-synthesis-ethereal",
    order = "cube-d[0-tendrils]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-conduits",
    icon = "__Ultracube__/assets/icons/recipe/conduits.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "fluid", name = "cube-ectoplasm", amount = 400},
      {type = "fluid", name = "cube-deep-solution", amount = 600},
      {type = "item", name = "cube-deep-powder", amount = 200},
    },
    results = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-boson-conduit", amount = 50, probability = 0.5},
      {type = "item", name = "cube-fermion-conduit", amount = 50, probability = 0.5},
    },
    energy_required = 2,
    category = "cube-cyclotron",
    subgroup = "cube-research-singularity",
    order = "cube-x[0-conduits]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-conduit-conversion-a",
    icon = "__Ultracube__/assets/icons/recipe/conduit-conversion-a.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "item", name = "cube-deep-crystal", amount = 4},
      {type = "item", name = "cube-fermion-conduit", amount = 50},
    },
    results = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-boson-conduit", amount = 50},
      {type = "item", name = "cube-deep-powder", amount_min = 0, amount_max = 10},
    },
    energy_required = 2,
    category = "cube-cyclotron",
    subgroup = "cube-research-singularity",
    order = "cube-x[1-conduits]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-conduit-conversion-b",
    icon = "__Ultracube__/assets/icons/recipe/conduit-conversion-b.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "item", name = "cube-boson-conduit", amount = 50},
      {type = "item", name = "uranium-235", amount = 1},
    },
    results = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-fermion-conduit", amount = 50},
    },
    energy_required = 2,
    category = "cube-cyclotron",
    subgroup = "cube-research-singularity",
    order = "cube-x[2-conduits]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-singularity-research-data",
    icon = "__krastorio2-assets-ultracube__/icons/cards/singularity-research-data.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "item", name = "cube-boson-conduit", amount = 16},
      {type = "item", name = "cube-fermion-conduit", amount = 10},
      {type = "item", name = "cube-rare-metals", amount = 400},
    },
    results = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "cube-singularity-research-data", amount = 5},
    },
    energy_required = 2,
    category = "cube-cyclotron",
    subgroup = "cube-research-singularity",
    order = "cube-x[3-singularity]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-singularity-research-data-enhanced",
    icon = "__Ultracube__/assets/icons/recipe/singularity-research-data-enhanced.png",
    icon_size = 128,
    ingredients = {
      {type = "item", name = "cube-dormant-utility-cube", amount = 1},
      {type = "item", name = "cube-boson-conduit", amount = 160},
      {type = "item", name = "cube-fermion-conduit", amount = 100},
      {type = "item", name = "uranium-238", amount = 20},
      {type = "item", name = "cube-rare-metals", amount = 2000},
    },
    results = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1, ignored_by_productivity = 1},
      {type = "item", name = "cube-singularity-research-data", amount = 50},
    },
    energy_required = 2,
    category = "cube-dimension-folding-engine",
    subgroup = "cube-research-singularity",
    order = "cube-z[4-singularity]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-resonance-cascade",
    icon = "__Ultracube__/assets/icons/recipe/resonance-cascade.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-ultradense-utility-cube", amount = 1},
      {type = "item", name = "cube-bottled-euphoria", amount = 10},
    },
    results = {
      {type = "item", name = "cube-legendary-iron-gear", amount = 1, ignored_by_productivity = 1},
      {type = "item", name = "cube-ultradense-debris", amount = 256, ignored_by_productivity = 256},
      {type = "item", name = "cube-basic-antimatter-unit", amount = 1000},
    },
    main_product = "",
    energy_required = 16,
    category = "cube-forbidden-ziggurat",
    subgroup = "cube-synthesis-forbidden",
    order = "cube-0[0]",
    always_show_made_in = true,
    allow_decomposition = false,
    hide_from_signal_gui = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ultradense-powder",
    ingredients = {{type = "item", name = "cube-ultradense-debris", amount = 1}},
    results = {{type = "item", name = "cube-ultradense-powder", amount = 16, ignored_by_productivity = 16}},
    energy_required = 1,
    category = "cube-crusher",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ultradense-mineral",
    ingredients = {
      {type = "item", name = "cube-ultradense-powder", amount = 4},
      {type = "fluid", name = "cube-ethanol", amount = 4},
      {type = "fluid", name = "cube-mineral-water", amount = 12},
    },
    results = {
      {type = "item", name = "cube-ultradense-mineral", amount = 1},
      {type = "fluid", name = "water", amount = 10, show_details_in_recipe_tooltip = false},
    },
    main_product = "cube-ultradense-mineral",
    energy_required = 1,
    category = "cube-chemical-plant",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
    crafting_machine_tint = {
      primary = {r = 0.4, g = 0.7, b = 0.9, a = 0.25},
      secondary = {r = 0.025, g = 0.1, b = 0.15, a = 0.5},
      tertiary = {r = 0.15, g = 0.3, b = 0.4, a = 0.75},
      quaternary = {r = 0.05, g = 0.15, b = 0.2, a = 0.75},
    },
  },
  {
    type = "recipe",
    name = "cube-ultradense-sap",
    ingredients = {
      {type = "item", name = "cube-ultradense-mineral", amount = 4},
      {type = "fluid", name = "cube-unstable-gas", amount = 5},
    },
    results = {
      {type = "item", name = "cube-ultradense-debris", amount = 1},
      {type = "fluid", name = "cube-ultradense-sap", amount = 4},
    },
    main_product = "cube-ultradense-sap",
    energy_required = 1,
    category = "cube-distillery",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ultradense-matter-unit",
    ingredients = {
      {type = "item", name = "cube-ultradense-powder", amount = 4},
      {type = "item", name = "cube-ultradense-mineral", amount = 3},
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 2},
      {type = "item", name = "cube-spectralite", amount = 1},
      {type = "fluid", name = "cube-ultradense-sap", amount = 5},
    },
    results = {{type = "item", name = "cube-ultradense-matter-unit", amount = 2}},
    energy_required = 2,
    category = "cube-furnace",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ultradense-composite",
    ingredients = {
      {type = "item", name = "cube-ultradense-matter-unit", amount = 8},
      {type = "item", name = "cube-n-dimensional-widget", amount = 1},
      {type = "item", name = "cube-bottled-consciousness", amount = 1},
    },
    results = {
      {type = "item", name = "cube-ultradense-composite", amount = 1},
      {type = "item", name = "cube-besselheim-flask", amount = 1, ignored_by_productivity = 1, probability = 0.5, show_details_in_recipe_tooltip = false},
    },
    main_product = "cube-ultradense-composite",
    energy_required = 4,
    category = "cube-fabricator",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-ultradense-utility-cube",
    icon = "__krastorio2-assets-ultracube__/icons/items/matter-cube.png",
    icon_size = 64,
    ingredients = {
      {type = "item", name = "cube-legendary-iron-gear", amount = 1},
      {type = "item", name = "cube-ultradense-composite", amount = 64},
    },
    results = {{type = "item", name = "cube-ultradense-utility-cube", amount = 1}},
    energy_required = 8,
    main_product = "",
    category = "cube-dimension-folding-engine",
    subgroup = "cube-synthesis-forbidden",
    order = "cube-9[cube]",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
  },
})
