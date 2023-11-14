require("prototypes.lib.tech_costs")

data:extend({
  {
    type = "technology",
    name = "cube-landfill",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/landfill.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-landfill"},
    },
    prerequisites = {"cube-abstract-interrogation-card"},
    unit = tech_cost_unit("2", 180),
    order = "2-0-0",
  },
  {
    type = "technology",
    name = "cube-explosives",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/explosives.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-explosives"},
    },
    prerequisites = {
      "cube-distillation",
      "cube-sulfur-processing",
    },
    unit = tech_cost_unit("2", 180),
    order = "2-0-1",
  },
  {
    type = "technology",
    name = "cube-cliff-explosives",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/cliff-explosives.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-cliff-explosives"},
    },
    prerequisites = {"cube-explosives"},
    unit = tech_cost_unit("2", 240),
    order = "2-0-2",
  },
  {
    type = "technology",
    name = "cube-tar-reclamation",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/recycling.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/tar.png",
        shift = {0, -40},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/fluids/heavy-oil.png",
        shift = {-0.866 * 40, 20},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/fluids/light-oil.png",
        shift = {0.866 * 40, 20},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-heavy-tar-reclamation"},
      {type = "unlock-recipe", recipe = "cube-light-tar-reclamation"},
    },
    prerequisites = {"cube-abstract-interrogation-card"},
    unit = tech_cost_unit("2", 180),
    order = "2-0-3",
  },
  {
    type = "technology",
    name = "cube-electric-energy-accumulators",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electric-energy-acumulators.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-accumulator"},
    },
    prerequisites = {
      "cube-electric-energy-distribution-1",
      "cube-battery",
    },
    unit = tech_cost_unit("2", 180),
    order = "2-0-4",
  },
  {
    type = "technology",
    name = "cube-express-logistics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/logistics-3.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-transport-belt-2"},
      {type = "unlock-recipe", recipe = "cube-underground-belt-2"},
      {type = "unlock-recipe", recipe = "cube-splitter-2"},
    },
    prerequisites = {
      "cube-abstract-interrogation-card",
      "cube-logistics",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-0-5",
  },
  {
    type = "technology",
    name = "cube-sophisticated-matter-unit",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Ultracube__/graphics/sophisticated-matter-unit.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-sophisticated-matter-unit"},
    },
    prerequisites = {"cube-abstract-interrogation-card"},
    unit = tech_cost_unit("2", 180),
    order = "2-1-0",
  },
  {
    type = "technology",
    name = "cube-electric-energy-distribution-2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-substation"},
    },
    prerequisites = {
      "cube-electric-energy-accumulators",
      "cube-sophisticated-matter-unit",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-1-1",
  },
  {
    type = "technology",
    name = "cube-radar",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-radar.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-radar"},
    },
    prerequisites = {"cube-sophisticated-matter-unit"},
    unit = tech_cost_unit("2", 120),
    order = "2-1-2",
  },
  {
    type = "technology",
    name = "cube-roboport",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-roboports.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-roboport"},
      {type = "unlock-recipe", recipe = "cube-logistic-chest-passive-provider"},
      {type = "unlock-recipe", recipe = "cube-logistic-chest-storage"},
    },
    prerequisites = {
      "cube-radar",
      "cube-robotics",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-1-3",
  },
  {
    type = "technology",
    name = "cube-containers",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/containers.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-medium-container"},
      {type = "unlock-recipe", recipe = "cube-big-container"},
    },
    prerequisites = {
      "cube-sophisticated-matter-unit",
    },
    unit = tech_cost_unit("2", 180),
    order = "2-1-4",
  },
  {
    type = "technology",
    name = "cube-fluid-storage",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/steel-fluid-tanks.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-fluid-storage-1"},
      {type = "unlock-recipe", recipe = "cube-fluid-storage-2"},
    },
    prerequisites = {"cube-sophisticated-matter-unit"},
    unit = tech_cost_unit("2", 240),
    order = "2-1-5",
  },
  {
    type = "technology",
    name = "cube-deep-core-ultradrill",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/quarry-drill.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-deep-core-ultradrill"},
      {type = "unlock-recipe", recipe = "cube-deep-core-crushing"},
    },
    prerequisites = {
      "cube-sophisticated-matter-unit",
      "cube-concrete",
    },
    unit = tech_cost_unit("2", 300),
    order = "2-1-6",
  },
  {
    type = "technology",
    name = "cube-transitive-ultralocomotion",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/matter-cube.png",
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/braking-force.png",
      },
    },
    effects = {
      {
        type = "nothing",
        icons = {
          {
            icon = "__base__/graphics/icons/locomotive.png",
            icon_size = 64, icon_mipmaps = 4,
          },
          {
            icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-blueprint.png",
            icon_size = 64, icon_mipmaps = 2,
          }
        },
        effect_description = {"effect-description.cube-transitive-ultralocomotion"},
      },
    },
    prerequisites = {
      "cube-abstract-interrogation-card",
      "cube-railway",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-1-7",
  },
  {
    type = "technology",
    name = "cube-modular-casing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Ultracube__/graphics/modular-casing-technology.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-modular-casing"},
    },
    prerequisites = {"cube-sophisticated-matter-unit"},
    unit = tech_cost_unit("2", 180),
    order = "2-1-8",
  },
  {
    type = "technology",
    name = "cube-explosive-smelting",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/advanced-furnace.png",
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/explosives.png",
        scale = 0.625,
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-explosive-rare-metals"},
    },
    prerequisites = {"cube-explosives"},
    unit = tech_cost_unit("2", 240),
    order = "2-2-0",
  },
  {
    type = "technology",
    name = "cube-improved-tar-processing",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/advanced-furnace.png",
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/matter-coal.png",
        scale = 0.625,
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-improved-gelatinous-tar"},
    },
    prerequisites = {"cube-deep-core-ultradrill"},
    unit = tech_cost_unit("2", 240),
    order = "2-2-1",
  },
  {
    type = "technology",
    name = "cube-dimension-folding-engine",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/antimatter-reactor.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-dimension-folding-engine"},
      {type = "unlock-recipe", recipe = "cube-phantom-ultradense-constituent"},
      {type = "unlock-recipe", recipe = "cube-ultradense-utility-cube-phantom"},
      {type = "unlock-recipe", recipe = "cube-phantom-constituent-recharge"},
      {type = "unlock-recipe", recipe = "cube-basic-matter-unit-phantom"},
      {type = "unlock-recipe", recipe = "cube-ghost-crystal"},
      {type = "unlock-recipe", recipe = "cube-phantom-cube-manual-discharge"},
      {type = "unlock-recipe", recipe = "cube-phantom-cube-manual-reassembly"},
    },
    prerequisites = {
      "cube-sophisticated-matter-unit",
      "cube-concrete",
    },
    unit = tech_cost_unit("2", 300),
    order = "2-2-2",
  },
  {
    type = "technology",
    name = "cube-distillation",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Ultracube__/graphics/distillation.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-distillery"},
      {type = "unlock-recipe", recipe = "cube-greenhouse-potato"},
      {type = "unlock-recipe", recipe = "cube-mash"},
      {type = "unlock-recipe", recipe = "cube-ethanol"},
    },
    prerequisites = {"cube-abstract-interrogation-card"},
    unit = tech_cost_unit("2", 180),
    order = "2-3-0",
  },
  {
    type = "technology",
    name = "cube-emotional-decomposition",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/backgrounds/matter.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/joy.png",
        shift = {-24, 0},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/despair.png",
        shift = {24, 0},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-emotional-decomposition"},
      {type = "unlock-recipe", recipe = "cube-bottled-euphoria"},
      {type = "unlock-recipe", recipe = "cube-bottled-anguish"},
      {type = "unlock-recipe", recipe = "cube-euphoric-release"},
    },
    prerequisites = {"cube-distillation"},
    unit = tech_cost_unit("2", 240),
    order = "2-3-1",
  },
  {
    type = "technology",
    name = "cube-logistic-robotics",
    icon = "__base__/graphics/technology/logistic-robotics.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-logistic-robot"},
      {type = "character-logistic-requests", modifier = true},
      {type = "character-logistic-trash-slots", modifier = 30},
    },
    prerequisites = {
      "cube-robotics",
      "cube-emotional-decomposition",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-3-2",
  },
  {
    type = "technology",
    name = "cube-resplendent-plate",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/imersium-processing.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-resplendent-plate"},
    },
    prerequisites = {"cube-deep-core-ultradrill"},
    unit = tech_cost_unit("2", 240),
    order = "2-4-0",
  },
  {
    type = "technology",
    name = "cube-solar-panel-equipment-mk2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-solar-panel.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-solar-panel-equipment-mk2"},
    },
    prerequisites = {"cube-resplendent-plate", "cube-modular-armor"},
    unit = tech_cost_unit("2", 240),
    order = "2-4-1",
  },
  {
    type = "technology",
    name = "cube-electric-mining-drill-mk2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/electric-mining-drill-mk3.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-electric-mining-drill-mk2"},
    },
    prerequisites = {"cube-resplendent-plate"},
    unit = tech_cost_unit("2", 240),
    order = "2-4-2",
  },
  {
    type = "technology",
    name = "cube-deep-crystallization",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/matter-minerals.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-deep-solution"},
      {type = "unlock-recipe", recipe = "cube-deep-powder-separation"},
      {type = "unlock-recipe", recipe = "cube-deep-crystal"},
    },
    prerequisites = {"cube-deep-core-ultradrill"},
    unit = tech_cost_unit("2", 240),
    order = "2-4-3",
  },
  {
    type = "technology",
    name = "cube-deep-crystal-distillation",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/matter-minerals.png",
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/recycling.png",
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-deep-crystal-distillation"},
    },
    prerequisites = {
      "cube-deep-crystallization",
      "cube-distillation",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-4-4",
  },
  {
    type = "technology",
    name = "cube-deep-fuel-refining",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/fuel-refinery.png",
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/matter-minerals.png",
        scale = 0.625,
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-deeply-condensed-fuel"},
    },
    prerequisites = {
      "cube-fuel-refinery",
      "cube-deep-core-ultradrill",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-4-5",
  },
  {
    type = "technology",
    name = "cube-phantom-components",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/phantom-cube-technology.png",
        tint = {r = 1, g = 1, b = 1, a = 0.0},
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/military-tech-card.png",
        scale = 0.65,
        shift = {-32, -32},
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/automation-core.png",
        scale = 0.65,
        shift = {32, 32},
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/phantom-cube-technology.png",
        tint = {r = 1, g = 1, b = 1, a = 0.5},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-phantom-components"},
    },
    prerequisites = {"cube-dimension-folding-engine"},
    unit = tech_cost_unit("2", 240),
    order = "2-4-6",
  },
  {
    type = "technology",
    name = "cube-phantom-electronics",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/silicon-processing.png",
        tint = {r = 1, g = 1, b = 1, a = 0.5},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-spectralite"},
      {type = "unlock-recipe", recipe = "cube-ghost-wire"},
    },
    prerequisites = {"cube-dimension-folding-engine"},
    unit = tech_cost_unit("2", 240),
    order = "2-4-7",
  },
  {
    type = "technology",
    name = "cube-phantom-emotion",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/phantom-cube-technology.png",
        tint = {r = 1, g = 1, b = 1, a = 0.0},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/bottled-euphoria.png",
        shift = {-32, 0},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/bottled-anguish.png",
        shift = {32, 0},
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/phantom-cube-technology.png",
        tint = {r = 1, g = 1, b = 1, a = 0.5},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-phantom-constituent-recharge-euphoria"},
      {type = "unlock-recipe", recipe = "cube-ectoplasm"},
    },
    prerequisites = {
      "cube-dimension-folding-engine",
      "cube-emotional-decomposition",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-4-8",
  },
  {
    type = "technology",
    name = "cube-spectral-processor",
    icons = {{
      icon = "__base__/graphics/technology/advanced-electronics-2.png",
      icon_size = 256, icon_mipmaps = 4,
      tint = {r = 1, g = 1, b = 1, a = 0.75},
    }},
    effects = {
      {type = "unlock-recipe", recipe = "cube-spectral-processor"},
    },
    prerequisites = {"cube-phantom-electronics"},
    unit = tech_cost_unit("2", 240),
    order = "2-5-0",
  },
  {
    type = "technology",
    name = "cube-haunted-energy-cell",
    icon = "__Ultracube__/graphics/haunted-energy-cell-technology.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-haunted-energy-cell"},
    },
    prerequisites = {
      "cube-phantom-emotion",
      "cube-battery",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-5-1",
  },
  {
    type = "technology",
    name = "cube-residual-tendrils",
    icons = {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/technologies/antimatter-reactor.png",
        tint = {r=1, g=1, b=1, a=0.625},
      },
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/recycling.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/items-with-variations/biomass/biomass.png",
        shift = {0, -40},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/items-with-variations/biomass/biomass-1.png",
        shift = {-0.866 * 40, 20},
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/items-with-variations/biomass/biomass-2.png",
        shift = {0.866 * 40, 20},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-residual-tendrils"},
    },
    prerequisites = {"cube-haunted-energy-cell"},
    unit = tech_cost_unit("2", 240),
    order = "2-5-2",
  },
  {
    type = "technology",
    name = "cube-stygian-energy-lab",
    icon = "__Krastorio2Assets__/technologies/bio-lab.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-stygian-energy-lab"},
      {type = "unlock-recipe", recipe = "cube-heavy-turbine"},
    },
    prerequisites = {
      "cube-haunted-energy-cell",
      "cube-phantom-electronics",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-5-3",
  },
  {
    type = "technology",
    name = "cube-battery-mk2-equipment",
    icon = "__Ultracube__/graphics/battery-mk2-equipment-technology.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-battery-mk2-equipment"},
    },
    prerequisites = {"cube-haunted-energy-cell"},
    unit = tech_cost_unit("2", 180),
    order = "2-5-4",
  },
  {
    type = "technology",
    name = "cube-power-armor",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/power-armor.png"),
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-power-armor"},
    },
    prerequisites = {
      "cube-modular-armor",
      "cube-resplendent-plate",
      "cube-spectral-processor",
    },
    unit = tech_cost_unit("2", 300),
    order = "2-5-5",
  },
  {
    type = "technology",
    name = "cube-loader",
    icons = {
      {
        icon = "__aai-loaders__/graphics/technology/loader-tech-icon.png",
        icon_size = 256,
      },
      {
        icon = "__aai-loaders__/graphics/technology/loader-tech-icon_mask.png",
        icon_size = 256,
        tint = {255, 24, 38},
      },
    },
    effects = {
      {type = "unlock-recipe", recipe = "cube-v2-loader"},
    },
    prerequisites = {
      "cube-logistics",
      "cube-phantom-electronics",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-5-6",
  },
  {
    type = "technology",
    name = "cube-extremely-long-inserter",
    icon = "__Ultracube__/graphics/extremely-long-inserter-technology.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-extremely-long-inserter"},
    },
    prerequisites = {
      "cube-resplendent-plate",
      "cube-inserters",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-5-7",
  },
  {
    type = "technology",
    name = "cube-speed-module",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/speed-module-1.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-speed-module"},
    },
    prerequisites = {
      "cube-modular-casing",
      "cube-deep-core-ultradrill",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-6-0",
  },
  {
    type = "technology",
    name = "cube-efficiency-module",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/effectivity-module-1.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-efficiency-module"},
    },
    prerequisites = {
      "cube-modular-casing",
      "cube-phantom-electronics",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-6-1",
  },
  {
    type = "technology",
    name = "cube-productivity-module",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/productivity-module-1.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-productivity-module"},
    },
    prerequisites = {"cube-modular-casing"},
    unit = tech_cost_unit("2", 240),
    order = "2-6-2",
  },
  {
    type = "technology",
    name = "cube-exoskeleton-equipment",
    icon_size = 256, icon_mipmaps = 4,
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/exoskeleton-equipment.png"),
    effects = {
      {type = "unlock-recipe", recipe = "cube-exoskeleton-equipment"},
    },
    prerequisites = {"cube-speed-module"},
    unit = tech_cost_unit("2", 240),
    order = "2-6-3",
  },
  {
    type = "technology",
    name = "cube-uranium-processing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/uranium-processing.png",
    effects =
    {
      {type = "unlock-recipe", recipe = "cube-centrifuge"},
      {type = "unlock-recipe", recipe = "cube-uranium-processing"},
      {type = "unlock-recipe", recipe = "cube-uranium-fuel-cell"},
    },
    prerequisites = {
      "cube-electric-mining-drill-mk2",
      "cube-concrete",
    },
    unit = tech_cost_unit("2", 240),
    order = "2-7-0",
  },
  {
    type = "technology",
    name = "cube-nuclear-power",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/nuclear-power.png",
    effects =
    {
      {type = "unlock-recipe", recipe = "cube-nuclear-reactor"},
      {type = "unlock-recipe", recipe = "cube-heat-exchanger"},
      {type = "unlock-recipe", recipe = "cube-heat-pipe"},
      {type = "unlock-recipe", recipe = "cube-heavy-turbine"},
      -- {type = "unlock-recipe", recipe = "nuclear-fuel-reprocessing"},
    },
    prerequisites = {"cube-uranium-processing"},
    unit = tech_cost_unit("2", 240),
    order = "2-7-1",
  },
  {
    type = "technology",
    name = "cube-deep-introspection-card",
    icon = "__Krastorio2Assets__/technologies/singularity-tech-card.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-deep-introspection-card"},
      tech_unlock_effect(),
    },
    prerequisites = {
      "cube-resplendent-plate",
      "cube-deep-crystallization",
      "cube-explosives",
    },
    unit = tech_cost_unit("2", 300),
    order = "2-9-0",
  },
  {
    type = "technology",
    name = "cube-synthetic-premonition-card",
    icon = "__Krastorio2Assets__/technologies/optimization-tech-card.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {type = "unlock-recipe", recipe = "cube-synthetic-premonition-card"},
      tech_unlock_effect(),
    },
    prerequisites = {
      "cube-spectral-processor",
      "cube-haunted-energy-cell",
    },
    unit = tech_cost_unit("2", 300),
    order = "2-9-1",
  },
})
