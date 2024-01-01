if mods["WireShortcuts"] then
  local recipe = data.raw.recipe["fake-red-wire"]
  if recipe then
    recipe.ingredients = {
      {"cube-electronic-circuit", 1},
      {"copper-cable", 1},
    }
    recipe.category = "cube-fabricator-handcraft"
  end
  recipe = data.raw.recipe["fake-green-wire"]
  if recipe then
    recipe.ingredients = {
      {"cube-electronic-circuit", 1},
      {"copper-cable", 1},
    }
    recipe.category = "cube-fabricator-handcraft"
  end
  data.raw.shortcut["WireShortcuts-give-copper"].technology_to_unlock = "cube-electronics"
  data.raw.shortcut["WireShortcuts-give-cutter"].technology_to_unlock = "cube-combinatorics"
  data.raw.shortcut["WireShortcuts-give-green"].technology_to_unlock = "cube-combinatorics"
  data.raw.shortcut["WireShortcuts-give-red"].technology_to_unlock = "cube-combinatorics"
  if settings.startup["wire-shortcuts-is-retain-wire-crafting"].value then
    data.raw.technology["cube-combinatorics"].effects = {
      {type = "unlock-recipe", recipe = "cube-constant-combinator"},
      {type = "unlock-recipe", recipe = "cube-arithmetic-combinator"},
      {type = "unlock-recipe", recipe = "cube-decider-combinator"},
      {type = "unlock-recipe", recipe = "fake-red-wire"},
      {type = "unlock-recipe", recipe = "fake-green-wire"},
      {type = "unlock-recipe", recipe = "cube-programmable-speaker"},
      {type = "unlock-recipe", recipe = "cube-power-switch"},
    }
  else
    data.raw.technology["cube-combinatorics"].effects = {
      {type = "unlock-recipe", recipe = "cube-constant-combinator"},
      {type = "unlock-recipe", recipe = "cube-arithmetic-combinator"},
      {type = "unlock-recipe", recipe = "cube-decider-combinator"},
      {type = "unlock-recipe", recipe = "cube-programmable-speaker"},
      {type = "unlock-recipe", recipe = "cube-power-switch"},
    }
  end
end
