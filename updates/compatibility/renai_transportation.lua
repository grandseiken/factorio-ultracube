if mods["RenaiTransportation"] then
  if data.raw.container["OpenContainer"] then
    data.raw.container["OpenContainer"].inventory_size = data.raw.container["iron-chest"].inventory_size
  end
  if data.raw.container["RTCatchingChute"] then
    data.raw.container["RTCatchingChute"].inventory_size = data.raw.container["iron-chest"].inventory_size
  end

  -- Conversion of vanilla items to rough equivalents in Ultracube.
  local recipe_item_conversion = {
    ["iron-plate"] = "cube-basic-matter-unit",
    ["copper-plate"] = "cube-basic-matter-unit",
    ["steel-plate"] = "cube-rare-metals",
    -- Shows up in bounce pad recipes for some reason, may want to change this.
    ["automation-science-pack"] = "cube-basic-contemplation-unit",
    ["electronic-circuit"] = "cube-electronic-circuit",
    ["advanced-circuit"] = "cube-advanced-circuit",
    ["processing-unit"] = "cube-spectral-processor",

    -- Items that can stay as-is.
    ["iron-chest"] = true,
    ["concrete"] = true,
    ["constant-combinator"] = true,
    ["pipe"] = true,
    ["pipe-to-ground"] = true,
    ["pump"] = true,
    ["rail"] = true,
    ["accumulator"] = true,
    ["substation"] = true,
    ["refined-concrete"] = true,
    ["cargo-wagon"] = true,
    ["copper-cable"] = true,
  }

  -- Conversion of vanilla science items to Ultracube science equivalents.
  local tech_item_conversion = {
    ["automation-science-pack"] = "cube-basic-contemplation-unit",
    ["logistic-science-pack"] = "cube-fundamental-comprehension-card",
    ["chemical-science-pack"] = "cube-abstract-interrogation-card",
    ["production-science-pack"] = "cube-deep-introspection-card",
  }

  -- Conversion of prerequisite techs from vanilla to Ultracube.
  local tech_prerequisite_conversion = {
    ["logistic-science-pack"] = "cube-fundamental-comprehension-card",
    ["production-science-pack"] = "cube-deep-introspection-card",
    ["advanced-circuit"] = "cube-advanced-electronics",
    ["circuit-network"] = "cube-combinatorics",
    ["railway"] = "cube-railway",
    ["concrete"] = "cube-concrete",
    ["electric-energy-accumulators"] = "cube-electric-energy-accumulators",
    ["electric-energy-distribution-2"] = "cube-electric-energy-distribution-2",
  }

  -- All technologies that can be handled completely automatically or with minor tweaks afterward.
  local renai_auto_techs = {
    "se-no",  -- Starter tech for most of Renai Transport
    "HatchRTTech",  -- Hatches for machines
    "EjectorHatchRTTech",  -- Ejector hatch
    "RTSimonSays",  -- Director bounce pad
    "SignalPlateTech",  -- Signal bounce pad
    "RTFlyingFreight",  -- Train ramp
    "RTMagnetTrainRamps",  -- Magnetic train ramp
    "RTImpactTech",  -- Impact wagon and unloader (unloader requires refined concrete)
    "RTFreightPlates",  -- Train bounce pads
    "RTVacuumHatchTech",  -- Vacuum hatches
    "RTItemCannonTech",  -- Item cannons
    "RTItemCannonLogisticsTech",  -- Item cannon logistic chutes
    "RTTrapdoorWagonTech",  -- Trapdoor wagons
    "RTSwitchRampTech",  -- Switch ramps
  }

  -- All recipes that can be handled completely automatically or with minor tweaks afterward
  local renai_auto_recipes = {
    -- Default-enabled recipes.
    "RTBouncePlate",
    "OpenContainer",
    "OpenContainerRevertRecipe",

    "DirectedBouncePlate",
    "PlayerLauncher",
    "HatchRT",  -- HatchRTTech
    "RTThrower-EjectorHatchRT",  -- EjectorHatchRTTech
    "DirectorBouncePlate",  -- RTSimonSays
    "SignalBouncePlate",  -- SignalPlateTech
    "RTTrainRamp",  -- RTFlyingFreight
    "RTMagnetTrainRamp",  -- RTMagnetTrainRamps
    "RTImpactWagon",  -- RTImpactTech
    "RTImpactUnloader",  -- RTImpactTech (Recipe is changed to use regular concrete)
    "RTTrainBouncePlate",  -- RTFreightPlates
    "RTTrainDirectedBouncePlate",  -- RTFreightPlates
    "RTVacuumHatch",  -- RTVacuumHatchTech
    "RTRicochetPanel",  -- RTItemCannonTech
    "RTCatchingChute",  -- RTItemCannonTech
    "RTDivergingChute",  -- RTItemCannonLogisticsTech
    "RTMergingChute",  -- RTItemCannonLogisticsTech
    "RTTrapdoorSwitch",  -- RTTrapdoorWagonTech
    "RTSwitchTrainRamp",  -- RTSwitchRampTech
    "RTMagnetSwitchTrainRamp",  -- RTSwitchRampTech
  }

  local valid_recipes = {} -- List of recipes that have cube-equivalents created or have been updated to be compatible.

  -- Fully automatic recipe updating.
  for _, recipe_name in ipairs(renai_auto_recipes) do
    if data.raw.recipe[recipe_name] then
      local recipe_is_valid = true
      local cube_recipe = data.raw.recipe[recipe_name]
      for _, ingredient in ipairs(cube_recipe.ingredients) do
        local ingredient_name = ingredient.name
        if recipe_item_conversion[ingredient_name] then -- Item is in conversion list
          if type(recipe_item_conversion[ingredient_name]) == "string" then -- Item has equivalent
            ingredient.name = recipe_item_conversion[ingredient_name]
          end
        else
          log("Ultracube+Renai - Unrecognised ingredient: " .. ingredient_name .. " in recipe: " .. recipe_name)
          -- Ingredient isn't recognized, so Renai must have changed its recipe to something not handled already.
          recipe_is_valid = false
        end
      end
      if recipe_is_valid then
        cube_recipe.category = "cube-fabricator-handcraft"
        valid_recipes[recipe_name] = true  -- add to list of handled recipes
        recipe_item_conversion[cube_recipe.results[1].name] = true  -- add result of recipe to items that can stay as-is
      end
    end
  end

  -- Recipe adjustments

  --[[
  Impact unloader normally requires refined concrete, but that's behind purple card tech.
  That's extremely far above the green card requirement for the technology that unlocks it,
  so it's probably best to replace it with regular concrete.
  ]]
  if valid_recipes["RTImpactUnloader"] then -- Recipe for impact unloader was updated
    for _, ingredient in ipairs(data.raw.recipe["RTImpactUnloader"].ingredients) do
      if ingredient.name == "refined-concrete" then
        ingredient.name = "concrete"
        break
      end
    end
  end

  -- Replace steel-plate and discharge-defense-equipment in item cannons
  if data.raw.recipe["RTItemCannon"] then
    data.raw.recipe["RTItemCannon"].ingredients = {
      {type = "item", name = "refined-concrete", amount = 100},
      {type = "item", name = "cube-resplendent-plate", amount = 50},
      {type = "item", name = "cube-spectral-processor", amount = 10},
      -- Not exactly equivalent but whatever
      {type = "item", name = "cube-advanced-engine", amount = 50},
      {type = "item", name = "accumulator", amount = 50},
    }
    valid_recipes["RTItemCannon"] = true
  end

  -- Replace iron-gear-wheel and iron-stick in trapdoor wagons
  if data.raw.recipe["RTTrapdoorWagon"] then
    data.raw.recipe["RTTrapdoorWagon"].ingredients = {
      {type = "item", name = "cube-basic-matter-unit", amount = 9},  -- 4 iron-gear-wheel + 2 iron-stick = 9 iron-plate
      {type = "item", name = "cube-advanced-circuit", amount = 20},
      {type = "item", name = "cargo-wagon", amount = 1},
    }
    valid_recipes["RTTrapdoorWagon"] = true
  end

  -- Tech adjustments before automatic editing

  -- Remove automation-science-pack prerequisite from root Renai tech
  if data.raw.technology["se-no"] then
    data.raw.technology["se-no"].prerequisites = {}
  end

  -- Adjust RTItemCannonTech prerequisites
  if data.raw.technology["RTItemCannonTech"] then
    data.raw.technology["RTItemCannonTech"].prerequisites = {
      "se-no",
      "cube-refined-concrete",
      "cube-electric-energy-accumulators",
      "cube-spectral-processor",
      "cube-deep-introspection-card"
    }
  end


  -- Fully automatic technology editing.
  for _, tech_name in ipairs(renai_auto_techs) do
    if data.raw.technology[tech_name] then
      local is_valid_tech = true
      local tech = data.raw.technology[tech_name]

      -- Convert prerequisite technologies.
      if tech.prerequisites then -- tech has prerequisites
        for prereq_index, prereq_name in ipairs(tech.prerequisites) do
          if tech_prerequisite_conversion[prereq_name] then  -- is a recognized prerequisite
            if type(tech_prerequisite_conversion[prereq_name]) == "string" then  -- is a tech that needs conversion
              tech.prerequisites[prereq_index] = tech_prerequisite_conversion[prereq_name]
            end
          elseif not string.find(prereq_name, "^cube-") then -- is not an Ultracube prerequisite
            log("Ultracube+Renai - Unrecognised prerequisites: " .. prereq_name .. " in tech: " .. tech_name)
            is_valid_tech = false
          end
        end
      end

      -- Convert recipe unlocks.
      for _, effect in ipairs(tech.effects) do
        if effect.type == "unlock-recipe" then -- Tech unlocks a recipe
          if not valid_recipes[effect.recipe] then -- Recipe is one we haven't updated
            log("Ultracube+Renai - Unrecognised recipe: " .. effect.recipe .. " in tech: " .. tech_name)
            is_valid_tech = false
          end
        end
      end

      -- Convert tech cost items.
      if is_valid_tech then
        -- Only convert items if we've been able to properly update the original tech up to this point.
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

  -- Manual recipes/techs

  -- Thrower inserters and belt ramps
  if settings.startup["RTThrowersSetting"].value then -- Throwers are enabled
    --[[
    Since Ultracube has inserters available before electronic circuits/copper cable,
    I'm opting to replace the normal copper cable cost to convert inserters to throwers with basic matter units.
    ]]
    local inserter_list = {
      "fast-inserter",
      "long-handed-inserter",
      "bulk-inserter",
    }
    if settings.startup["RTModdedThrowers"].value then  -- Renai will generate throwers for modded inserters.
      -- Ultracube's extremely long filter inserter. Why you would want to use a thrower version of this,
      -- I have no idea.
      inserter_list[#inserter_list + 1] = "cube-extremely-long-inserter"
      -- TODO: If there's ever any mods made compatible that add inserters, append their names to inserter_list based
      -- on them being active.
    end

    -- generate recipes for all inserters in inserter_list
    for _, inserter_name in ipairs(inserter_list) do
      data:extend({{
        type = "recipe",
        name = "cube-RTThrower-" .. inserter_name .. "-Recipe",
        localised_name = "Thrower " .. inserter_name:gsub("-i"," i"),
        enabled = false,
        energy_required = 1,
        ingredients = {
          {type = "item", name = inserter_name, amount = 1},
          {type = "item", name = "cube-basic-matter-unit", amount = 4}
        },
        --[[
        This item isn't created until Renai Transport's data-final-fixes.lua runs, but this seems to work OK so long
        as the item is actually created by the end of the prototype phase. May want to add a check in Ultracube's
        data-final-fixes to remove any invalid recipes in the incredibly unlikely scenario Renai Transport fails to
        generate the inserters.
        ]]
        results = {{type = "item", name = "RTThrower-" .. inserter_name .. "-Item", amount = 1}},
        category = "cube-fabricator-handcraft",
      }})
    end

    -- add thrower inserter equivalents to Ultracube inserter tech
    local effects = data.raw.technology["cube-inserters"].effects
    effects[#effects + 1] = {type = "unlock-recipe", recipe = "cube-RTThrower-fast-inserter-Recipe"}
    effects[#effects + 1] = {type = "unlock-recipe", recipe = "cube-RTThrower-long-handed-inserter-Recipe"}

    -- Thrower techs
    data:extend({
      {
        -- Stack thrower inserters + modded inserters, normally is all thrower insterters >= fast inserters.
        type = "technology",
        name = "RTThrowerTime",
        icon = "__RenaiTransportation__/graphics/technology/ThrowerTech.png",
        icon_size = 256,
        effects = {
          {type = "unlock-recipe", recipe = "cube-RTThrower-bulk-inserter-Recipe"},
        },
        prerequisites = {"cube-bulk-inserters"},
        unit = tech_cost_unit("1b", 50),
        -- original
        --[[ {
        count = 50,
        ingredients =
        {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
        },
        time = 20
        } ]]
      },
      {
        -- Control over thrower inserter distance. This one could've been automated if not for needing a custom
        -- RTThrowerTime tech.
        type = "technology",
        name = "RTFocusedFlinging",
        icon = "__RenaiTransportation__/graphics/technology/focus.png",
        icon_size = 256,
        effects = {
          {
            type = "nothing",
            effect_description = "Thrower Range 1-15 tiles",
          },
          {
            type = "nothing",
            effect_description = "Thrower Range can be set by this signal",
            icon = "__RenaiTransportation__/graphics/icons/RangeSignaling.png",
            icon_size = 64,
          },
        },
        -- Option 1 & 3
        prerequisites = {"RTThrowerTime", "cube-extremely-long-inserter"},
        -- Option 2
        --prerequisites = {"se~no", "cube-fundamental-comprehension-card", "cube-inserters"},
        unit = tech_cost_unit("2", 300), -- Bumped up to match extremely-long-inserter tier
        -- original
        --[[ {
        count = 75,
        ingredients =
        {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
        },
        time = 30
        } ]]
      }
    })

    -- Add modded recipes to RTThrowerTime
    if settings.startup["RTModdedThrowers"].value then
      -- Modded thrower inserters are enabled, and thus are generated by Renai Transport.
      -- TODO: If there's ever any mods made compatible that add inserters, add those recipes to RTThrowerTime here.
      local effects = data.raw.technology["RTFocusedFlinging"].effects
      effects[#effects + 1] = {type = "unlock-recipe", recipe = "cube-RTThrower-cube-extremely-long-inserter-Recipe"}
    end

    -- Belt ramps (including ultrafast belts)
    -- Hijacking RTturboBeltRamp name so scripts work
    v4BeltEntity = table.deepcopy(data.raw["transport-belt"]["RTexpressBeltRamp"])
    v4BeltEntity.type = "transport-belt"
    v4BeltEntity.name = "RTturboBeltRamp"
    v4BeltEntity.localised_name = "Ultrafast belt ramp"
    v4BeltEntity.icons[2].tint = {216, 7, 249}
    v4BeltEntity.minable.result = "RTturboBeltRamp"
    v4BeltEntity.corpse = "cube-v4-transport-belt-remnant"
    v4BeltEntity.animation_speed_coefficient = 128
    v4BeltEntity.belt_animation_set.animation_set.layers[2].tint = {216, 7, 249}
    v4BeltEntity.radius_visualisation_specification.distance = 40

    v4BeltItem = table.deepcopy(data.raw["item"]["RTexpressBeltRamp"])
    v4BeltItem.type = "item"
    v4BeltItem.name = "RTturboBeltRamp"
    v4BeltItem.icons[2].tint = {216, 7, 249}
    v4BeltItem.order = "e-d"
    v4BeltItem.place_result = "RTturboBeltRamp"

    data:extend({
      v4BeltEntity,
      v4BeltItem,
      {
        type = "recipe",
        name = "RTfastBeltRamp",
        enabled = false,
        energy_required = 1,
        ingredients = {
          {type = "item", name = "fast-transport-belt", amount = 2},
          {type = "item", name = "cube-advanced-engine", amount = 1},
          {type = "item", name = "cube-basic-matter-unit", amount = 4}, -- 2 iron-gear-wheel = 4 iron-plate
        },
        results = {{type = "item", name = "RTfastBeltRamp", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "recipe",
        name = "RTexpressBeltRamp",
        enabled = false,
        energy_required = 1,
        ingredients = {
          {type = "item", name = "express-transport-belt", amount = 2},
          {type = "item", name = "cube-advanced-engine", amount = 1},
          {type = "item", name = "cube-basic-matter-unit", amount = 4},
        },
        results = {{type = "item", name = "RTexpressBeltRamp", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "recipe",
        name = "RTturboBeltRamp",
        localised_name = "Ultrafast belt ramp",
        enabled = false,
        energy_required = 1,
        ingredients = {
          {type = "item", name = "cube-v4-transport-belt", amount = 2},
          {type = "item", name = "cube-advanced-engine", amount = 1},
          {type = "item", name = "cube-basic-matter-unit", amount = 4},
        },
        results = {{type = "item", name = "RTturboBeltRamp", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "technology",
        name = "RTBeltRampTech",
        icon = "__RenaiTransportation__/graphics/technology/BeltRampTech.png",
        icon_size = 256,
        effects = {
          {type = "unlock-recipe", recipe = "RTfastBeltRamp"},
          {type = "unlock-recipe", recipe = "RTexpressBeltRamp"},
          {type = "unlock-recipe", recipe = "RTturboBeltRamp"},
        },
        prerequisites = {"se-no", "cube-advanced-engine", "cube-logistics"},
        unit = {
          count = 200,
          ingredients = {
              {"cube-basic-contemplation-unit", 1},
              {"cube-fundamental-comprehension-card", 1},
              {"cube-abstract-interrogation-card", 1},
          },
          time = 45,
        }
      }
    })
  end

  -- Ziplines.
  if settings.startup["RTZiplineSetting"].value then
    local zipline_items = {
      "RTZiplineTrolley",
      "RTZiplineTrolley2",
      "RTZiplineTrolley3",
      "RTZiplineTrolley4",
      "RTZiplineTrolley5",
      "RTZiplineControls",
      "RTZiplineCrankControls",
      "RTProgrammableZiplineControls",
    }
    for _, item in ipairs(zipline_items) do
      if data.raw.gun[item] then
        data.raw.gun[item].subgroup = "cube-utility"
      elseif data.raw.ammo[item] then
        data.raw.ammo[item].subgroup = "cube-utility"
      end
    end
    data:extend({
      {
        type = "recipe",
        name = "RTZiplineTrolley",
        enabled = false,
        energy_required = 0.5,
        ingredients = {
          {type = "item", name = "copper-cable", amount = 100},
          {type = "item", name = "cube-basic-matter-unit", amount = 100}, -- 50 iron-gear-wheel = 100 iron-plate
          {type = "item", name = "cube-electronic-circuit", amount = 4},
          {type = "item", name = "PlayerLauncher", amount = 1},
          {type = "item", name = "iron-chest", amount = 1},
        },
        results = {{type = "item", name = "RTZiplineTrolley", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "recipe",
        name = "RTZiplineControls",
        enabled = false,
        energy_required = 0.5,
        ingredients = {
          {type = "item", name = "copper-cable", amount = 10},
          {type = "item", name = "cube-basic-matter-unit", amount = 5}, -- 6 iron-sticks = 3 iron-plate
          {type = "item", name = "cube-electronic-circuit", amount = 2}
        },
        results = {{type = "item", name = "RTZiplineControls", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "recipe",
        name = "RTZiplineCrankControls",
        enabled = false,
        energy_required = 0.5,
        ingredients = {
          {type = "item", name = "RTZiplineControls", amount = 1},
          {type = "item", name = "cube-basic-matter-unit", amount = 21} -- 2 iron-sticks + 10 iron-gear-wheel = 21 iron-plate
        },
        results = {{type = "item", name = "RTZiplineCrankControls", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "recipe",
        name = "RTProgrammableZiplineControls",
        enabled = false,
        energy_required = 0.5,
        ingredients = {
          {type = "item", name = "RTZiplineControls", amount = 1},
          {type = "item", name = "cube-electronic-circuit", amount = 5},
        },
        results = {{type = "item", name = "RTProgrammableZiplineControls", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "recipe",
        name = "RTZiplineTerminal",
        enabled = false,
        energy_required = 3,
        ingredients = {
          {type = "item", name = "medium-electric-pole", amount = 1},
          {type = "item", name = "cube-electronic-circuit", amount = 10},
          {type = "item", name = "cube-rare-metals", amount = 20},
          {type = "item", name = "concrete", amount = 25},
        },
        results = {{type = "item", name = "RTZiplineTerminal", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "recipe",
        name = "RTZiplineTrolley2",
        enabled = false,
        energy_required = 0.5,
        ingredients = {
          {type = "item", name = "cube-basic-matter-unit", amount = 200},
          {type = "item", name = "cube-basic-motor-unit", amount = 10},
          {type = "item", name = "RTZiplineTrolley", amount = 1},
        },
        results = {{type = "item", name = "RTZiplineTrolley2", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "recipe",
        name = "RTZiplineTrolley3",
        enabled = false,
        energy_required = 0.5,
        ingredients = {
          {type = "item", name = "cube-basic-matter-unit", amount = 300},
          {type = "item", name = "cube-advanced-engine", amount = 10},
          {type = "item", name = "cube-advanced-circuit", amount = 10},
          {type = "item", name = "RTZiplineTrolley2", amount = 1},
        },
        results = {{type = "item", name = "RTZiplineTrolley3", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "recipe",
        name = "RTZiplineTrolley4",
        enabled = false,
        energy_required = 0.5,
        ingredients = {
          {type = "item", name = "cube-basic-matter-unit", amount = 400},
          {type = "item", name = "cube-vehicle-fuel", amount = 25},
          {type = "item", name = "cube-spectral-processor", amount = 5},
          {type = "item", name = "RTZiplineTrolley3", amount = 1},
        },
        results = {{type = "item", name = "RTZiplineTrolley4", amount = 1}},
        category = "cube-fabricator-handcraft",
      },
      {
        type = "recipe",
        name = "RTZiplineTrolley5",
        enabled = false,
        energy_required = 0.5,
        ingredients = {
          {type = "item", name = "cube-basic-matter-unit", amount = 600},
          {type = "item", name = "cube-nuclear-fuel", amount = 5},
          {type = "item", name = "fission-reactor-equipment", amount = 1},
          {type = "item", name = "RTZiplineTrolley4", amount = 1},
        },
        results = {{type = "item", name = "RTZiplineTrolley5", amount = 1}},
        category = "cube-fabricator-handcraft"
      },
      {
        type = "technology",
        name = "RTZiplineTech",
        icon = "__RenaiTransportation__/graphics/technology/Zipline1.png",
        icon_size = 256,
        effects = {
          {type = "unlock-recipe", recipe = "RTZiplineTrolley"},
          {type = "unlock-recipe", recipe = "RTZiplineControls"},
        },
        prerequisites = {"cube-electronics"},
        unit = tech_cost_unit("0", 100),
      },
      {
        type = "technology",
        name = "RTZiplineControlTech1",
        icon = "__RenaiTransportation__/graphics/technology/Zipline_crankcontrols.png",
        icon_size = 256,
        effects = {
          {type = "unlock-recipe", recipe = "RTZiplineCrankControls"},
        },
        prerequisites = {"RTZiplineTech"},
        unit = tech_cost_unit("0", 50),
      },
      {
        type = "technology",
        name = "RTProgrammableZiplineControlTech",
        icon = "__RenaiTransportation__/graphics/technology/Zipline_terminaltech.png",
        icon_size = 256,
        effects = {
          {type = "unlock-recipe", recipe = "RTProgrammableZiplineControls"},
          {type = "unlock-recipe", recipe = "RTZiplineTerminal"},
        },
        prerequisites = {"RTZiplineTech", "cube-concrete"},
        unit = tech_cost_unit("1b", 150),
      },
      {
        type = "technology",
        name = "RTZiplineTech2",
        icons = {{
          icon = "__RenaiTransportation__/graphics/technology/Zipline1.png",
          icon_size = 256,
          tint = {1, 0.9, 0},
        }},
        effects = {
          {type = "unlock-recipe", recipe = "RTZiplineTrolley2"},
        },
        prerequisites = {"RTZiplineTech"},
        unit = tech_cost_unit("1a", 100),
      },
      {
        type = "technology",
        name = "RTZiplineTech3",
        icons = {{
          icon = "__RenaiTransportation__/graphics/technology/Zipline1.png",
          icon_size = 256,
          tint = {255, 35, 35},
        }},
        effects = {
          {type = "unlock-recipe", recipe = "RTZiplineTrolley3"},
        },
        prerequisites = {"RTZiplineTech2", "cube-abstract-interrogation-card"},
        unit = tech_cost_unit("2", 100),
      },
      {
        type = "technology",
        name = "RTZiplineTech4",
        icons = {{
          icon = "__RenaiTransportation__/graphics/technology/Zipline1.png",
          icon_size = 256,
          tint = {18, 201, 233},
        }},
        effects = {
          {type = "unlock-recipe", recipe = "RTZiplineTrolley4"},
        },
        prerequisites = {"RTZiplineTech3", "cube-fuel-refinery", "cube-spectral-processor"},
        unit = tech_cost_unit("2", 150),
      },
      {
        type = "technology",
        name = "RTZiplineTech5",
        icons = {{
          icon = "__RenaiTransportation__/graphics/technology/Zipline1.png",
          icon_size = 256,
          tint = {83, 255, 26},
        }},
        effects = {
          {type = "unlock-recipe", recipe = "RTZiplineTrolley5"},
        },
        prerequisites = {"RTZiplineTech4", "cube-fission-reactor-equipment"},
        unit = tech_cost_unit("3", 200),  -- Matched tier of fusion reactor equipment.
      }
    })
  end

end