if mods["recursive-blueprints"] or mods["rec-blue-plus"] then
  local recipe = data.raw.recipe["blueprint-deployer"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {"iron-chest", 1},
    {"cube-electronic-circuit", 3},
    {"cube-advanced-circuit", 1},
  }

  recipe = data.raw.recipe["recursive-blueprints-scanner"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {"cube-electronic-circuit", 5},
    {"cube-basic-matter-unit", 5},
    {"cube-rare-metals", 5},
  }

  local tech = data.raw.technology["cube-construction-robotics"]
  table.insert(tech.effects, {type = "unlock-recipe", recipe = "blueprint-deployer"})
  table.insert(tech.effects, {type = "unlock-recipe", recipe = "recursive-blueprints-scanner"})

  local item = data.raw.item["blueprint-deployer"]
  item.subgroup = "cube-combinator-extra"
  item.order = "cube-z-" .. item.order
  local item = data.raw.item["recursive-blueprints-scanner"]
  item.subgroup = "cube-combinator-extra"
  item.order = "cube-z-" .. item.order

  add_mystery_recipe(1, "blueprint-deployer", "blueprint-book")
  add_mystery_recipe(1, "recursive-blueprints-scanner", "cube-electronic-circuit")
end