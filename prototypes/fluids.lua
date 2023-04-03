data:extend({
  {
    type = "fluid",
    name = "cube-gelatinous-tar",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.1, g=0.1, b=0.15},
    flow_color = {r=0.15, g=0.15, b=0.20},
    icon = "__Hypercube__/graphics/tar.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "a[fluid]-b[tar]",
  },
  {
    type = "fluid",
    name = "cube-matter-replication-gel",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.8, g=0.8, b=0.8},
    flow_color = {r=0.9, g=0.9, b=0.9},
    icon = "__Krastorio2Assets__/icons/fluids/hydrogen.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "a[fluid]-c[gel]"
  },
  {
    type = "fluid",
    name = "cube-cerebral-substrate",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.15, g=0.8, b=0.8},
    flow_color = {r=0.2, g=0.9, b=0.9},
    icon = "__Krastorio2Assets__/icons/fluids/matter.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "a[fluid]-d[grey]"
  },
  {
    type = "fluid",
    name = "cube-joy",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.85, g=0.1, b=0.4},
    flow_color = {r=0.95, g=0.15, b=0.5},
    icon = "__Hypercube__/graphics/joy.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "a[fluid]-e[joy]"
  },
  {
    type = "fluid",
    name = "cube-anguish",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.35, g=0.15, b=0.7},
    flow_color = {r=0.4, g=0.2, b=0.75},
    icon = "__Hypercube__/graphics/anguish.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "a[fluid]-e[anguish]"
  },
})
