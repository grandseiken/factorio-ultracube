if mods["recursive-blueprints"] or mods["rec-blue-plus"] then
  local recipe = data.raw.recipe["blueprint-deployer"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "iron-chest", amount = 1},
    {type = "item", name = "cube-electronic-circuit", amount = 3},
    {type = "item", name = "cube-advanced-circuit", amount = 1},
  }

  recipe = data.raw.recipe["recursive-blueprints-scanner"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "cube-electronic-circuit", amount = 5},
    {type = "item", name = "cube-basic-matter-unit", amount = 5},
    {type = "item", name = "cube-rare-metals", amount = 5},
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