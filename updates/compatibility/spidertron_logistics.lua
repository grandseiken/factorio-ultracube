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
    {"logistic-chest-requester", 4},
    {"cube-big-container", 1},
    {"spidertron-remote", 1},
  }

  recipe = data.raw.recipe["spidertron-provider-chest"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {"logistic-chest-passive-provider", 4},
    {"cube-big-container", 1},
    {"spidertron-remote", 1},
  }

  recipe = data.raw.recipe["spidertron-logistic-controller"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {"cube-singularity-research-data", 10},
    {"cube-spectral-processor", 10},
    {"spidertron-remote", 1},
  }

  recipe = data.raw.recipe["spidertron-logistic-beacon"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {"cube-resplendent-plate", 10},
    {"cube-spectral-processor", 2},
    {"spidertron-remote", 1},
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