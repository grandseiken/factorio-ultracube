data:extend({
  {
    type = "item",
    name = "cube-qubit",
    icon = "__Ultracube__/graphics/qubit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-qubits-io",
    order = "0",
    stack_size = 10,
  },
  {
    type = "item",
    name = "cube-qubits",
    icon = "__Ultracube__/graphics/qubits.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-qubits-io",
    order = "x[0]",
    stack_size = 1,
    flags = {"hidden"},
  },

  {
    type = "recipe",
    name = "cube-qubit",
    ingredients = {
      {"cube-sophisticated-matter-unit", 1},
      {"cube-bottled-consciousness", 1},
      {"cube-spectralite", 2},
      {type = "fluid", name = "cube-deep-solution", amount = 10},
    },
    results = {{"cube-qubit", 1}},
    energy_required = 4,
    category = "cube-fabricator",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-qubit-init",
    ingredients = {{"cube-qubit", 1}},
    results = {{"cube-qubit-0", 1}},
    energy_required = 1,
    category = "cube-particle-phase-aligner",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-qubits-failure-dummy",
    icon = "__Ultracube__/graphics/qubits-failure.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {{"cube-qubits", 2}},
    results = {{"cube-qubit", 1}},
    energy_required = 1,
    main_product = "",
    category = "cube-quantum-decoder",
    subgroup = "cube-qubits-io",
    order = "z[0]",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-qubits-success-dummy",
    icon = "__Ultracube__/graphics/qubits-success.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {{"cube-qubits", 2}},
    results = {{"cube-quantum-research-data", 10}},
    energy_required = 1,
    main_product = "",
    category = "cube-quantum-decoder",
    subgroup = "cube-qubits-io",
    order = "z[0]",
    enabled = false,
  },
  {
    type = "recipe-category",
    name = "cube-qubit-step",
    order = "zz",
  },
})

local failure_dummy = data.raw.recipe["cube-qubits-failure-dummy"]
local success_dummy = data.raw.recipe["cube-qubits-success-dummy"]

for i = 0, 5 do
  local qubit = "cube-qubit-" .. i
  local qubit_next = "cube-qubit-" .. ((1 + i) % 6)
  local step_recipe = "cube-qubit-step-" .. i
  local failure_recipe = "cube-qubit-failure-" .. i
  local success_recipe = "cube-qubit-success-" .. i
  local icon = "__Ultracube__/graphics/qubit-" .. i .. ".png"

  data:extend({
    {
      type = "item",
      name = qubit,
      icon = icon,
      icon_size = 64, icon_mipmaps = 4,
      pictures = {
        layers = {
          {
            size = 64,
            filename = icon,
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = {"light"},
            size = 64,
            filename = "__Ultracube__/graphics/qubit-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
      subgroup = "cube-qubits",
      order = "1[" .. i .. "]",
      stack_size = 10,
    },
    {
      type = "recipe",
      name = "cube-qubit-next-" .. ((i + 1) % 6),
      ingredients = {{qubit, 1}},
      results = {{qubit_next, 1}},
      energy_required = 1,
      category = "cube-particle-phase-aligner",
      enabled = false,
    },

    {
      type = "recipe-category",
      name = failure_recipe,
      order = "zz",
    },
    {
      type = "recipe-category",
      name = success_recipe,
      order = "zz",
    },

    {
      type = "recipe",
      name = step_recipe,
      localised_name = {"recipe-name", {"recipe-name.cube-qubit-recipe-hidden"}},
      icon = icon,
      icon_size = 64, icon_mipmaps = 4,
      ingredients = {{qubit, 1}},
      results = {},
      energy_required = 1,
      category = "cube-qubit-step",
      subgroup = "cube-qubits",
      order = "z[" .. i .. "]",
      enabled = true,
      hidden = true,
      hide_from_player_crafting = true,
    },
    {
      type = "recipe",
      name = failure_recipe,
      localised_name = {"recipe-name", {"recipe-name.cube-qubit-recipe-hidden"}},
      icon = icon,
      icon_size = 64, icon_mipmaps = 4,
      ingredients = {{qubit, 1}},
      results = failure_dummy.results,
      energy_required = failure_dummy.energy_required,
      category = failure_recipe,
      subgroup = "cube-qubits",
      order = "z[" .. i .. "]",
      enabled = true,
      hidden = true,
      hide_from_player_crafting = true,
    },
    {
      type = "recipe",
      name = success_recipe,
      localised_name = {"recipe-name", {"recipe-name.cube-qubit-recipe-hidden"}},
      icon = icon,
      icon_size = 64, icon_mipmaps = 4,
      ingredients = {{qubit, 1}},
      results = success_dummy.results,
      energy_required = success_dummy.energy_required,
      category = success_recipe,
      subgroup = "cube-qubits",
      order = "z[" .. i .. "]",
      enabled = true,
      hidden = true,
      hide_from_player_crafting = true,
    },
  })
end