if mods["DisplayPlates"] then
  for _, material in ipairs({"copper", "iron", "steel"}) do
    local ingredient = nil
    local technology = nil
    if material == "iron" then
      ingredient = "cube-basic-matter-unit"
    elseif material == "copper" then
      ingredient = "cube-rare-metals"
      technology = "cube-ultradense-furnace"
    elseif material == "steel" then
      ingredient = "cube-sophisticated-matter-unit"
      technology = "cube-sophisticated-matter-unit"
    end

    for _, size in ipairs({"-small", "-medium", ""}) do
      local name = material .. "-display" .. size
      local recipe = data.raw.recipe[name]
      recipe.category = "cube-fabricator-handcraft"
      recipe.ingredients[1][1] = ingredient
      if technology then
        recipe.enabled = false
        table.insert(data.raw.technology[technology].effects, {type = "unlock-recipe", recipe = name})
      else
        recipe.enabled = true
      end
      add_mystery_recipe(1, name, ingredient)
    end
  end
end