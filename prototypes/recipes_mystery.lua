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

local item_prototypes = {
  "item",
  "tool",
  "armor",
  "module",
  "item-with-entity-data",
  "capsule",
  "rail-planner",
  "spidertron-remote",
}
local function add_mystery(a, b, c, d, e)
  local item = nil
  for _, t in ipairs(item_prototypes) do
    item = data.raw[t][b]
    if item then break end
  end
  local results = {{type = "item", name = "cube-residual-tendrils",
                    amount_min = 0, amount_max = math.floor(1 + a)}}
  if c then
    results[#results + 1] = {c, e or 1}
  end
  data:extend({
    {
      type = "recipe",
      name = "cube-mystery-" .. b,
      icon = item.icon,
      icon_size = item.icon_size,
      icon_mipmaps = item.icon_mipmaps,
      icons = item.icons,
      localised_name = {"recipe-name.cube-mystery"},
      ingredients = {{b, d or 1}},
      results = results,
      energy_required = 2 * a,
      category = "cube-mystery-furnace",
      subgroup = "cube-mystery",
      hidden = true,
      hide_from_player_crafting = true,
    }
  })
end

add_mystery(4, "cube-ultradense-utility-cube", "cube-dormant-utility-cube")
add_mystery(4, "cube-dormant-utility-cube", "cube-dormant-utility-cube")
add_mystery(4, "cube-phantom-ultradense-constituent", "cube-dormant-phantom-constituent")
add_mystery(4, "cube-dormant-phantom-constituent", "cube-dormant-phantom-constituent")
add_mystery(4, "cube-legendary-iron-plate", "cube-legendary-iron-plate")

add_mystery(1, "cube-qubit", "cube-spectralite")
add_mystery(1, "cube-qubit-5", "cube-qubit-4")
add_mystery(1, "cube-qubit-4", "cube-qubit-3")
add_mystery(1, "cube-qubit-3", "cube-qubit-2")
add_mystery(1, "cube-qubit-2", "cube-qubit-1")
add_mystery(1, "cube-qubit-1", "cube-qubit-0")
add_mystery(1, "cube-qubit-0", "cube-qubit-5")

add_mystery(4, "cube-ultradense-composite", "cube-ultradense-matter-unit", 1, 8)
add_mystery(4, "cube-ultradense-matter-unit", "cube-ultradense-matter-unit")
add_mystery(2, "cube-ultradense-mineral", "cube-ultradense-powder", 1, 4)
add_mystery(2, "cube-ultradense-powder", "cube-ultradense-debris", 16, 1)
add_mystery(2, "cube-ultradense-debris", "cube-ultradense-debris")

add_mystery(1, "iron-chest", "cube-basic-matter-unit")
add_mystery(2, "cube-medium-container", "iron-chest")
add_mystery(4, "cube-big-container", "cube-medium-container")

add_mystery(1, "storage-tank", "pipe")
add_mystery(2, "cube-fluid-storage-1", "storage-tank")
add_mystery(4, "cube-fluid-storage-2", "cube-fluid-storage-1")

add_mystery(1, "fast-transport-belt", "transport-belt")
add_mystery(1, "express-transport-belt", "fast-transport-belt")
add_mystery(1, "cube-v4-transport-belt", "express-transport-belt")

add_mystery(1, "fast-underground-belt", "underground-belt")
add_mystery(1, "express-underground-belt", "fast-underground-belt")
add_mystery(1, "cube-v4-underground-belt", "express-underground-belt")

add_mystery(1, "fast-splitter", "splitter")
add_mystery(1, "express-splitter", "fast-splitter")
add_mystery(1, "cube-v4-splitter", "express-splitter")

add_mystery(1, "aai-v2-loader", "aai-loader")
add_mystery(1, "aai-v3-loader", "aai-v2-loader")
add_mystery(1, "aai-v4-loader", "aai-v3-loader")

add_mystery(1, "transport-belt", "cube-basic-matter-unit")
add_mystery(1, "underground-belt", "stone")
add_mystery(1, "splitter", "cube-electronic-circuit")
add_mystery(1, "aai-loader", "cube-spectralite")

add_mystery(1, "inserter", "cube-basic-matter-unit")
add_mystery(1, "long-handed-inserter", "inserter")
add_mystery(1, "fast-inserter", "inserter")
add_mystery(1, "filter-inserter", "fast-inserter")
add_mystery(1, "stack-inserter", "fast-inserter")
add_mystery(1, "stack-filter-inserter", "stack-inserter")
add_mystery(1, "cube-extremely-long-inserter", "long-handed-inserter")

add_mystery(1, "small-electric-pole", "wood")
add_mystery(1, "medium-electric-pole", "small-electric-pole")
add_mystery(1, "big-electric-pole", "medium-electric-pole")
add_mystery(1, "substation", "big-electric-pole")

add_mystery(1, "pipe", "cube-potato")
add_mystery(1, "pipe-to-ground", "stone")
if mods["Flow Control"] then
  add_mystery(1, "pipe-elbow", "pipe")
  add_mystery(1, "pipe-junction", "pipe")
  add_mystery(1, "pipe-straight", "pipe")
  add_mystery(1, "check-valve", "pipe")
  add_mystery(1, "overflow-valve", "pipe")
  add_mystery(1, "underflow-valve", "pipe")
end

add_mystery(1, "rail", "stone")
add_mystery(1, "train-stop", "cube-electronic-circuit")
add_mystery(1, "rail-signal", "small-lamp")
add_mystery(1, "rail-chain-signal", "small-lamp")
add_mystery(2, "locomotive", "cube-advanced-engine")
add_mystery(2, "cargo-wagon", "iron-chest")
add_mystery(2, "fluid-wagon", "storage-tank")

add_mystery(2, "cube-logistic-robot-1", "cube-logistic-robot-0")
add_mystery(2, "cube-logistic-robot-0", "cube-logistic-robot-1")
add_mystery(2, "cube-construction-robot-0", "cube-bottled-consciousness")

add_mystery(1, "logistic-chest-active-provider", "iron-chest")
add_mystery(1, "logistic-chest-passive-provider", "iron-chest")
add_mystery(1, "logistic-chest-storage", "iron-chest")
add_mystery(1, "logistic-chest-buffer", "iron-chest")
add_mystery(1, "logistic-chest-requester", "iron-chest")

add_mystery(1, "small-lamp", "cube-potato")
add_mystery(1, "red-wire", "copper-cable")
add_mystery(1, "green-wire", "copper-cable")
add_mystery(1, "constant-combinator", "cube-electronic-circuit")
add_mystery(1, "arithmetic-combinator", "cube-electronic-circuit")
add_mystery(1, "decider-combinator", "cube-electronic-circuit")
add_mystery(1, "power-switch", "cube-electronic-circuit")
add_mystery(1, "programmable-speaker", "cube-electronic-circuit")

if mods["pushbutton"] then
  add_mystery(1, "pushbutton", "cube-advanced-circuit")
end
if mods["nixie-tubes"] then
  add_mystery(1, "nixie-tube", "cube-glass")
  add_mystery(1, "nixie-tube-alpha", "cube-glass")
  add_mystery(1, "nixie-tube-small", "cube-glass")
end

add_mystery(1, "concrete", "stone-brick")
add_mystery(1, "hazard-concrete", "concrete")
add_mystery(1, "refined-concrete", "concrete")
add_mystery(1, "refined-hazard-concrete", "refined-concrete")
add_mystery(1, "landfill", "stone")
add_mystery(1, "cliff-explosives", "explosives")

add_mystery(2, "uranium-238", "cube-uranium-234")
add_mystery(2, "uranium-235", "cube-uranium-234")
add_mystery(2, "cube-uranium-234", "cube-uranium-234", 1, 2)

if mods["textplates"] then
  add_mystery(1, "textplate-small-plastic", "cube-basic-matter-unit")
  add_mystery(1, "textplate-large-plastic", "cube-basic-matter-unit")
  add_mystery(1, "textplate-small-stone", "stone")
  add_mystery(1, "textplate-large-stone", "stone")
  add_mystery(1, "textplate-small-steel", "cube-rare-metals")
  add_mystery(1, "textplate-large-steel", "cube-rare-metals")
  add_mystery(1, "textplate-small-concrete", "concrete")
  add_mystery(1, "textplate-large-concrete", "concrete")
  add_mystery(1, "textplate-small-glass", "cube-glass")
  add_mystery(1, "textplate-large-glass", "cube-glass")
  add_mystery(1, "textplate-small-gold", "sulfur")
  add_mystery(1, "textplate-large-gold", "sulfur")
  add_mystery(1, "textplate-small-uranium", "uranium-238")
  add_mystery(1, "textplate-large-uranium", "uranium-238")
end

add_mystery(2, "cube-boiler", "pipe")
add_mystery(2, "steam-engine", "cube-basic-motor-unit")
add_mystery(4, "cube-heavy-turbine", "cube-advanced-engine")
add_mystery(2, "accumulator", "battery")
add_mystery(4, "cube-energy-bulkframe", "accumulator")

add_mystery(8, "cube-nuclear-reactor", "uranium-fuel-cell")
add_mystery(1, "heat-pipe", "pipe")
add_mystery(2, "heat-exchanger", "heat-pipe")
add_mystery(4, "cube-stygian-energy-lab", "cube-greenhouse")

add_mystery(2, "offshore-pump", "pipe")
add_mystery(4, "cube-greenhouse", "small-lamp")
add_mystery(2, "cube-electric-mining-drill", "cube-basic-motor-unit")
add_mystery(4, "cube-electric-mining-drill-mk2", "cube-electric-mining-drill")
add_mystery(8, "cube-deep-core-ultradrill", "cube-electric-mining-drill-mk2")

add_mystery(4, "cube-crusher", "cube-basic-motor-unit")
add_mystery(4, "cube-electric-furnace", "cube-mystery-furnace")
add_mystery(8, "cube-ultradense-furnace", "cube-mystery-furnace")
add_mystery(4, "centrifuge", "uranium-238")

add_mystery(2, "cube-chemical-plant", "pipe")
add_mystery(4, "cube-distillery", "cube-electric-furnace")
add_mystery(4, "cube-fuel-refinery", "cube-condensed-fuel")
add_mystery(2, "cube-fluid-burner", "pipe")

add_mystery(2, "cube-recovery-bay", "cube-n-dimensional-widget")
add_mystery(8, "cube-synthesizer", "cube-n-dimensional-widget")
add_mystery(8, "cube-dimension-folding-engine", "cube-n-dimensional-widget")
add_mystery(4, "cube-fabricator", "cube-basic-motor-unit")

add_mystery(8, "cube-molecular-blender", "cube-advanced-engine")
add_mystery(4, "cube-quantum-decoder", "cube-spectral-processor")
add_mystery(2, "cube-particle-phase-aligner", "cube-spectral-processor")
add_mystery(16, "cube-mystery-furnace", "cube-potato")

add_mystery(2, "cube-lab", "cube-basic-contemplation-unit")
add_mystery(4, "radar", "cube-electronic-circuit")
add_mystery(4, "cube-roboport", "radar")
add_mystery(4, "cube-experimental-teleporter", "cube-teleportation-control-module")

add_mystery(16, "cube-forbidden-ziggurat", "spidertron")
add_mystery(16, "cube-antimatter-reactor", "cube-basic-matter-unit")

add_mystery(1, "cube-basic-matter-unit", "cube-potato")
add_mystery(1, "cube-basic-antimatter-unit", "cube-basic-matter-unit")
add_mystery(1, "cube-rare-metals", "cube-basic-matter-unit")
add_mystery(1, "wood", "coal")
add_mystery(1, "cube-n-dimensional-widget", "cube-rare-metals")

add_mystery(2, "cube-regulation-armor", "cube-modular-armor")
add_mystery(4, "cube-modular-armor", "cube-power-armor")
add_mystery(8, "cube-power-armor", "cube-power-armor-mk2")
add_mystery(16, "cube-power-armor-mk2", "cube-potato")

add_mystery(4, "fusion-reactor-equipment", "uranium-fuel-cell")
add_mystery(1, "cube-solar-panel-equipment", "cube-advanced-circuit")
add_mystery(2, "cube-solar-panel-equipment-mk2", "cube-solar-panel-equipment")
add_mystery(1, "cube-battery-equipment", "battery")
add_mystery(2, "battery-mk2-equipment", "cube-battery-equipment")

add_mystery(2, "exoskeleton-equipment", "cube-speed-module")
add_mystery(4, "cube-exoskeleton-equipment-mk2", "cube-speed-module-v2")
add_mystery(2, "cube-personal-roboport-equipment", "cube-advanced-circuit")
add_mystery(4, "personal-roboport-mk2-equipment", "cube-personal-roboport-equipment")
add_mystery(1, "night-vision-equipment", "small-lamp")

add_mystery(2, "car", "cube-advanced-engine")
add_mystery(4, "spidertron", "raw-fish")
add_mystery(1, "spidertron-remote", "raw-fish")

add_mystery(1, "stone-wall", "stone-brick")
add_mystery(1, "gate", "stone-wall")

add_mystery(1, "cube-modular-casing", "cube-burnt-out-modular-casing")
add_mystery(1, "cube-burnt-out-modular-casing", "cube-potato")

add_mystery(1, "cube-speed-module", "cube-modular-casing")
add_mystery(1, "cube-productivity-module", "cube-modular-casing")
add_mystery(1, "cube-efficiency-module", "cube-modular-casing")

add_mystery(1, "cube-speed-module-v2", "cube-speed-module")
add_mystery(1, "cube-productivity-module-v2", "cube-productivity-module")
add_mystery(1, "cube-efficiency-module-v2", "cube-efficiency-module")

add_mystery(1, "cube-speed-module-v3", "cube-speed-module-v2")
add_mystery(1, "cube-productivity-module-v3", "cube-productivity-module-v2")
add_mystery(1, "cube-efficiency-module-v3", "cube-efficiency-module-v2")