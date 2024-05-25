if mods["RenaiTransportation"] then
	-- Conversion of vanilla items to rough equivalents in Ultracube
	local recipe_item_conversion = {
		["iron-plate"] = "cube-basic-matter-unit",
		["copper-plate"] = "cube-basic-matter-unit",
		["steel-plate"] = "cube-rare-metals",
		["automation-science-pack"] = "cube-basic-contemplation-unit", -- shows up in bounce pad recipes for some reason, may want to change this
		["electronic-circuit"] = "cube-electronic-circuit",
		["advanced-circuit"] = "cube-advanced-circuit",

		-- Items that can stay as-is
		["iron-chest"] = true,
		["concrete"] = true,
		["constant-combinator"] = true,
		["pipe"] = true,
		["pipe-to-ground"] = true,
		["rail"] = true,
		["accumulator"] = true,
		["substation"] = true,
		["refined-concrete"] = true,
		["cargo-wagon"] = true,
	}

	-- Conversion of vanilla science items to Ultracube science equivalents
	local tech_item_conversion = {
		["automation-science-pack"] = "cube-basic-contemplation-unit",
		["logistic-science-pack"] = "cube-fundamental-comprehension-card",
		["chemical-science-pack"] = "cube-abstract-interrogation-card"
	}

	-- Conversion of prerequisite techs from vanilla to Ultracube
	local tech_prerequisite_conversion = {
		["logistic-science-pack"] = "cube-fundamental-comprehension-card",
		["advanced-electronics"] = "cube-advanced-electronics",
		["circuit-network"] = "cube-combinatorics",
		["railway"] = "cube-railway",
		["concrete"] = "cube-concrete",
		["electric-energy-accumulators"] = "cube-electric-energy-accumulators",
		["electric-energy-distribution-2"] = "cube-electric-energy-distribution-2",
	}
	
	-- All technologies that can be handled completely automatically or with minor tweaks afterward
	local renai_auto_techs = {
		"se~no", -- Starter tech for most of Renai Transport
		"HatchRTTech", -- Hatches for machines
		"EjectorHatchRTTech", -- Ejector hatch
		"RTSimonSays", -- Director bounce pad
		"SignalPlateTech", -- Signal bounce pad
		"RTFlyingFreight", -- Train ramp
		"RTMagnetTrainRamps", -- Magnetic train ramp
		"RTImpactTech", -- Impact wagon & unloader (Unloader requires refined concrete)
		"RTFreightPlates", -- Train bounce pads
	}

	-- All recipes that can be handled completely automatically or with minor tweaks afterward
	local renai_auto_recipes = {
		-- Default-enabled recipes
		"BouncePlateRecipie",
		"OpenContainerRecipie",
		"OpenContainerRevertRecipie",

		"DirectedBouncePlateRecipie", -- se~no
		"PlayerLauncherRecipie", -- se~no
		"HatchRTRecipe", -- HatchRTTech
		"RTThrower-EjectorHatchRTRecipe", -- EjectorHatchRTTech
		"DirectorBouncePlateRecipie", -- RTSimonSays
		"SignalBouncePlateRecipie", -- SignalPlateTech
		"RTTrainRampRecipe", -- RTFlyingFreight
		"RTMagnetTrainRampRecipe", -- RTMagnetTrainRamps
		"RTImpactWagonRecipe", -- RTImpactTech
		"RTImpactUnloaderRecipe", -- RTImpactTech (Recipe is changed to use regular concrete)
		"RTTrainBouncePlateRecipie", -- RTFreightPlates
		"RTTrainDirectedBouncePlateRecipie" -- RTFreightPlates
	}

	local valid_recipes = {} -- List of recipes that have cube- equivalents created

	-- Fully automatic recipe creation
	for _, recipe_name in ipairs(renai_auto_recipes) do
		if data.raw.recipe[recipe_name] then
			local recipe_is_valid = true
			local cube_recipe = table.deepcopy(data.raw.recipe[recipe_name])
			cube_recipe.name = "cube-"..recipe_name
			for _, ingredient in ipairs(cube_recipe.ingredients) do
				local ingredient_name = ingredient[1]
				if recipe_item_conversion[ingredient_name] then -- Item is in conversion list
					if type(recipe_item_conversion[ingredient_name]) == "string" then -- Item has equivalent
						ingredient[1] = recipe_item_conversion[ingredient_name]
					end
				else
					log("Ultracube+Renai - Unrecognised ingredient: " .. ingredient_name .. " in recipe: " .. recipe_name)
					recipe_is_valid = false -- Ingredient isn't recognized, so Renai must have changed its recipe to something not handled already
				end
			end
			if recipe_is_valid then
				data:extend({cube_recipe}) -- Add cube- recipe to data
				valid_recipes[recipe_name] = true -- add to list of handled recipes
				recipe_item_conversion[cube_recipe.result] = true -- add result of recipe to items that can stay as-is
			end
		end
	end

	-- Recipe adjustments

	--[[
	Impact unloader normally requires refined concrete, but that's behind purple card tech.
	That's extremely far above the green card requirement for the technology that unlocks it,
	so it's probably best to replace it with regular concrete. 
	]]
	if data.raw.recipe["cube-RTImpactUnloaderRecipe"] then -- Cube recipe for impact unloader was created
		for _, ingredient in ipairs(data.raw.recipe["cube-RTImpactUnloaderRecipe"].ingredients) do
			if ingredient[1] == "refined-concrete" then
				ingredient[1] = "concrete"
				break
			end
		end
	end

	-- Fully automatic technology editing
	for _, tech_name in ipairs(renai_auto_techs) do
		if data.raw.technology[tech_name] then
			local is_valid_tech = true
			local tech = data.raw.technology[tech_name]

			-- Convert prerequisite technologies
			if tech.prerequisites then -- tech has prerequisites
				for prereq_index, prereq_name in ipairs(tech.prerequisites) do
					if tech_prerequisite_conversion[prereq_name] then -- is a recognized prerequisite
						if type(tech_prerequisite_conversion[prereq_name]) == "string" then -- is a tech that needs conversion
							tech.prerequisites[prereq_index] = tech_prerequisite_conversion[prereq_name]
						end
					else
						log("Ultracube+Renai - Unrecognised prerequisites: " .. prereq_name .. " in tech: " .. tech_name)
						is_valid_tech = false
					end
				end
			end

			-- Convert recipe unlocks
			for _, effect in ipairs(tech.effects) do
				if effect.type == "unlock-recipe" then -- Tech unlocks a recipe
					if valid_recipes[effect.recipe] then -- Recipe is one with a cube- equivalent we've already added
						effect.recipe = "cube-".. effect.recipe
					else
						log("Ultracube+Renai - Unrecognised recipe: " .. effect.recipe .. " in tech: " .. tech_name)
						is_valid_tech = false
					end
				end
			end

			-- Convert tech cost items
			if is_valid_tech then -- Only convert items if we've been able to properly update the original tech up to this point
				for _, ingredient in ipairs(tech.unit.ingredients) do
					local ingredient_name = ingredient[1]
					if tech_item_conversion[ingredient_name] then
						ingredient[1] = tech_item_conversion[ingredient_name]
					else
						log("Ultracube+Renai - Unrecognised research item: " .. ingredient_name .. " in tech: " .. tech_name)
						is_valid_tech = false
					end
				end
			end

			if is_valid_tech then
				tech_prerequisite_conversion[tech_name] = true -- Add tech to recognized prerequisites
			end
		end
	end
end