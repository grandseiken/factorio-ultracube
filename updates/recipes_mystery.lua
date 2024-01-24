-- SPOILERS BELOW. --
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
---------------------
local function add_mystery_dummy(name, item)
  data:extend({
    {
      type = "recipe",
      name = name,
      icon = "__base__/graphics/icons/steel-furnace.png",
      icon_size = 64, icon_mipmaps = 4,
      localised_name = {"recipe-name.cube-mystery"},
      ingredients = {},
      results = {{item, 1}},
      energy_required = 1,
      category = "cube-mystery-furnace",
      subgroup = "cube-mystery",
      enabled = false,
      hidden = true,
      hide_from_player_crafting = true,
      unlock_results = true,
    }
  })
end

add_mystery_dummy("cube-mystery-furnace-dummy-0", "cube-power-armor-mk2")
add_mystery_dummy("cube-mystery-furnace-dummy-1", "cube-spoiled-potato")
add_mystery_dummy("cube-mystery-furnace-dummy-2", "transport-belt")
add_mystery_dummy("cube-mystery-furnace-dummy-3", "underground-belt")
add_mystery_dummy("cube-mystery-furnace-dummy-4", "splitter")
add_mystery_dummy("cube-mystery-furnace-dummy-5", "aai-loader")
add_mystery_dummy("cube-mystery-furnace-dummy-6", "inserter")
add_mystery_dummy("cube-mystery-furnace-dummy-7", "small-electric-pole")

add_mystery_recipe(4, "cube-ultradense-utility-cube", "cube-dormant-utility-cube")
add_mystery_recipe(4, "cube-dormant-utility-cube", "cube-dormant-utility-cube")
add_mystery_recipe(4, "cube-phantom-ultradense-constituent", "cube-dormant-phantom-constituent")
add_mystery_recipe(4, "cube-dormant-phantom-constituent", "cube-dormant-phantom-constituent")
add_mystery_recipe(4, "cube-legendary-iron-gear", "cube-legendary-iron-gear")

add_mystery_recipe(1, "cube-qubit", "cube-spectralite")
add_mystery_recipe(1, "cube-qubit-5", "cube-qubit-4")
add_mystery_recipe(1, "cube-qubit-4", "cube-qubit-3")
add_mystery_recipe(1, "cube-qubit-3", "cube-qubit-2")
add_mystery_recipe(1, "cube-qubit-2", "cube-qubit-1")
add_mystery_recipe(1, "cube-qubit-1", "cube-qubit-0")
add_mystery_recipe(1, "cube-qubit-0", "cube-qubit-5")

add_mystery_recipe(4, "cube-ultradense-composite", "cube-ultradense-matter-unit", 1, 8)
add_mystery_recipe(4, "cube-ultradense-matter-unit", "cube-ultradense-matter-unit")
add_mystery_recipe(2, "cube-ultradense-mineral", "cube-ultradense-powder", 1, 4)
add_mystery_recipe(2, "cube-ultradense-powder", "cube-ultradense-debris", 16, 1)
add_mystery_recipe(2, "cube-ultradense-debris", "cube-ultradense-debris")

add_mystery_recipe(1, "iron-chest", "cube-basic-matter-unit")
add_mystery_recipe(2, "cube-medium-container", "iron-chest")
add_mystery_recipe(4, "cube-big-container", "cube-medium-container")

add_mystery_recipe(1, "storage-tank", "pipe")
add_mystery_recipe(2, "cube-fluid-storage-1", "storage-tank")
add_mystery_recipe(4, "cube-fluid-storage-2", "cube-fluid-storage-1")

add_mystery_recipe(1, "fast-transport-belt", "transport-belt")
add_mystery_recipe(1, "express-transport-belt", "fast-transport-belt")
add_mystery_recipe(1, "cube-v4-transport-belt", "express-transport-belt")

add_mystery_recipe(1, "fast-underground-belt", "underground-belt")
add_mystery_recipe(1, "express-underground-belt", "fast-underground-belt")
add_mystery_recipe(1, "cube-v4-underground-belt", "express-underground-belt")

add_mystery_recipe(1, "fast-splitter", "splitter")
add_mystery_recipe(1, "express-splitter", "fast-splitter")
add_mystery_recipe(1, "cube-v4-splitter", "express-splitter")

add_mystery_recipe(1, "aai-v2-loader", "aai-loader")
add_mystery_recipe(1, "aai-v3-loader", "aai-v2-loader")
add_mystery_recipe(1, "aai-v4-loader", "aai-v3-loader")

add_mystery_recipe(1, "transport-belt", "cube-basic-matter-unit")
add_mystery_recipe(1, "underground-belt", "stone")
add_mystery_recipe(1, "splitter", "cube-electronic-circuit")
add_mystery_recipe(1, "aai-loader", "cube-spectralite")

add_mystery_recipe(1, "inserter", "cube-basic-matter-unit")
add_mystery_recipe(1, "long-handed-inserter", "inserter")
add_mystery_recipe(1, "fast-inserter", "inserter")
add_mystery_recipe(1, "filter-inserter", "fast-inserter")
add_mystery_recipe(1, "stack-inserter", "fast-inserter")
add_mystery_recipe(1, "stack-filter-inserter", "stack-inserter")
add_mystery_recipe(1, "cube-extremely-long-inserter", "long-handed-inserter")

add_mystery_recipe(1, "small-electric-pole", "wood")
add_mystery_recipe(1, "medium-electric-pole", "small-electric-pole")
add_mystery_recipe(1, "big-electric-pole", "medium-electric-pole")
add_mystery_recipe(1, "substation", "big-electric-pole")

add_mystery_recipe(1, "pipe", "cube-potato")
add_mystery_recipe(1, "pipe-to-ground", "stone")

add_mystery_recipe(1, "rail", "stone")
add_mystery_recipe(1, "train-stop", "cube-electronic-circuit")
add_mystery_recipe(1, "rail-signal", "small-lamp")
add_mystery_recipe(1, "rail-chain-signal", "small-lamp")
add_mystery_recipe(2, "locomotive", "cube-advanced-engine")
add_mystery_recipe(2, "cargo-wagon", "iron-chest")
add_mystery_recipe(2, "fluid-wagon", "storage-tank")

add_mystery_recipe(2, "cube-logistic-robot-1", "cube-logistic-robot-0")
add_mystery_recipe(2, "cube-logistic-robot-0", "cube-logistic-robot-1")
add_mystery_recipe(2, "construction-robot", "cube-bottled-consciousness")

add_mystery_recipe(1, "logistic-chest-active-provider", "iron-chest")
add_mystery_recipe(1, "logistic-chest-passive-provider", "iron-chest")
add_mystery_recipe(1, "logistic-chest-storage", "iron-chest")
add_mystery_recipe(1, "logistic-chest-buffer", "iron-chest")
add_mystery_recipe(1, "logistic-chest-requester", "iron-chest")

add_mystery_recipe(1, "small-lamp", "cube-potato")
add_mystery_recipe(1, "red-wire", "green-wire")
add_mystery_recipe(1, "green-wire", "red-wire")
add_mystery_recipe(1, "constant-combinator", "cube-electronic-circuit")
add_mystery_recipe(1, "arithmetic-combinator", "cube-electronic-circuit")
add_mystery_recipe(1, "decider-combinator", "cube-electronic-circuit")
add_mystery_recipe(1, "power-switch", "cube-electronic-circuit")
add_mystery_recipe(1, "programmable-speaker", "cube-electronic-circuit")

add_mystery_recipe(1, "concrete", "stone-brick")
add_mystery_recipe(1, "hazard-concrete", "concrete")
add_mystery_recipe(1, "refined-concrete", "concrete")
add_mystery_recipe(1, "refined-hazard-concrete", "refined-concrete")
add_mystery_recipe(1, "landfill", "stone")
add_mystery_recipe(1, "cliff-explosives", "explosives")

add_mystery_recipe(2, "cube-boiler", "pipe")
add_mystery_recipe(2, "steam-engine", "cube-basic-motor-unit")
add_mystery_recipe(4, "cube-heavy-turbine", "cube-advanced-engine")
add_mystery_recipe(2, "accumulator", "battery")
add_mystery_recipe(4, "cube-energy-bulkframe", "accumulator")

add_mystery_recipe(8, "cube-nuclear-reactor", "uranium-fuel-cell")
add_mystery_recipe(1, "heat-pipe", "pipe")
add_mystery_recipe(2, "heat-exchanger", "heat-pipe")
add_mystery_recipe(4, "cube-stygian-energy-lab", "cube-greenhouse")

add_mystery_recipe(2, "offshore-pump", "pipe")
add_mystery_recipe(4, "cube-greenhouse", "small-lamp")
add_mystery_recipe(2, "cube-electric-mining-drill", "cube-basic-motor-unit")
add_mystery_recipe(4, "cube-electric-mining-drill-mk2", "cube-electric-mining-drill")
add_mystery_recipe(8, "cube-deep-core-ultradrill", "cube-electric-mining-drill-mk2")

add_mystery_recipe(4, "cube-crusher", "cube-basic-motor-unit")
add_mystery_recipe(4, "cube-electric-furnace", "cube-mystery-furnace")
add_mystery_recipe(8, "cube-ultradense-furnace", "cube-mystery-furnace")
add_mystery_recipe(4, "centrifuge", "uranium-238")

add_mystery_recipe(2, "cube-chemical-plant", "pipe")
add_mystery_recipe(4, "cube-distillery", "cube-electric-furnace")
add_mystery_recipe(4, "cube-fuel-refinery", "cube-condensed-fuel")
add_mystery_recipe(2, "cube-fluid-burner", "pipe")

add_mystery_recipe(2, "cube-recovery-bay", "cube-n-dimensional-widget")
add_mystery_recipe(8, "cube-synthesizer", "cube-n-dimensional-widget")
add_mystery_recipe(8, "cube-dimension-folding-engine", "cube-n-dimensional-widget")
add_mystery_recipe(4, "cube-fabricator", "cube-basic-motor-unit")

add_mystery_recipe(8, "cube-cyclotron", "cube-advanced-engine")
add_mystery_recipe(4, "cube-quantum-decoder", "cube-spectral-processor")
add_mystery_recipe(2, "cube-particle-phase-aligner", "cube-spectral-processor")
add_mystery_recipe(16, "cube-mystery-furnace", "cube-potato")

add_mystery_recipe(2, "cube-lab", "cube-basic-contemplation-unit")
add_mystery_recipe(4, "radar", "cube-electronic-circuit")
add_mystery_recipe(4, "cube-roboport", "radar")
add_mystery_recipe(4, "cube-experimental-teleporter", "cube-teleportation-control-module")

add_mystery_recipe(16, "cube-forbidden-ziggurat", "spidertron")
add_mystery_recipe(16, "cube-antimatter-reactor", "cube-basic-matter-unit")

add_mystery_recipe(4, "cube-basic-matter-unit", "cube-potato", 10, 1)
add_mystery_recipe(1, "cube-basic-antimatter-unit", "cube-basic-matter-unit")
add_mystery_recipe(1, "cube-rare-metals", "cube-basic-matter-unit", 2, 1)
add_mystery_recipe(1, "cube-n-dimensional-widget", "cube-rare-metals")

add_mystery_recipe(2, "wood", "coal", 2, 1)
add_mystery_recipe(1, "cube-potato", "cube-spoiled-potato")
add_mystery_recipe(4, "cube-spoiled-potato", "cube-residual-tendrils", 1, 666)
add_mystery_recipe(1, "cube-vehicle-fuel", "sulfur")
add_mystery_recipe(1, "cube-nuclear-fuel", "cube-vehicle-fuel")
add_mystery_recipe(1, "cube-condensed-fuel", "cube-vehicle-fuel")

add_mystery_recipe(1, "cube-refined-rare-metals", "cube-raw-rare-metals")
add_mystery_recipe(1, "cube-mash", "cube-spoiled-potato")
add_mystery_recipe(1, "cube-sand", "cube-residual-tendrils")
add_mystery_recipe(1, "cube-deep-powder", "coal", 2, 1)
add_mystery_recipe(1, "cube-residual-tendrils", "cube-residual-tendrils", 1, 4)

add_mystery_recipe(1, "stone-brick", "stone")
add_mystery_recipe(1, "cube-glass", "stone-brick")
add_mystery_recipe(2, "cube-sophisticated-matter-unit", "cube-basic-matter-unit")
add_mystery_recipe(4, "cube-resplendent-plate", "cube-sophisticated-matter-unit")
add_mystery_recipe(1, "cube-spectralite", "cube-ghost-crystal")
add_mystery_recipe(1, "cube-ghost-wire", "cube-residual-tendrils")

add_mystery_recipe(1, "cube-basic-motor-unit", "pipe")
add_mystery_recipe(2, "cube-advanced-engine", "cube-basic-motor-unit")
add_mystery_recipe(4, "cube-arcane-drive", "cube-advanced-engine")
add_mystery_recipe(2, "copper-cable", "cube-electronic-circuit", 8, 1)
add_mystery_recipe(1, "cube-electronic-circuit", "cube-basic-matter-unit")
add_mystery_recipe(1, "cube-advanced-circuit", "cube-electronic-circuit")
add_mystery_recipe(1, "cube-spectral-processor", "cube-advanced-circuit")

add_mystery_recipe(1, "stone", "cube-raw-rare-metals", 2, 1)
add_mystery_recipe(1, "cube-raw-rare-metals", "stone", 2, 1)
add_mystery_recipe(1, "cube-deep-core-ore", "cube-deep-powder")
add_mystery_recipe(1, "coal", "wood", 1, 1)
add_mystery_recipe(2, "uranium-ore", "cube-uranium-234", 10, 1)
add_mystery_recipe(4, "raw-fish", "cube-spectralite", 2, 1)

add_mystery_recipe(1, "sulfur", "cube-residual-tendrils")
add_mystery_recipe(1, "cube-deep-crystal", "sulfur")
add_mystery_recipe(1, "cube-ghost-crystal", "sulfur")
add_mystery_recipe(1, "explosives", "sulfur")
add_mystery_recipe(1, "battery", "cube-rare-metals")
add_mystery_recipe(2, "flying-robot-frame", "cube-electronic-circuit")
add_mystery_recipe(4, "cube-haunted-energy-cell", "cube-residual-tendrils", 1, 40)

add_mystery_recipe(2, "uranium-238", "cube-uranium-234")
add_mystery_recipe(2, "uranium-235", "cube-uranium-234")
add_mystery_recipe(2, "cube-uranium-234", "cube-uranium-234", 1, 2)
add_mystery_recipe(2, "uranium-fuel-cell", "used-up-uranium-fuel-cell")
add_mystery_recipe(1, "used-up-uranium-fuel-cell", "uranium-ore")

add_mystery_recipe(1, "cube-calcium", "cube-sand")
add_mystery_recipe(1, "cube-intelligent-calcium", "cube-calcium")
add_mystery_recipe(1, "cube-singularity-research-data", "cube-boson-conduit")
add_mystery_recipe(1, "cube-quantum-research-data", "cube-qubit")
add_mystery_recipe(1, "cube-teleportation-control-module", "cube-spectral-processor")

add_mystery_recipe(1, "cube-besselheim-flask", "cube-glass")
add_mystery_recipe(1, "cube-bottled-consciousness", "cube-besselheim-flask")
add_mystery_recipe(1, "cube-bottled-euphoria", "cube-bottled-consciousness")
add_mystery_recipe(1, "cube-bottled-anguish", "cube-bottled-consciousness")

add_mystery_recipe(1, "cube-basic-contemplation-unit", "raw-fish")
add_mystery_recipe(1, "cube-fundamental-comprehension-card", "cube-basic-contemplation-unit")
add_mystery_recipe(1, "cube-abstract-interrogation-card", "cube-basic-contemplation-unit")
add_mystery_recipe(1, "cube-deep-introspection-card", "cube-basic-contemplation-unit")
add_mystery_recipe(1, "cube-synthetic-premonition-card", "cube-basic-contemplation-unit")
add_mystery_recipe(1, "cube-complete-annihilation-card", "cube-basic-contemplation-unit")
add_mystery_recipe(1, "cube-boson-conduit", "cube-boson-conduit")
add_mystery_recipe(1, "cube-fermion-conduit", "cube-fermion-conduit")

add_mystery_recipe(2, "cube-regulation-armor", "cube-modular-armor")
add_mystery_recipe(4, "cube-modular-armor", "cube-power-armor")
add_mystery_recipe(8, "cube-power-armor", "cube-power-armor-mk2")
add_mystery_recipe(16, "cube-power-armor-mk2", "cube-potato")

add_mystery_recipe(4, "fusion-reactor-equipment", "uranium-fuel-cell")
add_mystery_recipe(1, "cube-solar-panel-equipment", "cube-advanced-circuit")
add_mystery_recipe(2, "cube-solar-panel-equipment-mk2", "cube-solar-panel-equipment")
add_mystery_recipe(1, "cube-battery-equipment", "battery")
add_mystery_recipe(2, "battery-mk2-equipment", "cube-battery-equipment")

add_mystery_recipe(2, "exoskeleton-equipment", "cube-speed-module")
add_mystery_recipe(4, "cube-exoskeleton-equipment-mk2", "cube-speed-module-v2")
add_mystery_recipe(2, "cube-personal-roboport-equipment", "cube-advanced-circuit")
add_mystery_recipe(4, "personal-roboport-mk2-equipment", "cube-personal-roboport-equipment")
add_mystery_recipe(1, "night-vision-equipment", "small-lamp")

add_mystery_recipe(2, "car", "cube-advanced-engine")
add_mystery_recipe(4, "spidertron", "raw-fish")
add_mystery_recipe(1, "spidertron-remote", "raw-fish")

add_mystery_recipe(1, "stone-wall", "stone-brick")
add_mystery_recipe(1, "gate", "stone-wall")

add_mystery_recipe(1, "cube-modular-casing", "cube-burnt-out-modular-casing")
add_mystery_recipe(1, "cube-burnt-out-modular-casing", "cube-potato")

add_mystery_recipe(1, "cube-speed-module", "cube-modular-casing")
add_mystery_recipe(1, "cube-productivity-module", "cube-modular-casing")
add_mystery_recipe(1, "cube-efficiency-module", "cube-modular-casing")

add_mystery_recipe(1, "cube-speed-module-v2", "cube-speed-module")
add_mystery_recipe(1, "cube-productivity-module-v2", "cube-productivity-module")
add_mystery_recipe(1, "cube-efficiency-module-v2", "cube-efficiency-module")

add_mystery_recipe(1, "cube-speed-module-v3", "cube-speed-module-v2")
add_mystery_recipe(1, "cube-productivity-module-v3", "cube-productivity-module-v2")
add_mystery_recipe(1, "cube-efficiency-module-v3", "cube-efficiency-module-v2")

add_mystery_recipe(1, "empty-barrel", "cube-rare-metals")