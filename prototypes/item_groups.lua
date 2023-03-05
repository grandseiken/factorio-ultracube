data:extend({
  {
    type = "item-group",
    name = "cube-intermediates",
    order = "0",
    order_in_recipe = "0",
    icon = "__base__/graphics/item-group/intermediate-products.png",
    icon_size = 128,
    icon_mipmaps = 2,
  },
  {
    type = "item-subgroup",
    name = "cube-cubes",
    group = "cube-intermediates",
    order = "0",
  },
  {
    type = "item-subgroup",
    name = "cube-basics",
    group = "cube-intermediates",
    order = "a",
  },
  {
    type = "item-subgroup",
    name = "cube-knowledge",
    group = "cube-intermediates",
    order = "x",
  },
  {
    type = "item-subgroup",
    name = "cube-processing",
    group = "cube-intermediates",
    order = "z",
  },

  {
    type = "item-subgroup",
    name = "cube-production-machines",
    group = "production",
    order = "z",
  },
})
