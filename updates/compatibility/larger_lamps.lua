if mods["DeadlockLargerLamp"] then
  local recipe = data.raw.recipe["deadlock-floor-lamp"]
  recipe.ingredients = {
    {type = "item", name = "cube-electronic-circuit", amount = 1},
    {type = "item", name = "copper-cable", amount = 4},
    {type = "item", name = "cube-basic-matter-unit", amount = 6},
  }
  recipe.category = "cube-fabricator-handcraft"

  recipe = data.raw.recipe["deadlock-large-lamp"]
  recipe.ingredients = {
    {type = "item", name = "cube-electronic-circuit", amount = 1},
    {type = "item", name = "copper-cable", amount = 4},
    {type = "item", name = "cube-basic-matter-unit", amount = 6},
  }
  recipe.category = "cube-fabricator-handcraft"

  local technology = data.raw.technology["cube-optics"]
  table.insert(technology.effects, {type = "unlock-recipe", recipe = "deadlock-floor-lamp"})
  table.insert(technology.effects, {type = "unlock-recipe", recipe = "deadlock-large-lamp"})

  add_mystery_recipe(1, "deadlock-floor-lamp", "cube-electronic-circuit")
  add_mystery_recipe(1, "deadlock-large-lamp", "cube-electronic-circuit")
end
