local productivity_module_limitation = {
  "cube-basic-motor-unit",
  "cube-advanced-engine",
  "cube-electronic-circuit",
  "cube-advanced-circuit",
  "cube-spectral-processor",
  -- TODO!
}

data:extend({
  {
    type = "module-category",
    name = "cube-replication",
    order = "0",
  },
  {
    type = "module-category",
    name = "cube-compression",
    order = "1",
  },
  {
    type = "module-category",
    name = "cube-inductance",
    order = "2",
  },
  {
    type = "module-category",
    name = "cube-productivity",
    order = "3",
  },

  {
    type = "item",
    name = "cube-modular-casing",
    icon = "__Ultracube__/graphics/modular-casing.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-module-intermediates",
    order = "a[modular-casing]",
    stack_size = 20,
  },
  {
    type = "item",
    name = "cube-burnt-out-modular-casing",
    icon = "__Ultracube__/graphics/burnt-out-modular-casing.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-module-intermediates",
    order = "b[burnt-out-modular-casing]",
    stack_size = 20,
  },

  {
    -- TODO: module effect breaks the output full thing even more, since
    -- cube can't even be removed / second craft cannot continue until
    -- the machine is completely full.
    type = "module",
    name = "cube-replication-module",
    localised_description = {"item-description.cube-replication-module"},
    icon = "__base__/graphics/icons/productivity-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-modules",
    category = "cube-replication",
    tier = 1,
    order = "a[1]",
    stack_size = 20,
    effect =
    {
      productivity = {bonus = 0.25},
      consumption = {bonus = 0.5},
    },
    flags = {"hidden"},  -- Until we work out how to make it work.
  },

  {
    type = "module",
    name = "cube-compression-module",
    localised_description = {"item-description.cube-compression-module"},
    icon = "__base__/graphics/icons/speed-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-modules",
    category = "cube-compression",
    tier = 1,
    order = "b[1]",
    stack_size = 20,
    effect = {
      speed = {bonus = 0.2},
      consumption = {bonus = 0.2},
    },
    beacon_tint = {
      primary = {r = 0.441, g = 0.714, b = 1.000, a = 1.000}, -- #70b6ffff
      secondary = {r = 0.388, g = 0.976, b = 1.000, a = 1.000}, -- #63f8ffff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
  },
  {
    type = "module",
    name = "cube-compression-module-v2",
    localised_description = {"item-description.cube-compression-module"},
    icon = "__base__/graphics/icons/speed-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-modules",
    category = "cube-compression",
    tier = 2,
    order = "b[2]",
    stack_size = 20,
    effect = {
      speed = {bonus = 0.35},
      consumption = {bonus = 0.35},
    },
    beacon_tint = {
      primary = {r = 0.441, g = 0.714, b = 1.000, a = 1.000}, -- #70b6ffff
      secondary = {r = 0.388, g = 0.976, b = 1.000, a = 1.000}, -- #63f8ffff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
  },
  {
    type = "module",
    name = "cube-compression-module-v3",
    localised_description = {"item-description.cube-compression-module"},
    icon = "__base__/graphics/icons/speed-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-modules",
    category = "cube-compression",
    tier = 3,
    order = "b[3]",
    stack_size = 20,
    effect = {
      speed = {bonus = 0.5},
      consumption = {bonus = 0.5},
    },
    beacon_tint = {
      primary = {r = 0.441, g = 0.714, b = 1.000, a = 1.000}, -- #70b6ffff
      secondary = {r = 0.388, g = 0.976, b = 1.000, a = 1.000}, -- #63f8ffff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
  },

  {
    type = "module",
    name = "cube-inductance-module",
    localised_description = {"item-description.cube-inductance-module"},
    icon = "__base__/graphics/icons/effectivity-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-modules",
    category = "cube-inductance",
    tier = 1,
    order = "c[1]",
    stack_size = 20,
    effect = {
      consumption = {bonus = -0.15},
      pollution = {bonus = -0.15},
    },
    beacon_tint = {
      primary = {0, 1, 0},
      secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
  },
  {
    type = "module",
    name = "cube-inductance-module-v2",
    localised_description = {"item-description.cube-inductance-module"},
    icon = "__base__/graphics/icons/effectivity-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-modules",
    category = "cube-inductance",
    tier = 2,
    order = "c[2]",
    stack_size = 20,
    effect = {
      consumption = {bonus = -0.25},
      pollution = {bonus = -0.25},
    },
    beacon_tint = {
      primary = {0, 1, 0},
      secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
  },
  {
    type = "module",
    name = "cube-inductance-module-v3",
    localised_description = {"item-description.cube-inductance-module"},
    icon = "__base__/graphics/icons/effectivity-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-modules",
    category = "cube-inductance",
    tier = 3,
    order = "c[3]",
    stack_size = 20,
    effect = {
      consumption = {bonus = -0.4},
      pollution = {bonus = -0.4},
    },
    beacon_tint = {
      primary = {0, 1, 0},
      secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
  },

  {
    type = "module",
    name = "cube-productivity-module",
    localised_description = {"item-description.cube-productivity-module"},
    icon = "__base__/graphics/icons/productivity-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-modules",
    category = "cube-productivity",
    tier = 1,
    order = "d[1]",
    stack_size = 20,
    effect = {
      productivity = {bonus = 0.05},
      consumption = {bonus = 0.25},
      speed = {bonus = -0.05},
    },
    limitation = productivity_module_limitation,
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "cube-productivity-module-v2",
    localised_description = {"item-description.cube-productivity-module"},
    icon = "__base__/graphics/icons/productivity-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-modules",
    category = "cube-productivity",
    tier = 2,
    order = "d[2]",
    stack_size = 20,
    effect = {
      productivity = {bonus = 0.075},
      consumption = {bonus = 0.5},
      speed = {bonus = -0.1},
    },
    limitation = productivity_module_limitation,
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "cube-productivity-module-v3",
    localised_description = {"item-description.cube-productivity-module"},
    icon = "__base__/graphics/icons/productivity-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-modules",
    category = "cube-productivity",
    tier = 3,
    order = "d[3]",
    stack_size = 20,
    effect = {
      productivity = {bonus = 0.125},
      consumption = {bonus = 0.75},
      speed = {bonus = -0.15},
    },
    limitation = productivity_module_limitation,
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
})