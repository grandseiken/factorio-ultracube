require("__Ultracube__/scripts/lib")

if mods["stack-combinator"] then
  data.raw.technology["stack-combinator"].enabled = false
end
if mods["RenaiTransportation"] then
  require("updates.compatibility.renai_transportation_mystery")
end

-- Ensure other mods haven't messed with some important settings.
data.raw["electric-pole"]["cube-local-turbine-source"].maximum_wire_distance = 0
data.raw["electric-pole"]["cube-local-turbine-transmitter"].maximum_wire_distance = 0

local constants = data.raw["utility-constants"].default
constants.default_item_weight=0
constants.rocket_lift_weight=0

-- Make sure items can be sent automatically in the teleporter.
for type, _ in pairs(defines.prototypes.item) do
  for _, item in pairs(data.raw[type] or {}) do
    --item.rocket_launch_products = {{type = "item", name = "space-science-pack", amount = 0}}
    item.send_to_orbit_mode = "automated"
    item.ingredient_to_weight_coefficient = 0
  end
end
data.raw.item["cube-residual-tendrils"].rocket_launch_products = {{type = "item", name = "cube-residual-tendrils", amount = 100}}

local replacement_techs = {
  ["circuit-network"] = "cube-combinatorics",
  ["construction-robotics"] = "cube-construction-robotics",
  ["personal-roboport-equipment"] = "cube-personal-roboport-equipment",
  ["exoskeleton-equipment"] = "cube-exoskeleton-equipment",
  ["electronics"] = "cube-electronics",
  ["spidertron"] = "cube-spidertron",
}
for _, v in pairs(data.raw.shortcut) do
  if replacement_techs[v.technology_to_unlock] then
    v.technology_to_unlock = replacement_techs[v.technology_to_unlock]
  end
end

-- Remove base game recipes that confuse various 2.0 GUIs.
local removed_recipes = make_set({
  "transport-belt", "fast-transport-belt", "express-transport-belt",
  "underground-belt", "fast-underground-belt", "express-underground-belt",
  "splitter", "fast-splitter", "express-splitter",
  "inserter", "long-handed-inserter", "fast-inserter", "bulk-inserter",
  "aai-loader", "aai-v2-loader", "aai-v3-loader", "aai-v4-loader",
  "small-electric-pole", "medium-electric-pole", "big-electric-pole",
  "substation", "pipe", "pipe-to-ground", "pump",
  "rail", "train-stop", "rail-signal", "rail-chain-signal",
  "locomotive", "cargo-wagon", "fluid-wagon",
  "iron-chest", "storage-tank",
  "construction-robot", "active-provider-chest", "passive-provider-chest",
  "storage-chest", "buffer-chest", "requester-chest",
  "small-lamp", "arithmetic-combinator", "decider-combinator",
  "selector-combinator", "constant-combinator", "power-switch",
  "programmable-speaker", "display-panel",
  "concrete", "hazard-concrete", "refined-concrete", "refined-hazard-concrete",
  "landfill", "cliff-explosives", "offshore-pump", "radar",
  "steam-engine", "accumulator", "heat-pipe", "heat-exchanger", "centrifuge",
  "stone-brick", "sulfur", "explosives", "battery", "flying-robot-frame",
  "barrel", "uranium-fuel-cell", "copper-cable", "repair-pack",
  "fission-reactor-equipment", "battery-mk2-equipment",
  "belt-immunity-equipment", "night-vision-equipment",
  "exoskeleton-equipment", "personal-roboport-mk2-equipment",
  "car", "spidertron", "stone-wall", "gate",
})

for k, _ in pairs(removed_recipes) do
  data.raw.recipe[k] = nil
end
for _, t in pairs(data.raw.technology) do
  if t.effects then
    for i = #t.effects, 1, -1 do
      local v = t.effects[i]
      if v.type == "unlock-recipe" and removed_recipes[v.recipe] then
        table.remove(t.effects, i)
      end
    end
  end
end
for _, v in pairs(data.raw.recipe) do
  if v.factoriopedia_alternative == "barrel" then
    v.factoriopedia_alternative = "cube-barrel"
  end
end
data.raw["tips-and-tricks-item"]["electric-network"].trigger = nil