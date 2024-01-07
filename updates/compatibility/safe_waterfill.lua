if mods["safefill"] then
  local recipes = {
    "safefill-shallow",
    "safefill-medium",
    "safefill-deep",
    "safefill-mud",
    "safefill-green",
    "safefill-deepgreen",
  }

  for _, recipe in ipairs(recipes) do
    data.raw.recipe[recipe].category = "cube-fabricator-handcraft"
  end
  local tech = data.raw.technology["nullius-irrigation"]
  tech.unit = tech_cost_unit("2", 320)
  tech.prerequisites = {"cube-cliff-explosives", "cube-concrete", "cube-landfill"}
end