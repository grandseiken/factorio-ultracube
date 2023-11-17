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
      {"cube-spectralite", 1},
      {type = "fluid", name = "cube-deep-solution", amount = 4},
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
    icon = "__Ultracube__/graphics/qubits-failure.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {{"cube-qubits", 2}},
    results = {{"cube-qubit", 1}},
    energy_required = 3.2,
    main_product = "",
    category = "cube-quantum-decoder-dummy",
    subgroup = "cube-qubits-io",
    order = "z[0]",
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-qubits-success-dummy",
    icons = {
      {
        icon = "__Ultracube__/graphics/qubits-success.png",
        icon_size = 64, icon_mipmaps = 4,
      },
      {
        icon = "__Krastorio2Assets__/icons/cards/biters-research-data.png",
        icon_size = 64, icon_mipmaps = 4,
        scale = 0.25, shift = {8, -8},
      },
    },
    ingredients = {{"cube-qubits", 2}},
    results = {{"cube-quantum-research-data", 10}},
    energy_required = 3.2,
    main_product = "",
    category = "cube-quantum-decoder-dummy",
    subgroup = "cube-qubits-io",
    order = "z[0]",
    enabled = false,
  },

  {
    type = "recipe-category",
    name = "cube-quantum-decoder",
    order = "zz",
  },
  {
    type = "recipe-category",
    name = "cube-quantum-decoder-dummy",
    order = "zz",
  },
})

local dummy = data.raw.recipe["cube-qubits-success-dummy"]

for i = 0, 5 do
  local qubit = "cube-qubit-" .. i
  local qubit_next = "cube-qubit-" .. ((1 + i) % 6)
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
      energy_required = data.raw.recipe["cube-qubits-success-dummy"].energy_required / 2,
      category = "cube-quantum-decoder",
      subgroup = "cube-qubits",
      order = "z[" .. i .. "]",
      enabled = true,
      hide_from_player_crafting = true,
    },
  })
end