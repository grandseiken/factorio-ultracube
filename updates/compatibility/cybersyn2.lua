if mods["cybersyn2"] then
  -- Note: In contrast to CS1, CS2 doesn't have a dedicated tech for the
  -- cybernetic combinator; it is unlocked by the Automated rail transportation
  -- tech instead. Using Rail Signals tech as the closest Cube equivalent.
  --
  -- Using the same recipe cost as in the CS1 compat.

  local recipe = data.raw.recipe["cybersyn2-combinator"]
  recipe.categories = {"cube-fabricator-handcraft"}
  recipe.ingredients = {
    {type = "item", name = "copper-cable", amount = 20},
    {type = "item", name = "cube-electronic-circuit", amount = 10},
  }

  local tech = data.raw.technology["cube-rail-signals"]
  table.insert(tech.effects, {type = "unlock-recipe", recipe = "cybersyn2-combinator"})

  data.raw.item["cybersyn2-combinator"].order = "cube-" .. data.raw.item["cybersyn2-combinator"].order
  add_mystery_recipe(1, "cybersyn2-combinator", "cube-electronic-circuit")
end
