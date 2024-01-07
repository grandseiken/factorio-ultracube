if mods["recursive-blueprints"] or mods["rec-blue-plus"] then
  local recipe = data.raw.recipe["blueprint-deployer"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {"iron-chest", 1},
    {"cube-electronic-circuit", 3},
    {"cube-advanced-circuit", 1},
  }
  recipe.enabled = true

  recipe = data.raw.recipe["recursive-blueprints-scanner"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {"cube-electronic-circuit", 5},
    {"cube-basic-matter-unit", 5},
    {"cube-rare-metals", 5},
  }
  recipe.enabled = true

  local item = data.raw.item["blueprint-deployer"]
  item.subgroup = "cube-combinator-extra"
  item.order = "cube-z-" .. item.order
  local item = data.raw.item["recursive-blueprints-scanner"]
  item.subgroup = "cube-combinator-extra"
  item.order = "cube-z-" .. item.order
end