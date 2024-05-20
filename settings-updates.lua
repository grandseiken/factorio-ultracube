if mods["safefill"] then
  data.raw["string-setting"]["safefill-cost"].allowed_values = {"normal", "expensive"}
end

if mods["quick-adjustable-inserters"] then
  data.raw["bool-setting"]["bobmods-inserters-long1"].default_value = false
  data.raw["bool-setting"]["bobmods-inserters-long2"].default_value = false
end