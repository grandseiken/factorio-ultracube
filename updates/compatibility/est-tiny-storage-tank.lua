if mods["est-tiny-storage-tank"] then

    local isenabled = true --est-tiny-storage-tank enabled with steam
    if settings.startup["tiny-storage-tank-unlock"].value == "with-fluid-handling" then
        isenabled = false
        local technology = data.raw.technology["cube-fluid-handling"]
        table.insert(technology.effects, {type = "unlock-recipe", recipe = "tiny-inline-storage-tank"})
        table.insert(technology.effects, {type = "unlock-recipe", recipe = "tiny-4way-storage-tank"})
    end

    data:extend({
        {
            type = "recipe",
            name = "tiny-inline-storage-tank",
            ingredients = {
                {type = "item", name = "cube-basic-matter-unit",  amount = 4},
                {type = "item", name = "cube-rare-metals", amount = 4},
                {type = "item", name = "pipe",        amount = 1}
                },
            results = {{type = "item", name = "tiny-inline-storage-tank", amount = 1}},
            energy_required = 2,
            category = "cube-fabricator-handcraft",
            enabled = isenabled,
        },
        {
            type = "recipe",
            name = "tiny-4way-storage-tank",
            ingredients = {
                {type = "item", name = "cube-basic-matter-unit",  amount = 4},
                {type = "item", name = "cube-rare-metals", amount = 4},
                {type = "item", name = "pipe",        amount = 1}
                },
            results = {{type = "item", name = "tiny-4way-storage-tank", amount = 1}},
            energy_required = 2,
            category = "cube-fabricator-handcraft",
            enabled = isenabled,
        },
    })
    data.raw.item["tiny-inline-storage-tank"].subgroup = "storage"
    data.raw.item["tiny-inline-storage-tank"].order = "cube-y"
    data.raw.item["tiny-4way-storage-tank"].subgroup = "storage"
    data.raw.item["tiny-4way-storage-tank"].order = "cube-y"
end