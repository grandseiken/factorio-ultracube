if mods["safefill"] then
  local recipes = {
    "safefill-shallow",
    "safefill-medium",
    "safefill-deep",
    "safefill-mud",
    "safefill-green",
    "safefill-deepgreen",
  }

  for _, recipe_name in ipairs(recipes) do
    local recipe = data.raw.recipe[recipe_name]
    if recipe then
      recipe.category = "cube-fabricator-handcraft"
      add_mystery_recipe(1, recipe_name, "landfill")
    end
  end
  local tech = data.raw.technology["nullius-irrigation"]
  if settings.startup["safefill-cost"].value == "expensive" then
    tech.unit = tech_cost_unit("2", 640)
    tech.prerequisites = {
      "cube-fluid-handling",
      "cube-cliff-explosives",
      "cube-concrete",
      "cube-landfill",
    }
  else
    tech.unit = tech_cost_unit("2", 320)
    tech.prerequisites = {
      "cube-cliff-explosives",
      "cube-concrete",
      "cube-landfill",
    }
  end
end