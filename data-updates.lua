require("prototypes.lib.tech_costs")
require("prototypes.lib.mystery")

require("updates.compatibility.aai_signal_transmission")
require("updates.compatibility.advanced_fluid_handling")
require("updates.compatibility.circuit_hud")
require("updates.compatibility.compact_circuits")
require("updates.compatibility.cybersyn")
require("updates.compatibility.display_plates")
require("updates.compatibility.est_tiny_storage_tank")
require("updates.compatibility.fcpu")
require("updates.compatibility.flow_control")
require("updates.compatibility.grappling_gun")
require("updates.compatibility.holographic_signs")
require("updates.compatibility.inventory_sensor")
require("updates.compatibility.jetpack")
require("updates.compatibility.larger_lamps")
require("updates.compatibility.lighted_poles_plus")
require("updates.compatibility.ltn")
require("updates.compatibility.nixie_tubes")
require("updates.compatibility.power_combinator")
require("updates.compatibility.pushbutton")
require("updates.compatibility.quick_adjustable_inserters")
require("updates.compatibility.railway_motor_car")
require("updates.compatibility.recursive_blueprints")
require("updates.compatibility.renai_transportation")
require("updates.compatibility.safe_waterfill")
require("updates.compatibility.textplates")

require("updates.barrelling")
require("updates.character")
require("updates.circuit_connectors")
require("updates.recipes_mystery")
require("updates.productivity")
require("updates.disable_incompatible")
require("updates.ultralocomotion")

for _, t in pairs(data.raw.technology) do
  t.enabled = false
end

-- Helper to check if something belongs to this mod (by name only).
-- Base game items may have their order/subgroup changed to cube-, but they keep their original names.
local function is_cube_prototype(v)
  return v and starts_with(v.name or "", "cube-")
end

-- Collect items/fluids that are produced by cube recipes - these should be visible in factoriopedia
-- Exclude mystery furnace recipes since those are just for the mystery furnace system,
-- not actual craftable recipes that should make items visible.
local items_with_cube_recipes = {}
for _, recipe in pairs(data.raw.recipe) do
  if is_cube_prototype(recipe) and recipe.category ~= "cube-mystery-furnace" then
    if recipe.results then
      for _, result in pairs(recipe.results) do
        if result.name then
          items_with_cube_recipes[result.name] = true
        end
      end
    end
  end
end

-- Override recipes to merge with item factoriopedia entries.
-- Recipe name must match item name for factoriopedia merging.
-- Do this BEFORE hiding non-cube recipes so we can track which to keep visible.
local recipe_mappings = {
  -- Belts (tier 1 = fast, tier 2 = express, tier 3 = v4)
  ["cube-transport-belt"] = "fast-transport-belt",
  ["cube-underground-belt"] = "fast-underground-belt",
  ["cube-splitter"] = "fast-splitter",
  ["cube-transport-belt-2"] = "express-transport-belt",
  ["cube-underground-belt-2"] = "express-underground-belt",
  ["cube-splitter-2"] = "express-splitter",
  ["cube-transport-belt-3"] = "cube-v4-transport-belt",
  ["cube-underground-belt-3"] = "cube-v4-underground-belt",
  ["cube-splitter-3"] = "cube-v4-splitter",
  -- Loaders
  ["cube-v2-loader"] = "aai-v2-loader",
  ["cube-v3-loader"] = "aai-v3-loader",
  ["cube-v4-loader"] = "aai-v4-loader",
  -- Inserters
  ["cube-fast-inserter"] = "fast-inserter",
  ["cube-long-inserter"] = "long-handed-inserter",
  ["cube-bulk-inserter"] = "bulk-inserter",
  -- Pipes and fluid handling
  ["cube-pipe"] = "pipe",
  ["cube-underground-pipe"] = "pipe-to-ground",
  ["cube-pump"] = "pump",
  ["cube-storage-tank"] = "storage-tank",
  ["cube-offshore-pump"] = "offshore-pump",
  -- Electric poles
  ["cube-medium-electric-pole"] = "medium-electric-pole",
  ["cube-big-electric-pole"] = "big-electric-pole",
  ["cube-substation"] = "substation",
  -- Rails and trains
  ["cube-rail"] = "rail",
  ["cube-train-stop"] = "train-stop",
  ["cube-rail-signal"] = "rail-signal",
  ["cube-chain-signal"] = "rail-chain-signal",
  ["cube-locomotive"] = "locomotive",
  ["cube-cargo-wagon"] = "cargo-wagon",
  ["cube-fluid-wagon"] = "fluid-wagon",
  -- Storage
  ["cube-iron-chest"] = "iron-chest",
  -- Logistics chests
  ["cube-logistic-chest-passive-provider"] = "passive-provider-chest",
  ["cube-logistic-chest-active-provider"] = "active-provider-chest",
  ["cube-logistic-chest-storage"] = "storage-chest",
  ["cube-logistic-chest-buffer"] = "buffer-chest",
  ["cube-logistic-chest-requester"] = "requester-chest",
  ["cube-construction-robot"] = "construction-robot",
  -- Combinators and circuit network
  ["cube-constant-combinator"] = "constant-combinator",
  ["cube-arithmetic-combinator"] = "arithmetic-combinator",
  ["cube-decider-combinator"] = "decider-combinator",
  ["cube-selector-combinator"] = "selector-combinator",
  ["cube-power-switch"] = "power-switch",
  ["cube-programmable-speaker"] = "programmable-speaker",
  ["cube-display-panel"] = "display-panel",
  ["cube-lamp"] = "small-lamp",
  -- Concrete and terrain
  ["cube-concrete"] = "concrete",
  ["cube-hazard-concrete"] = "hazard-concrete",
  ["cube-refined-concrete"] = "refined-concrete",
  ["cube-refined-hazard-concrete"] = "refined-hazard-concrete",
  ["cube-landfill"] = "landfill",
  ["cube-cliff-explosives"] = "cliff-explosives",
  -- Defense
  ["cube-stone-wall"] = "stone-wall",
  ["cube-gate"] = "gate",
  ["cube-radar"] = "radar",
  -- Power generation
  ["cube-steam-engine"] = "steam-engine",
  ["cube-accumulator"] = "accumulator",
  ["cube-heat-pipe"] = "heat-pipe",
  ["cube-heat-exchanger"] = "heat-exchanger",
  ["cube-centrifuge"] = "centrifuge",
  -- Intermediates
  ["cube-stone-brick"] = "stone-brick",
  ["cube-sulfur"] = "sulfur",
  ["cube-sulfuric-acid"] = "sulfuric-acid",
  ["cube-explosives"] = "explosives",
  ["cube-battery"] = "battery",
  ["cube-flying-robot-frame"] = "flying-robot-frame",
  ["cube-conductive-wire"] = "copper-cable",
  ["cube-repair-pack"] = "repair-pack",
  ["cube-barrel"] = "barrel",
  ["cube-uranium-fuel-cell"] = "uranium-fuel-cell",
  -- Equipment
  ["cube-fission-reactor-equipment"] = "fission-reactor-equipment",
  ["cube-battery-mk2-equipment"] = "battery-mk2-equipment",
  ["cube-belt-immunity-equipment"] = "belt-immunity-equipment",
  ["cube-night-vision-equipment"] = "night-vision-equipment",
  ["cube-exoskeleton-equipment"] = "exoskeleton-equipment",
  ["cube-personal-roboport-mk2-equipment"] = "personal-roboport-mk2-equipment",
  -- Vehicles
  ["cube-car"] = "car",
  ["cube-spidertron"] = "spidertron",
  -- Elevated rails
  ["cube-rail-support"] = "rail-support",
  ["cube-rail-ramp"] = "rail-ramp",
  -- Resources
  ["cube-greenhouse-wood"] = "wood",
}

local overridden_recipes = {}
for cube_name, base_name in pairs(recipe_mappings) do
  local cube_recipe = data.raw.recipe[cube_name]
  if cube_recipe then
    data.raw.recipe[base_name] = {
      type = "recipe",
      name = base_name,
      ingredients = cube_recipe.ingredients,
      results = cube_recipe.results,
      main_product = base_name,
      energy_required = cube_recipe.energy_required,
      category = cube_recipe.category,
      enabled = cube_recipe.enabled,
    }
    overridden_recipes[base_name] = true
    -- Delete the original cube- recipe since we've replaced it
    data.raw.recipe[cube_name] = nil
  end
end

-- Remove recipe unlocks from base game technologies (they're unlocked by cube- techs instead)
local overridden_recipe_set = {}
for _, base_name in pairs(recipe_mappings) do
  overridden_recipe_set[base_name] = true
end
for _, tech in pairs(data.raw.technology) do
  if not is_cube_prototype(tech) and tech.effects then
    for i = #tech.effects, 1, -1 do
      local effect = tech.effects[i]
      if effect.type == "unlock-recipe" and overridden_recipe_set[effect.recipe] then
        table.remove(tech.effects, i)
      end
    end
  end
end

-- Get rid of rocket capacity and factoriopedia for non-mod items (unless they have a cube recipe).
for t, _ in pairs(defines.prototypes.item) do
  if data.raw[t] then
    for _, v in pairs(data.raw[t]) do
      if not is_cube_prototype(v) and not items_with_cube_recipes[v.name] then
        v.hidden_in_factoriopedia = true
      end
      v.weight = 0
    end
  end
end

for t, _ in pairs(defines.prototypes.entity) do
  if data.raw[t] then
    for _, v in pairs(data.raw[t]) do
      if not is_cube_prototype(v) and not items_with_cube_recipes[v.name] then
        v.hidden_in_factoriopedia = true
      end
    end
  end
end

for _, v in pairs(data.raw.fluid) do
  if not is_cube_prototype(v) and not items_with_cube_recipes[v.name] then
    v.hidden_in_factoriopedia = true
  end
end
for _, v in pairs(data.raw.recipe) do
  if not is_cube_prototype(v) and not overridden_recipes[v.name] then
    v.hidden_in_factoriopedia = true
  end
end
for _, v in pairs(data.raw["ammo-category"]) do
  if not is_cube_prototype(v) then
    v.hidden_in_factoriopedia = true
  end
end
