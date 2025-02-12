local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "cube-qubit",
    icon = "__Ultracube__/assets/icons/qubit.png",
    icon_size = 64,
    subgroup = "cube-research-quantum",
    order = "cube-0[qubit]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 10,
  },
  {
    type = "item",
    name = "cube-qubits",
    icon = "__Ultracube__/assets/icons/recipe/qubits.png",
    icon_size = 64,
    subgroup = "cube-research-quantum",
    order = "cube-x[0]",
    stack_size = 1,
    hidden = true,
  },
  {
    type = "item",
    name = "cube-qubit-random",
    icon = "__Ultracube__/assets/icons/recipe/qubits.png",
    icon_size = 64,
    subgroup = "cube-research-quantum",
    order = "cube-x[1]",
    stack_size = 1,
    hidden = true,
  },

  {
    type = "recipe",
    name = "cube-qubit",
    ingredients = {
      {type = "item", name = "cube-sophisticated-matter-unit", amount = 2},
      {type = "item", name = "cube-bottled-consciousness", amount = 1},
      {type = "item", name = "cube-spectralite", amount = 2},
      {type = "item", name = "cube-deep-crystal", amount = 2},
    },
    results = {
      {type = "item", name = "cube-qubit", amount = 2},
      {type = "item", name = "cube-besselheim-flask", amount = 1, ignored_by_productivity = 1, probability = 0.75, show_details_in_recipe_tooltip = false},
    },
    main_product = "cube-qubit",
    energy_required = 8,
    category = "cube-fabricator",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-qubit-init",
    ingredients = {{type = "item", name = "cube-qubit", amount = 1}},
    results = {{type = "item", name = "cube-qubit-0", amount = 1, show_details_in_recipe_tooltip = false}},
    energy_required = 1,
    category = "cube-particle-phase-aligner",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-qubits-failure-dummy",
    icon = "__Ultracube__/assets/icons/recipe/qubits-failure.png",
    icon_size = 64,
    ingredients = {{type = "item", name = "cube-qubits", amount = 2}},
    results = {{type = "item", name = "cube-qubit", amount = 1, show_details_in_recipe_tooltip = false}},
    energy_required = 3.2,
    main_product = "",
    category = "cube-quantum-decoder-dummy",
    subgroup = "cube-research-quantum",
    order = "cube-a[0]",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-qubits-partial-dummy",
    icon = "__Ultracube__/assets/icons/recipe/qubits-partial.png",
    icon_size = 64,
    ingredients = {{type = "item", name = "cube-qubits", amount = 2}},
    results = {{type = "item", name = "cube-qubit-random", amount = 1, show_details_in_recipe_tooltip = false}},
    energy_required = 3.2,
    main_product = "",
    category = "cube-quantum-decoder-dummy",
    subgroup = "cube-research-quantum",
    order = "cube-a[1]",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-qubits-success-dummy",
    icon = "__Ultracube__/assets/icons/recipe/qubits-success.png",
    icon_size = 128,
    ingredients = {{type = "item", name = "cube-qubits", amount = 2}},
    results = {{type = "item", name = "cube-quantum-research-data", amount = 10}},
    energy_required = 3.2,
    main_product = "",
    category = "cube-quantum-decoder-dummy",
    subgroup = "cube-research-quantum",
    order = "cube-a[2]",
    enabled = false,
  },

  {
    type = "recipe-category",
    name = "cube-quantum-decoder",
    order = "cube-zz",
  },
  {
    type = "recipe-category",
    name = "cube-quantum-decoder-dummy",
    order = "cube-zz",
  },
})

local dummy = data.raw.recipe["cube-qubits-success-dummy"]

for i = 0, 5 do
  local qubit = "cube-qubit-" .. i
  local qubit_next = "cube-qubit-" .. ((1 + i) % 6)
  local icon = "__Ultracube__/assets/icons/qubit-" .. i .. ".png"

  data:extend({
    {
      type = "item",
      name = qubit,
      icon = icon,
      icon_size = 64,
      pictures = {
        layers = {
          {
            size = 64,
            filename = icon,
            scale = 0.5,
          },
          {
            draw_as_light = true,
            flags = {"light"},
            size = 64,
            filename = "__Ultracube__/assets/icons/qubit-light.png",
            scale = 0.5,
          },
        },
      },
      subgroup = "cube-qubits",
      order = "cube-1[" .. i .. "]",
      inventory_move_sound = item_sounds.science_inventory_move,
      pick_sound = item_sounds.science_inventory_pickup,
      drop_sound = item_sounds.science_inventory_move,
      stack_size = 10,
    },
    {
      type = "recipe",
      name = "cube-qubit-next-" .. ((i + 1) % 6),
      ingredients = {{type = "item", name = qubit, amount = 1}},
      results = {{type = "item", name = qubit_next, amount = 1}},
      energy_required = 1,
      category = "cube-particle-phase-aligner",
      enabled = false,
    },

    {
      type = "recipe",
      name = "cube-qubit-consume-" .. i,
      localised_name = {"recipe-name.cube-qubit-recipe-hidden"},
      icon = icon,
      icon_size = 64,
      ingredients = {{type = "item", name = qubit, amount = 1}},
      results = {
        {type = "item", name = "cube-qubit", amount = 0},
        {type = "item", name = "cube-quantum-research-data", amount = 0},
        {type = "item", name = "cube-qubit-0", amount = 0},
        {type = "item", name = "cube-qubit-1", amount = 0},
        {type = "item", name = "cube-qubit-2", amount = 0},
        {type = "item", name = "cube-qubit-3", amount = 0},
        {type = "item", name = "cube-qubit-4", amount = 0},
        {type = "item", name = "cube-qubit-5", amount = 0},
      },
      energy_required = dummy.energy_required / 2,
      category = "cube-quantum-decoder",
      subgroup = "cube-qubits",
      order = "cube-z[" .. i .. "]",
      enabled = true,
      hide_from_player_crafting = true,
      unlock_results = false,
    },
  })
end