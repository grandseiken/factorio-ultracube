if mods["stack-combinator"] then
  data.raw.technology["stack-combinator"].enabled = false
end

-- Ensure other mods haven't messed with some important settings.
data.raw["electric-pole"]["cube-local-turbine-source"].maximum_wire_distance = 0.25
data.raw["electric-pole"]["cube-local-turbine-transmitter"].maximum_wire_distance = 0.25