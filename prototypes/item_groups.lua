data:extend({
  {
    type = "item-group",
    name = "cube-synthesis",
    order = "0",
    order_in_recipe = "0",
    icon = "__Krastorio2Assets__/technologies/matter-cube.png",
    icon_size = 256,
    icon_mipmaps = 4,
  },
  {
    type = "item-group",
    name = "cube-tools",
    order = "d",
    icons = {
      {
        icon = "__base__/graphics/technology/power-armor-mk2.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__base__/graphics/technology/module.png",
        icon_size = 256,
        icon_mipmaps = 4,
        scale = 0.8,
      },
    },
  },

  {
    type = "item-subgroup",
    name = "cube-synthesis-manual",
    group = "cube-synthesis",
    order = "0",
  },
  {
    type = "item-subgroup",
    name = "cube-synthesis-handling",
    group = "cube-synthesis",
    order = "1",
  },
  {
    type = "item-subgroup",
    name = "cube-synthesis-basics",
    group = "cube-synthesis",
    order = "a",
  },
  {
    type = "item-subgroup",
    name = "cube-synthesis-advanced",
    group = "cube-synthesis",
    order = "b",
  },
  {
    type = "item-subgroup",
    name = "cube-synthesis-ethereal",
    group = "cube-synthesis",
    order = "u",
  },
  {
    type = "item-subgroup",
    name = "cube-synthesis-sentience",
    group = "cube-synthesis",
    order = "v",
  },
  {
    type = "item-subgroup",
    name = "cube-research-singularity",
    group = "cube-synthesis",
    order = "w",
  },
  {
    type = "item-subgroup",
    name = "cube-research-quantum",
    group = "cube-synthesis",
    order = "x",
  },
  {
    type = "item-subgroup",
    name = "cube-qubits",
    group = "cube-synthesis",
    order = "y",
  },
  {
    type = "item-subgroup",
    name = "cube-synthesis-forbidden",
    group = "cube-synthesis",
    order = "z",
  },
  {
    type = "item-subgroup",
    name = "cube-basic-products",
    group = "intermediate-products",
    order = "0",
  },
  {
    type = "item-subgroup",
    name = "cube-smelting",
    group = "intermediate-products",
    order = "0",
  },
  {
    type = "item-subgroup",
    name = "cube-uranium-processing",
    group = "intermediate-products",
    order = "1",
  },
  {
    type = "item-subgroup",
    name = "cube-fuel",
    group = "intermediate-products",
    order = "2",
  },
  {
    type = "item-subgroup",
    name = "cube-processing",
    group = "intermediate-products",
    order = "3",
  },
  {
    type = "item-subgroup",
    name = "cube-processed-materials",
    group = "intermediate-products",
    order = "4",
  },
  {
    type = "item-subgroup",
    name = "cube-advanced-materials",
    group = "intermediate-products",
    order = "5",
  },
  {
    type = "item-subgroup",
    name = "cube-components",
    group = "intermediate-products",
    order = "a",
  },
  {
    type = "item-subgroup",
    name = "cube-chemical-intermediates",
    group = "intermediate-products",
    order = "c",
  },
  {
    type = "item-subgroup",
    name = "cube-uranium",
    group = "intermediate-products",
    order = "d",
  },
  {
    type = "item-subgroup",
    name = "cube-experimental",
    group = "intermediate-products",
    order = "e",
  },
  {
    type = "item-subgroup",
    name = "cube-flasks",
    group = "intermediate-products",
    order = "f",
  },
  {
    type = "item-subgroup",
    name = "cube-science",
    group = "intermediate-products",
    order = "h",
  },
  {
    type = "item-subgroup",
    name = "cube-logistics-extra",
    group = "logistics",
    order = "g-a",
  },
  {
    type = "item-subgroup",
    name = "cube-combinator-extra",
    group = "logistics",
    order = "h-a",
  },

  {
    type = "item-subgroup",
    name = "cube-repair",
    group = "cube-tools",
    order = "a"
  },
  {
    type = "item-subgroup",
    name = "cube-equipment-power",
    group = "cube-tools",
    order = "e"
  },
  {
    type = "item-subgroup",
    name = "cube-equipment",
    group = "cube-tools",
    order = "f"
  },
  {
    type = "item-subgroup",
    name = "cube-module-intermediates",
    group = "cube-tools",
    order = "w"
  },
  {
    type = "item-subgroup",
    name = "cube-speed-modules",
    group = "cube-tools",
    order = "x"
  },
  {
    type = "item-subgroup",
    name = "cube-efficiency-modules",
    group = "cube-tools",
    order = "y"
  },
  {
    type = "item-subgroup",
    name = "cube-productivity-modules",
    group = "cube-tools",
    order = "z"
  },
  {
    type = "item-subgroup",
    name = "cube-mystery",
    group = "cube-tools",
    order = "zz",
  },

  {
    type = "item-subgroup",
    name = "cube-advanced-power",
    group = "production",
    order = "c",
  },
  {
    type = "item-subgroup",
    name = "cube-processing-machines",
    group = "production",
    order = "u",
  },
  {
    type = "item-subgroup",
    name = "cube-chemical-machines",
    group = "production",
    order = "v",
  },
  {
    type = "item-subgroup",
    name = "cube-production-machines",
    group = "production",
    order = "w",
  },
  {
    type = "item-subgroup",
    name = "cube-advanced-machines",
    group = "production",
    order = "x",
  },
  {
    type = "item-subgroup",
    name = "cube-logistic-machines",
    group = "production",
    order = "y",
  },
  {
    type = "item-subgroup",
    name = "cube-final-machines",
    group = "production",
    order = "z",
  },
  {
    type = "item-subgroup",
    name = "cube-tar-furnace",
    group = "fluids",
    order = "e",
  },
  {
    type = "item-subgroup",
    name = "cube-tar-input",
    group = "fluids",
    order = "f",
  },
  {
    type = "item-subgroup",
    name = "cube-tar-output",
    group = "fluids",
    order = "g",
  },
  {
    type = "item-subgroup",
    name = "cube-distillation",
    group = "fluids",
    order = "h",
  },
  {
    type = "item-subgroup",
    name = "cube-synthesis-fluids",
    group = "fluids",
    order = "i",
  },
  {
    type = "item-subgroup",
    name = "cube-energy-fluids",
    group = "fluids",
    order = "j",
  },
  {
    type = "item-subgroup",
    name = "cube-barrel",
    group = "fluids",
    order = "v",
  },
  {
    type = "item-subgroup",
    name = "cube-fill-barrel",
    group = "fluids",
    order = "w",
  },
  {
    type = "item-subgroup",
    name = "cube-empty-barrel",
    group = "fluids",
    order = "x",
  },
  {
    type = "item-subgroup",
    name = "cube-fluid-burner",
    group = "fluids",
    order = "y",
  },
  {
    type = "item-subgroup",
    name = "cube-uncraftable",
    group = "fluids",
    order = "z",
  },
})
