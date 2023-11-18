local productivity_module_limitation = {
  "cube-pipe",
  "cube-basic-motor-unit",
  "cube-advanced-engine",
  "cube-electronic-circuit",
  "cube-advanced-circuit",
  "cube-spectral-processor",
  "cube-concrete",
  "cube-refined-concrete",
  "cube-stone-crushing",
  "cube-rare-metal-crushing",
  "cube-deep-core-crushing",
  "cube-mash",
  "cube-stone-brick",
  "cube-glass",
  "cube-sophisticated-matter-unit",
  "cube-resplendent-plate",
  "cube-spectralite",
  "cube-conductive-wire",
  "cube-ghost-wire",
  "cube-explosives",
  "cube-battery",
  "cube-flying-robot-frame",
  "cube-haunted-energy-cell",
  "cube-intelligent-calcium",
  "cube-besselheim-flask",
  "cube-bottled-consciousness",
  "cube-bottled-euphoria",
  "cube-bottled-anguish",
  "cube-fundamental-comprehension-card",
  "cube-abstract-interrogation-card",
  "cube-deep-introspection-card",
  "cube-synthetic-premonition-card",
  "cube-unstable-gas",
  "cube-sulfuric-acid",
  "cube-elbow-grease",
  "cube-ethanol",
  -- Only _just_ OK. Will break with slightly more productivity.
  "cube-tar-processing",
  "cube-sulfur",
  -- Also a loop, but should be OK.
  "cube-deep-crystal",
  "cube-uranium-processing",
  "cube-kovarex-enrichment-process",
  "cube-qubit",
  -- Is it OK?
  "cube-resonance-cascade",
}

data:extend({
  {
    type = "module-category",
    name = "cube-replication",
    order = "0",
  },
  {
    type = "module-category",
    name = "cube-speed",
    order = "1",
  },
  {
    type = "module-category",
    name = "cube-efficiency",
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
    subgroup = "cube-module-intermediates",
    category = "cube-replication",
    tier = 1,
    order = "e[1]",
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
    name = "cube-speed-module",
    localised_description = {"item-description.cube-speed-module"},
    icon = "__base__/graphics/icons/speed-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-speed-modules",
    category = "cube-speed",
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
    name = "cube-speed-module-v2",
    localised_description = {"item-description.cube-speed-module"},
    icon = "__base__/graphics/icons/speed-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-speed-modules",
    category = "cube-speed",
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
    name = "cube-speed-module-v3",
    localised_description = {"item-description.cube-speed-module"},
    icon = "__base__/graphics/icons/speed-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-speed-modules",
    category = "cube-speed",
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
    name = "cube-efficiency-module",
    localised_description = {"item-description.cube-efficiency-module"},
    icon = "__base__/graphics/icons/effectivity-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-efficiency-modules",
    category = "cube-efficiency",
    tier = 1,
    order = "c[1]",
    stack_size = 20,
    effect = {
      consumption = {bonus = -0.2},
      pollution = {bonus = -0.2},
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
    name = "cube-efficiency-module-v2",
    localised_description = {"item-description.cube-efficiency-module"},
    icon = "__base__/graphics/icons/effectivity-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-efficiency-modules",
    category = "cube-efficiency",
    tier = 2,
    order = "c[2]",
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
    name = "cube-efficiency-module-v3",
    localised_description = {"item-description.cube-efficiency-module"},
    icon = "__base__/graphics/icons/effectivity-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "cube-efficiency-modules",
    category = "cube-efficiency",
    tier = 3,
    order = "c[3]",
    stack_size = 20,
    effect = {
      consumption = {bonus = -0.6},
      pollution = {bonus = -0.6},
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
    subgroup = "cube-productivity-modules",
    category = "cube-productivity",
    tier = 1,
    order = "d[1]",
    stack_size = 20,
    effect = {
      productivity = {bonus = 0.05},
      consumption = {bonus = 0.2},
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
    subgroup = "cube-productivity-modules",
    category = "cube-productivity",
    tier = 2,
    order = "d[2]",
    stack_size = 20,
    effect = {
      productivity = {bonus = 0.08},
      consumption = {bonus = 0.4},
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
    subgroup = "cube-productivity-modules",
    category = "cube-productivity",
    tier = 3,
    order = "d[3]",
    stack_size = 20,
    effect = {
      productivity = {bonus = 0.12},
      consumption = {bonus = 0.6},
      speed = {bonus = -0.15},
    },
    limitation = productivity_module_limitation,
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
})