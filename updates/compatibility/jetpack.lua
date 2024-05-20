if mods["jetpack"] then
    local craft_category = "cube-fabricator-handcraft"
    local equip_category = {"cube-armor"}
    local techs = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
        {"cube-deep-introspection-card", 1},
        {"cube-synthetic-premonition-card", 1},
        {"cube-complete-annihilation-card", 1}
    }

    local pack1_recipe = data.raw.recipe["jetpack-1"]
    --original recipe: 10 steel, 10 pipes, 10 green circuits
    pack1_recipe.ingredients = {
        {"cube-sophisticated-matter-unit", 10},
        {"pipe", 10},
        {"cube-electronic-circuit", 10}
    }
    pack1_recipe.category = craft_category
    local pack1_tech = data.raw.technology["jetpack-1"]
    pack1_tech.unit.ingredients = {techs[1], techs[2], techs[3]}
    pack1_tech.prerequisites = {"cube-sophisticated-matter-unit", "cube-fuel-refinery", "cube-modular-armor"}
    local item = data.raw.item["jetpack-1"]
    item.order = "cube-" .. item.order
    item.subgroup = "cube-equipment"
    data.raw["battery-equipment"]["jetpack-1"].categories = equip_category

    local pack2_recipe = data.raw.recipe["jetpack-2"]
    --original recipe: 2 jetpack 1, 20 E-engines, 20 red circuits
    pack2_recipe.ingredients = {
        {"jetpack-1", 2},
        {"cube-spectralite", 20},
        {"cube-advanced-engine", 20},
        {"cube-advanced-circuit", 20}
    }
    pack2_recipe.category = craft_category
    local pack2_tech = data.raw.technology["jetpack-2"]
    pack2_tech.unit.ingredients = {techs[1], techs[2], techs[3]}
    pack2_tech.prerequisites = {"jetpack-1", "cube-phantom-electronics"}
    item = data.raw.item["jetpack-2"]
    item.order = "cube-" .. item.order
    item.subgroup = "cube-equipment"
    data.raw["battery-equipment"]["jetpack-2"].categories = equip_category

    local pack3_recipe = data.raw.recipe["jetpack-3"]
    --original recipe: 2 jetpack 2, 30 LDS, 30 blue circuits
    pack3_recipe.ingredients = {
        {"jetpack-2", 2},
        {"cube-resplendent-plate", 30},
        {"cube-arcane-drive", 30}, --arcane drive already contains the other 2 ingredients so this feels a little redundant, but it fits with the pattern already established
        {"cube-spectral-processor", 30}
    }
    pack3_recipe.category = craft_category
    local pack3_tech = data.raw.technology["jetpack-3"]
    pack3_tech.unit.ingredients = {techs[1], techs[2], techs[3], techs[4], techs[5]}
    pack3_tech.prerequisites = {"jetpack-2", "cube-arcane-drive"}
    item = data.raw.item["jetpack-3"]
    item.order = "cube-" .. item.order
    item.subgroup = "cube-equipment"
    data.raw["battery-equipment"]["jetpack-3"].categories = equip_category

    local pack4_recipe = data.raw.recipe["jetpack-4"]
    --original recipe: 2 jetpack 3, 40 speed 3, 40 eff. 3
    pack4_recipe.ingredients = {
        {"jetpack-3", 2},
        {"cube-ultradense-matter-unit", 40}, --lol
        {"cube-speed-module-v3", 40},
        {"cube-efficiency-module-v3", 40}
    }
    pack4_recipe.results = {
        {"jetpack-4", 1},
        {type = "item", name = "cube-ultradense-debris", amount = 20, catalyst_amount = 20}
    }
    pack4_recipe.main_product = "jetpack-4"
    pack4_recipe.category = craft_category
    local pack4_tech = data.raw.technology["jetpack-4"]
    pack4_tech.unit.ingredients = {techs[1], techs[2], techs[3], techs[4], techs[5], techs[6]}
    pack4_tech.prerequisites = {"jetpack-3", "cube-speed-module-v3", "cube-efficiency-module-v3"}
    item = data.raw.item["jetpack-4"]
    item.order = "cube-" .. item.order
    item.subgroup = "cube-equipment"
    data.raw["battery-equipment"]["jetpack-4"].categories = equip_category

    add_mystery_recipe(1, "jetpack-1", "pipe")
    add_mystery_recipe(2, "jetpack-2", "jetpack-1")
    add_mystery_recipe(3, "jetpack-3", "jetpack-2")
    add_mystery_recipe(4, "jetpack-4", "jetpack-3")
end
