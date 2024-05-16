if mods["FuelTrainStop"] then
  local tech_effects = data.raw.technology["cube-railway"].effects
  table.insert(tech_effects, {type = "unlock-recipe",recipe = "fuel-train-stop"})
  data.raw.item["fuel-train-stop"].order = "cube-" .. data.raw.item["fuel-train-stop"].order
  data.raw.recipe["fuel-train-stop"].ingredients = data.raw.recipe["cube-train-stop"].ingredients
  data.raw.recipe["fuel-train-stop"].crafting_category = "cube-fabricator-handcraft"
  add_mystery_recipe(1, "fuel-train-stop", "cube-electronic-circuit")
end