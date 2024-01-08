if mods["DisplayPlates"] then
  for _, material in ipairs({"copper", "iron", "steel"}) do
    for _, size in ipairs({"-small", "-medium", ""}) do
      local recipe_name = material .. "-display" .. size
      local recipe = data.raw.recipe[recipe_name]
      recipe.category = "cube-fabricator-handcraft"
      if material == "iron" then
        recipe.ingredients[1][1] = "cube-basic-matter-unit"
        recipe.enabled = true
      elseif material == "copper" then
        recipe.ingredients[1][1] = "cube-rare-metals"
        recipe.enabled = false
        table.insert(
          data.raw.technology["cube-ultradense-furnace"].effects,
          {type = "unlock-recipe", recipe = recipe_name})
      elseif material == "steel" then
        recipe.ingredients[1][1] = "cube-sophisticated-matter-unit"
        recipe.enabled = false
        table.insert(
          data.raw.technology["cube-sophisticated-matter-unit"].effects,
          {type = "unlock-recipe", recipe = recipe_name})
      end
    end
  end
end