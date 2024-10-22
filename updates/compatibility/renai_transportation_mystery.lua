require("prototypes.lib.mystery")

if settings.startup["RTThrowersSetting"].value then
  add_mystery_recipe(1, "RTThrower-fast-inserter-Item", "RTThrower-inserter-Item")
  add_mystery_recipe(1, "RTThrower-inserter-Item", "inserter")
  add_mystery_recipe(1, "RTThrower-long-handed-inserter-Item", "long-handed-inserter")
  add_mystery_recipe(1, "RTThrower-bulk-inserter-Item", "bulk-inserter")
  if settings.startup["RTModdedThrowers"].value then
    add_mystery_recipe(1, "RTThrower-cube-extremely-long-inserter-Item", "cube-extremely-long-inserter")
  end
end