if mods["fcpu"] then
  local fcpu_recipe = data.raw.recipe["fcpu"]
  fcpu_recipe.ingredients = {
    {type = "item", name = "arithmetic-combinator", amount = 10},
    {type = "item", name = "decider-combinator", amount = 10},
    {type = "item", name = "cube-electronic-circuit", amount = 1},
  }
  fcpu_recipe.category = "cube-fabricator-handcraft"

  local fcpu_item = data.raw.item["fcpu"]
  fcpu_item.order = "cube-" .. fcpu_item.order

  local tech = data.raw.technology["fcpu"]
  tech.prerequisites = {
    "cube-combinatorics",
  }
  tech.unit = tech_cost_unit("1b", 120)
end
