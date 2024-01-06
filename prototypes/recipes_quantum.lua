data:extend({
  {
    type = "item",
    name = "cube-qubit",
    icon = "__Ultracube__/assets/icons/qubit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-research-quantum",
    order = "cube-0[qubit]",
    stack_size = 10,
  },
  {
    type = "item",
    name = "cube-qubits",
    icon = "__Ultracube__/assets/icons/recipe/qubits.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-research-quantum",
    order = "cube-x[0]",
    stack_size = 1,
    flags = {"hidden"},
  },

  {
    type = "recipe",
    name = "cube-qubit",
    ingredients = {
      {"cube-sophisticated-matter-unit", 1},
      {"cube-bottled-consciousness", 1},
      {"cube-spectralite", 1},
      {"cube-deep-powder", 1},
    },
    results = {
      {"cube-qubit", 1},
      {type = "item", name = "cube-besselheim-flask", amount = 1, probability = 0.75},
    },
    main_product = "cube-qubit",
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
    icon = "__Ultracube__/assets/icons/recipe/qubits-failure.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {{"cube-qubits", 2}},
    results = {{"cube-qubit", 1}},
    energy_required = 3.2,
    main_product = "",
    category = "cube-quantum-decoder-dummy",
    subgroup = "cube-research-quantum",
    order = "cube-a[0]",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-qubits-success-dummy",
    icon = "__Ultracube__/assets/icons/recipe/qubits-success.png",
    icon_size = 128, icon_mipmaps = 5,
    ingredients = {{"cube-qubits", 2}},
    results = {{"cube-quantum-research-data", 10}},
    energy_required = 3.2,
    main_product = "",
    category = "cube-quantum-decoder-dummy",
    subgroup = "cube-research-quantum",
    order = "cube-a[1]",
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
            filename = "__Ultracube__/assets/icons/qubit-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
      subgroup = "cube-qubits",
      order = "cube-1[" .. i .. "]",
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
      type = "recipe",
      name = "cube-qubit-consume-" .. i,
      localised_name = {"recipe-name.cube-qubit-recipe-hidden"},
      icon = icon,
      icon_size = 64, icon_mipmaps = 4,
      ingredients = {{qubit, 1}},
      results = {
        {"cube-qubit", 0},
        {"cube-quantum-research-data", 0},
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