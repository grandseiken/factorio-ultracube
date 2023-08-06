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
      speed = {bonus = 0.25},
      consumption = {bonus = 0.25},
    },
    beacon_tint =
    {
      primary = {r = 0.441, g = 0.714, b = 1.000, a = 1.000}, -- #70b6ffff
      secondary = {r = 0.388, g = 0.976, b = 1.000, a = 1.000}, -- #63f8ffff
    },
    flags = {"hidden"},  -- Until we work out how to make it work.
    art_style = "vanilla",
    requires_beacon_alt_mode = false
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
      consumption = {bonus = -0.2},
      pollution = {bonus = -0.2},
    },
    beacon_tint =
    {
      primary = { 0, 1, 0 },
      secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
})