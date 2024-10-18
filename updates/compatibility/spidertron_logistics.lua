if mods["spidertron-logistics"] then
  local tech = data.raw.technology["spidertron-logistic-system"]
  tech.prerequisites = {
    "cube-spidertron",
    "cube-logistic-system",
    "cube-containers",
    "cube-cyclotron",
  }
  tech.unit = tech_cost_unit("5", 1800)

  local recipe = data.raw.recipe["spidertron-requester-chest"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "logistic-chest-requester", amount = 4},
    {type = "item", name = "cube-big-container", amount = 1},
    {type = "item", name = "spidertron-remote", amount = 1},
  }

  recipe = data.raw.recipe["spidertron-provider-chest"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "logistic-chest-passive-provider", amount = 4},
    {type = "item", name = "cube-big-container", amount = 1},
    {type = "item", name = "spidertron-remote", amount = 1},
  }

  recipe = data.raw.recipe["spidertron-logistic-controller"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "cube-singularity-research-data", amount = 10},
    {type = "item", name = "cube-spectral-processor", amount = 10},
    {type = "item", name = "spidertron-remote", amount = 1},
  }

  recipe = data.raw.recipe["spidertron-logistic-beacon"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "cube-resplendent-plate", amount = 10},
    {type = "item", name = "cube-spectral-processor", amount = 2},
    {type = "item", name = "spidertron-remote", amount = 1},
  }

  data.raw.item["spidertron-requester-chest"].subgroup = "cube-logistics-extra"
  data.raw.item["spidertron-provider-chest"].subgroup = "cube-logistics-extra"
  data.raw.item["spidertron-logistic-controller"].subgroup = "cube-logistics-extra"
  data.raw.item["spidertron-logistic-beacon"].subgroup = "cube-logistics-extra"

  add_mystery_recipe(2, "spidertron-requester-chest", "cube-big-container")
  add_mystery_recipe(2, "spidertron-provider-chest", "cube-big-container")
  add_mystery_recipe(2, "spidertron-logistic-controller", "spidertron-remote")
  add_mystery_recipe(2, "spidertron-logistic-beacon", "spidertron-remote")
end