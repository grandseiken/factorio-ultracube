require("prototypes.lib.mystery")

-- Mystery recipes for throwers
if (settings.startup["RTThrowersSetting"].value == true) then -- Throwers are enabled
	-- Mystery recipes for throwers
	add_mystery_recipe(1, "RTThrower-fast-inserter-Item", "RTThrower-inserter-Item") -- Fast thrower to regular thrower
	-- thrower variants to base inserters
	add_mystery_recipe(1, "RTThrower-inserter-Item", "inserter")
	add_mystery_recipe(1, "RTThrower-long-handed-inserter-Item", "long-handed-inserter")
	add_mystery_recipe(1, "RTThrower-filter-inserter-Item", "filter-inserter")
	add_mystery_recipe(1, "RTThrower-stack-inserter-Item", "stack-inserter")
	add_mystery_recipe(1, "RTThrower-stack-filter-inserter-Item", "stack-filter-inserter")

	-- Modded variants
	if settings.startup["RTModdedThrowers"].value == true then
		add_mystery_recipe(1, "RTThrower-cube-extremely-long-inserter-Item", "cube-extremely-long-inserter")
	end
end