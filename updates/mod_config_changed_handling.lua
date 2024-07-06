-- Table of all on_config_changed handlers 
local mod_config_changed_handlers = {
	require("compatibility.renai_transportation_config_changed"),
}

local mod_config_changed = {
	-- Runs all mod-specific on_configuration_changed handler functions 
	run_handlers = function(ConfigurationChangedData)
		for _, handler in ipairs(mod_config_changed_handlers) do
			handler(ConfigurationChangedData)
		end
	end
}

return mod_config_changed