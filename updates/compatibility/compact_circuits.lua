if mods["compaktcircuit"] then
    local tech = data.raw.technology["compaktcircuit-tech"]
    tech.prerequisites = {
        "cube-combinatorics",
        "cube-spectral-processor"
    }
    tech.unit = tech_cost_unit("2", 100)

    local procname = "compaktcircuit-processor"
    local proc = data.raw.recipe[procname]
    proc.category = "cube-fabricator-handcraft"
    proc.ingredients = {
        { 'cube-electronic-circuit', 20 },
        { 'cube-advanced-circuit', 30 },
        { 'cube-spectral-processor', 10 }
    }

    data.raw.item[procname].order = "cube-" .. data.raw.item[procname].order

    local proc_1x1 = data.raw.recipe[procname .. "_1x1"]
    proc_1x1.category = "cube-fabricator-handcraft"
    proc_1x1.ingredients = {
        { 'cube-electronic-circuit', 10 },
        { 'cube-advanced-circuit', 10 },
        { 'cube-spectral-processor', 3 }
    }

    data.raw.item[procname .. "_1x1"].order = "cube-" .. data.raw.item[procname .. "_1x1"].order
end

