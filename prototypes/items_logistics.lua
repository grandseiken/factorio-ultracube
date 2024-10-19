data:extend({
  {
    type = "item",
    name = "filter-inserter",
    icon = "__Ultracube__/assets/icons/filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "inserter",
    order = "e[filter-inserter]",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    place_result = "filter-inserter",
    stack_size = 50,
  },
  {
    type = "item",
    name = "bulk-filter-inserter",
    icon = "__Ultracube__/assets/icons/bulk-filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "inserter",
    order = "g[bulk-filter-inserter]",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    place_result = "bulk-filter-inserter",
    stack_size = 50,
  },
  {
    type = "item",
    name = "cube-medium-container",
    icon = "__Krastorio2Assets__/icons/entities/medium-container.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "storage",
    order = "cube-a[items]-w[medium-chest]",
    place_result = "cube-medium-container",
    stack_size = 20,
  },
  {
    type = "item",
    name = "cube-big-container",
    icon = "__Krastorio2Assets__/icons/entities/big-container.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "storage",
    order = "cube-a[items]-x[big-chest]",
    place_result = "cube-big-container",
    stack_size = 10,
  },
  {
    type = "item",
    name = "cube-fluid-storage-1",
    icon = "__Krastorio2Assets__/icons/entities/fluid-storage-1.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "storage",
    order = "cube-z[tanks]-y[medium]",
    place_result = "cube-fluid-storage-1",
    stack_size = 20,
  },
  {
    type = "item",
    name = "cube-fluid-storage-2",
    icon = "__Krastorio2Assets__/icons/entities/fluid-storage-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "storage",
    order = "cube-z[tanks]-z[big]",
    place_result = "cube-fluid-storage-2",
    stack_size = 10,
  },

  {
    type = "item",
    name = "cube-v4-transport-belt",
    icon = "__Krastorio2Assets__/icons/entities/transport-belts/superior-transport-belt/superior-transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "cube-a[transport-belt]-d[v4-transport-belt]",
    place_result = "cube-v4-transport-belt",
    stack_size = 100,
  },
  {
    type = "item",
    name = "cube-v4-underground-belt",
    icon = "__Krastorio2Assets__/icons/entities/transport-belts/superior-transport-belt/superior-underground-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "cube-b[underground-belt]-d[v4-underground-belt]",
    place_result = "cube-v4-underground-belt",
    stack_size = 50,
  },
  {
    type = "item",
    name = "cube-v4-splitter",
    icon = "__Krastorio2Assets__/icons/entities/transport-belts/superior-transport-belt/superior-splitter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "cube-c[splitter]-d[v4-splitter]",
    place_result = "cube-v4-splitter",
    stack_size = 50,
  },
  {
    type = "item",
    name = "cube-extremely-long-inserter",
    icon = "__Ultracube__/assets/icons/extremely-long-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "inserter",
    order = "cube-x[extremely-long-inserter]",
    place_result = "cube-extremely-long-inserter",
    stack_size = 50,
  },

  {
    type = "item",
    name = "cube-logistic-robot-0",
    icon = "__base__/graphics/icons/logistic-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "cube-a[robot]-a[logistic-robot-0]",
    place_result = "cube-logistic-robot-0",
    stack_size = 50,
  },
  {
    type = "item",
    name = "cube-logistic-robot-1",
    icon = "__base__/graphics/icons/logistic-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "cube-a[robot]-a[logistic-robot-1]",
    place_result = "cube-logistic-robot-1",
    stack_size = 50,
  },
})