require("prototypes.lib.tech_costs")
require("prototypes.lib.mystery")

require("updates.compatibility.aai_signal_transmission")
require("updates.compatibility.circuit_hud")
require("updates.compatibility.compact_circuits")
require("updates.compatibility.cybersyn")
require("updates.compatibility.display_plates")
require("updates.compatibility.flow_control")
require("updates.compatibility.holographic_signs")
require("updates.compatibility.inventory_sensor")
require("updates.compatibility.nixie_tubes")
require("updates.compatibility.pushbutton")
require("updates.compatibility.recursive_blueprints")
require("updates.compatibility.safe_waterfill")
require("updates.compatibility.spidertron_logistics")
require("updates.compatibility.stack_combinator")
require("updates.compatibility.textplates")
require("updates.compatibility.wire_shortcuts")

require("updates.barrelling")
require("updates.character")
require("updates.recipes_mystery")
require("updates.disable_incompatible")
require("updates.ultralocomotion")

for _, t in pairs(data.raw.technology) do
  t.enabled = false
end