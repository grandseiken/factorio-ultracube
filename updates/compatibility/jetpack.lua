if mods["jetpack"] then
  local craft_category = "cube-fabricator-handcraft"
  local equip_category = {"cube-armor"}

  local pack1_recipe = data.raw.recipe["jetpack-1"]
  -- Based on vanilla tier 1 + tier 2.
  -- Tier 1 original recipe: 10 steel, 10 pipes, 10 green circuits.
  -- Tier 2 original recipe: 2 jetpack 1, 20 E-engines, 20 red circuits.
  pack1_recipe.ingredients = {
    {"cube-sophisticated-matter-unit", 10},
    {"cube-advanced-engine", 10},
    {"cube-advanced-circuit", 10},
  }
  pack1_recipe.category = craft_category

  local pack1_tech = data.raw.technology["jetpack-1"]
  pack1_tech.unit = tech_cost_unit("2", 240)
  pack1_tech.prerequisites =
      {"cube-sophisticated-matter-unit", "cube-fuel-refinery", "cube-modular-armor"}

  local item = data.raw.item["jetpack-1"]
  item.order = "cube-" .. item.order
  item.subgroup = "cube-utility"

  data.raw["battery-equipment"]["jetpack-1"].categories = equip_category

  -- Equivalent to vanilla tier 3. Original recipe: 2 jetpack 2, 30 LDS, 30 blue circuits.
  local pack2_recipe = data.raw.recipe["jetpack-2"]
  pack2_recipe.ingredients = {
    {"jetpack-1", 2},
    {"cube-resplendent-plate", 20},
    {"cube-arcane-drive", 20}, -- Arcane drive already contains the other 2 ingredients so this
                               -- feels a little redundant, but it fits with the pattern already
                               -- established.
    {"cube-spectral-processor", 20}
  }
  pack2_recipe.category = craft_category

  local pack2_tech = data.raw.technology["jetpack-2"]
  pack2_tech.unit = tech_cost_unit("5", 360)
  pack2_tech.prerequisites = {"jetpack-1", "cube-arcane-drive"}

  item = data.raw.item["jetpack-2"]
  item.order = "cube-" .. item.order
  item.subgroup = "cube-utility"

  data.raw["battery-equipment"]["jetpack-2"].categories = equip_category

  -- Equivalent to vanilla tier 4. This should have 4 thrust so that the max thrust is the same
  -- as it is with the regular jetpack mod, but thrust is hardcoded for each jetpack. The only way
  -- to make this 4 thrust is by using the jetpack 4 item prototype and pretend it's tier 3.
  local pack3_recipe = data.raw.recipe["jetpack-4"]
  pack3_recipe.ingredients = {
    {"jetpack-2", 4}, -- May seem extreme, but still a similar cost to the original tier 4.
    {"cube-ultradense-composite", 40}, -- lol
    {"cube-speed-module-v3", 40},
    {"cube-efficiency-module-v3", 40},
  }
  pack3_recipe.results = {
    {"jetpack-4", 1},
    {
      type = "item",
      name = "cube-ultradense-debris",
      amount = 160,
      catalyst_amount = 160,
    },
  }
  pack3_recipe.main_product = "jetpack-4"
  pack3_recipe.localised_name = {"item-name.jetpack-3"}
  pack3_recipe.category = craft_category

  -- Use the actual jetpack 3 tech prototype so that the number that appears on it is correct.
  -- Everything else uses the jetpack 4 prototypes so that the thrust is correct and the original 
  -- jetpack 3 is pruned by disable_incompatible.lua.
  local pack3_tech = data.raw.technology["jetpack-3"]
  pack3_tech.effects[1].recipe = "jetpack-4"
  pack3_tech.unit = tech_cost_unit("6", 420)
  pack3_tech.prerequisites = {"jetpack-2", "cube-speed-module-v3", "cube-efficiency-module-v3"}

  item = data.raw.item["jetpack-4"]
  item.localised_name = {"item-name.jetpack-3"}
  item.icon = "__jetpack__/graphics/icons/jetpack-3.png" -- The cube-enhanced jetpack shall be blue.
  item.order = "cube-" .. item.order
  item.subgroup = "cube-utility"

  local equipment = data.raw["battery-equipment"]["jetpack-4"]
  equipment.categories = equip_category
  equipment.localised_name = {"equipment-name.jetpack-3"}
  equipment.sprite.filename = "__jetpack__/graphics/equipment/jetpack-3.png"

  add_mystery_recipe(1, "jetpack-1", "pipe")
  add_mystery_recipe(2, "jetpack-2", "jetpack-1")
  add_mystery_recipe(4, "jetpack-4", "jetpack-2")

  data.raw.technology["jetpack-4"].enabled = false
  data.raw.technology["jetpack-4"].hidden = true
  data.raw.recipe["jetpack-3"].enabled = false
  data.raw.recipe["jetpack-3"].hidden = true
end
