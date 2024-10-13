if mods["LightedPolesPlus"] then
  -- Medium pole is special because it starts unlocked.
  if data.raw.recipe["lighted-medium-electric-pole"] then
    local technology = data.raw.technology["cube-optics"]
    table.insert(technology.effects, {type = "unlock-recipe", recipe = "lighted-medium-electric-pole"})
  end
  for _, name in pairs({"lighted-big-electric-pole",
                        "lighted-medium-electric-pole",
                        "lighted-substation"}) do
    local recipe = data.raw.recipe[name]
    if recipe then
      recipe.category = "cube-fabricator-handcraft"
      if recipe.order then
        recipe.order = "cube-" .. recipe.order
      end
    end
  end
end
