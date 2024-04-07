if mods["LogisticTrainNetwork"] then
  local recipe = data.raw.recipe["logistic-train-stop"]
  recipe.category = "cube-fabricator-handcraft"

  local tech = data.raw.technology["logistic-train-network"]
  tech.prerequisites = {
    "cube-combinatorics",
    "cube-rail-signals",
  }
  tech.unit = tech_cost_unit("1b", 240)

  data.raw.item["logistic-train-stop"].order = "cube-" .. data.raw.item["logistic-train-stop"].order
  add_mystery_recipe(1, "logistic-train-stop", "train-stop")
end
