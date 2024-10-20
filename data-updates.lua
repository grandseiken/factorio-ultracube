require("prototypes.lib.tech_costs")
require("prototypes.lib.mystery")

require("updates.compatibility.aai_signal_transmission")
require("updates.compatibility.advanced_fluid_handling")
require("updates.compatibility.circuit_hud")
require("updates.compatibility.compact_circuits")
require("updates.compatibility.cybersyn")
require("updates.compatibility.display_plates")
require("updates.compatibility.flow_control")
require("updates.compatibility.fuel_train_stop")
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
require("updates.compatibility.spidertron_logistics")
require("updates.compatibility.stack_combinator")
require("updates.compatibility.textplates")
require("updates.compatibility.wire_shortcuts")

require("updates.barrelling")
require("updates.character")
require("updates.recipes_mystery")
require("updates.productivity")
require("updates.disable_incompatible")
require("updates.ultralocomotion")

for _, t in pairs(data.raw.technology) do
  t.enabled = false
end

-- Get rid of rocket capacity and factoriopedia.
for t, _ in pairs(defines.prototypes.item) do
  if data.raw[t] then
    for _, v in pairs(data.raw[t]) do
      v.hidden_in_factoriopedia = true
      v.weight = (1000 * 1000) / v.stack_size
    end
  end
end

for t, _ in pairs(defines.prototypes.entity) do
  if data.raw[t] then
    for _, v in pairs(data.raw[t]) do
      v.hidden_in_factoriopedia = true
    end
  end
end

for _, v in pairs(data.raw.fluid) do
  v.hidden_in_factoriopedia = true
end
for _, v in pairs(data.raw.recipe) do
  v.hidden_in_factoriopedia = true
end
for _, v in pairs(data.raw["ammo-category"]) do
  v.hidden_in_factoriopedia = true
end