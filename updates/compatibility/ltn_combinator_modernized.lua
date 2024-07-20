if mods["LTN_Combinator_Modernized"] then
    local recipe = data.raw.recipe["ltn-combinator"]
    recipe.category = "cube-fabricator-handcraft"
    recipe.ingredients = {{"constant-combinator", 1}, {"cube-electronic-circuit", 1}}
    recipe.enabled = false

    data.raw.item["ltn-combinator"].subgroup = "cube-combinator-extra"
    data.raw.item["ltn-combinator"].order = "cube-" .. data.raw.item["ltn-combinator"].order

    table.insert(data.raw.technology["logistic-train-network"].effects, {
        type = "unlock-recipe",
        recipe = "ltn-combinator"
    })

    add_mystery_recipe(1, "ltn-combinator", "cube-electronic-circuit")
end
