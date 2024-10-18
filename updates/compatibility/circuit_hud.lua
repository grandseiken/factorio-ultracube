if mods["CircuitHUD-V2"] then
  local recipe = data.raw.recipe["hud-combinator"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "copper-cable", amount = 5},
    {type = "item", name = "cube-basic-matter-unit", amount = 2},
    {type = "item", name = "cube-electronic-circuit", amount = 2},
  }
  recipe.enabled = false

  data.raw.item["hud-combinator"].subgroup = "cube-combinator-extra"
  data.raw.item["hud-combinator"].order = "cube-" .. data.raw.item["hud-combinator"].order
  table.insert(data.raw.technology["cube-combinatorics"].effects, {type = "unlock-recipe", recipe = "hud-combinator"})
  add_mystery_recipe(1, "hud-combinator", "cube-electronic-circuit")
end