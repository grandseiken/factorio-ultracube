if mods["grappling-gun"] then
  local gun_recipe = data.raw.recipe["grappling-gun"]
  -- Original recipe: 10 steel, 10 gears, 5 pipes
  gun_recipe.ingredients = {
    {"cube-basic-motor-unit", 10},
    {"cube-n-dimensional-widget", 10},
    {"pipe", 5},
  }
  gun_recipe.category = "cube-fabricator-handcraft"
  local gun_item = data.raw.gun["grappling-gun"]
  gun_item.order = "cube-0[grappling]-0" .. gun_item.order
  gun_item.subgroup = "cube-utility"

  local ammo_recipe = data.raw.recipe["grappling-gun-ammo"]
  -- Original recipe: 4 iron stick, 2 coal
  -- Coal is limited in the early game and there's no good equivalent, so I'll use rare metals
  -- instead (can say that's the "hook").
  ammo_recipe.ingredients = {
    {"cube-basic-matter-unit", 4},
    {"cube-rare-metals", 1},
  }
  ammo_recipe.category = "cube-fabricator-handcraft"

  local ammo_item = data.raw.ammo["grappling-gun-ammo"]
  ammo_item.order = "cube-0[grappling]-1" .. gun_item.order
  ammo_item.subgroup = "cube-utility"

  local tech = data.raw.technology["grappling-gun"]
  tech.prerequisites = {"cube-fundamental-comprehension-card"}
  tech.unit = tech_cost_unit("1a", 120)

  add_mystery_recipe(2, "grappling-gun", "cube-basic-motor-unit")
  add_mystery_recipe(1, "grappling-gun-ammo", "cube-basic-matter-unit")
end