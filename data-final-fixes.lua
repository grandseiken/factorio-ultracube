if mods["stack-combinator"] then
  data.raw.technology["stack-combinator"].enabled = false
end
if mods["RenaiTransportation"] then
  require("updates.compatibility.renai_transportation_mystery")
end

-- Ensure other mods haven't messed with some important settings.
data.raw["electric-pole"]["cube-local-turbine-source"].maximum_wire_distance = 0.25
data.raw["electric-pole"]["cube-local-turbine-transmitter"].maximum_wire_distance = 0.25

-- Make sure items can be sent automatically in the teleporter.
for type, _ in pairs(defines.prototypes.item) do
  for _, item in pairs(data.raw[type] or {}) do
    item.send_to_orbit_mode = "automatic"
  end
end