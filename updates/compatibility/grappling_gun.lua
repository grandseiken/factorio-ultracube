if mods["grappling-gun"] then
    local gun_recipe = data.raw.recipe["grappling-gun"]
     --original recipe: 10 steel, 10 gears, 5 pipes
    gun_recipe.ingredients = {
        {"cube-basic-motor-unit", 10},
        {"cube-n-dimensional-widget", 10},
        {"pipe", 5}
    }
    gun_recipe.category = "cube-fabricator-handcraft"

    local ammo_recipe = data.raw.recipe["grappling-gun-ammo"]
    --original recipe: 4 iron stick, 2 coal
    --coal is limited in the early game and there's no good equivalent, so I'll use rare metals instead (can say that's the "hook")
    ammo_recipe.ingredients = {
        {"cube-basic-matter-unit", 4},
        {"cube-rare-metals", 1}
    }
    ammo_recipe.category = "cube-fabricator-handcraft"

    add_mystery_recipe(2, "grappling-gun", "cube-basic-motor-unit")
    add_mystery_recipe(1, "grappling-gun-ammo", "cube-basic-matter-unit")

    local tech = data.raw.technology["grappling-gun"]
    tech.prerequisites = {"cube-n-dimensional-widgets"}
    tech.unit = tech_cost_unit("0", 100)
end