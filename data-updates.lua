require("prototypes.lib.tech_costs")
require("prototypes.lib.mystery")

for _, t in pairs(data.raw.technology) do
  t.enabled = false
end

require("updates.character")
require("updates.recipes_mystery")
require("updates.ultralocomotion")

require("updates.compatibility.aai_signal_transmission")
require("updates.compatibility.cybersyn")
require("updates.compatibility.flow_control")
require("updates.compatibility.inventory_sensor")
require("updates.compatibility.nixie_tubes")
require("updates.compatibility.pushbutton")
require("updates.compatibility.textplates")
require("updates.compatibility.wire_shortcuts")
