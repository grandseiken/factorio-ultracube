local function remove_unlock_recipe(tech_effects, recipe)
  local index = nil
  for i = 1, #tech_effects do
    local effect = tech_effects[i]
    if effect.type == "unlock-recipe" and effect.recipe == recipe then
      index = i
      break
    end
  end
  if index then
    table.remove(tech_effects, index)
  end
end

if mods["WireShortcuts"] then
  local recipe = data.raw.recipe["fake-red-wire"]
  if recipe then
    recipe.ingredients = {
      {type = "item", name = "cube-electronic-circuit", amount = 1},
      {type = "item", name = "copper-cable", amount = 1},
    }
    recipe.category = "cube-fabricator-handcraft"
  end
  recipe = data.raw.recipe["fake-green-wire"]
  if recipe then
    recipe.ingredients = {
      {type = "item", name = "cube-electronic-circuit", amount = 1},
      {type = "item", name = "copper-cable", amount = 1},
    }
    recipe.category = "cube-fabricator-handcraft"
  end
  data.raw.shortcut["WireShortcuts-give-copper"].technology_to_unlock = "cube-electronics"
  data.raw.shortcut["WireShortcuts-give-cutter"].technology_to_unlock = "cube-combinatorics"
  data.raw.shortcut["WireShortcuts-give-green"].technology_to_unlock = "cube-combinatorics"
  data.raw.shortcut["WireShortcuts-give-red"].technology_to_unlock = "cube-combinatorics"

  local tech_effects = data.raw.technology["cube-combinatorics"].effects
  if settings.startup["wire-shortcuts-is-retain-wire-crafting"].value then
    table.insert(tech_effects, {type = "unlock-recipe", recipe = "fake-red-wire"})
    table.insert(tech_effects, {type = "unlock-recipe", recipe = "fake-green-wire"})
  end
end
