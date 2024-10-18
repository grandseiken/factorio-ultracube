if mods["holographic_signs"] then
  local item = data.raw.item["hs_holo_sign"]
  item.order = "cube-" .. item.order
  item.subgroup = "cube-combinator-extra"

  local recipe = data.raw.recipe["hs_holo_sign"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "small-lamp", amount = 1},
    {type = "item", name = "cube-electronic-circuit", amount = 1},
    {type = "item", name = "cube-rare-metals", amount = 4},
  }
  recipe.enabled = false

  local tech = data.raw.technology["cube-optics"]
  table.insert(tech.effects, {type = "unlock-recipe", recipe = "hs_holo_sign"})
  add_mystery_recipe(1, "hs_holo_sign", "small-lamp")
end
