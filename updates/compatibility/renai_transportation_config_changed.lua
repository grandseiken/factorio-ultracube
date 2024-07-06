return function(ConfigurationChangedData)
	-- TODO: Would probably be appropriate to move the following function to some utility function script for use by future mod config_changed scripts - Wrothmonk
	-- Converts a mod's version number string to a table consisting of {major, minor, sub} version numbers, and allows comparison to other version number tables
	local function mod_version_str_to_comparible(v_string)
		-- Convert to list consisting of {major, minor, sub} version number strings
		local result = {string.match(v_string, "(%d+)%.(%d+)%.(%d+)")}

		-- convert to actual numerical values
		for i = 1, 3, 1 do
			result[i] = tonumber(result[i])
		end

		-- Implement comparison functions via metatable
		setmetatable(result, {
			__eq = function(a, b) return a[1] == b[1] and a[2] == b[2] and a[3] == b[3] end,
			__lt = function(a, b) return
				a[1] < b[1] -- Major version is less
				or (a[1] == b[1] and -- Major version is the same and...
					(a[2] < b[2] -- Minor version is less
						or (a[2] == b[2] and a[3] < b[3]) -- or Minor version is the same and Sub version is less
					)
				)
			end
		})

		return result
	end

	local mod_change = ConfigurationChangedData.mod_changes["RenaiTransportation"] -- version change info for Renai Transportation, if applicable

	-- Renai Transportation has had a version update
	if mod_change and mod_change.old_version and mod_change.new_version then
		local old_version = mod_version_str_to_comparible(mod_change.old_version)
		local new_version = mod_version_str_to_comparible(mod_change.new_version)
		local filter_migration_version = mod_version_str_to_comparible("1.3.0") -- Version that added filter ejector hatches
		if old_version < filter_migration_version and new_version >= filter_migration_version then -- Renai Transportation 1.3.0 migrations were just run on this save
			-- Renai Transportation force enables the base filter ejector hatch recipe during 1.3.0 migrations, so we need to undo that
			for each, force in pairs(game.forces) do
				force.recipes["RTThrower-FilterEjectorHatchRTRecipe"].enabled = false
			end
		end
	end
end