if mods["safefill"] then
  data.raw["string-setting"]["safefill-cost"].allowed_values = {"normal", "expensive"}
end

if mods["quick-adjustable-inserters"] then
  data.raw["bool-setting"]["bobmods-inserters-long1"].default_value = false
  data.raw["bool-setting"]["bobmods-inserters-long2"].default_value = false
end

if mods["est-tiny-storage-tank"] then
  data.raw["int-setting"]["tiny-storage-tank-volume"].default_value = 2500
  data.raw["int-setting"]["tiny-storage-tank-volume"].allowed_values = {2500}
  data.raw["int-setting"]["tiny-storage-tank-volume"].hidden = true
  data.raw["string-setting"]["tiny-storage-tank-unlock"].default_value = "with-fluid-handling"
  data.raw["string-setting"]["tiny-storage-tank-unlock"].allowed_values = {"with-fluid-handling"}
  data.raw["string-setting"]["tiny-storage-tank-unlock"].hidden = true
end