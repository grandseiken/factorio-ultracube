if mods["holographic_signs"] then
  local item = data.raw.item["hs_holo_sign"]
  item.order = "cube-" .. item.order
  item.subgroup = "cube-combinator-extra"

  local recipe = data.raw.recipe["hs_holo_sign"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {"small-lamp", 1},
    {"cube-electronic-circuit", 1},
    {"cube-rare-metals", 4},
  }
  recipe.enabled = false

  local tech = data.raw.technology["cube-optics"]
  table.insert(tech.effects, {type = "unlock-recipe", recipe = "hs_holo_sign"})
  add_mystery_recipe(1, "hs_holo_sign", "small-lamp")
end

