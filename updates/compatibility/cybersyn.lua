if mods["cybersyn"] then
  local recipe = data.raw.recipe["cybersyn-combinator"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "copper-cable", amount = 20},
    {type = "item", name = "cube-electronic-circuit", amount = 10},
  }

  local tech = data.raw.technology["cybersyn-train-network"]
  tech.prerequisites = {
    "cube-combinatorics",
    "cube-rail-signals",
  }
  tech.unit = tech_cost_unit("1b", 240)

  data.raw.item["cybersyn-combinator"].order = "cube-" .. data.raw.item["cybersyn-combinator"].order
  add_mystery_recipe(1, "cybersyn-combinator", "cube-electronic-circuit")

  if mods["cybersyn-combinator"] then
    recipe = data.raw.recipe["cybersyn-constant-combinator"]
    recipe.category = "cube-fabricator-handcraft"
    recipe.ingredients = {
      {type = "item", name = "constant-combinator", amount = 1},
      {type = "item", name = "cube-electronic-circuit", amount = 1},
    }
    data.raw.item["cybersyn-constant-combinator"].order = "cube-" .. data.raw.item["cybersyn-constant-combinator"].order
    add_mystery_recipe(1, "cybersyn-constant-combinator", "cube-electronic-circuit")
  end
end
