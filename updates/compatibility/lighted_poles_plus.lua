if mods["LightedPolesPlus"] then
  local med_pole = data.raw.recipe["lighted-medium-electric-pole"]
  -- Medium pole is special because it starts unlocked.
  if med_pole ~= nil then
    med_pole.category = "cube-fabricator-handcraft"
    local technology = data.raw.technology["cube-optics"]
    table.insert(technology.effects, {type = "unlock-recipe", recipe = "lighted-medium-electric-pole"})
  end
  for name, recipe in pairs(data.raw.recipe) do
    if name:find("^lighted-") then
      recipe.category = "cube-fabricator-handcraft"
      if recipe.order and recipe.order:find("^cube-") == nil then
        recipe.order = "cube-"..recipe.order
      end
    end
  end

end
