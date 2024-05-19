if mods["quick-adjustable-inserters"] then
    local techNearInserters = data.raw.technology["near-inserters"]
    techNearInserters.unit = tech_cost_unit("0", 40)
    techNearInserters.prerequisites = {
        "cube-inserters",
    }
    
    local techMoreInserters1 = data.raw.technology["more-inserters-1"]
    techMoreInserters1.unit = tech_cost_unit("0", 120)
    techMoreInserters1.prerequisites = {
        "near-inserters",
        "cube-electronics",
    }
    
    local techMoreInserters2 = data.raw.technology["more-inserters-2"]
    techMoreInserters2.unit = tech_cost_unit("1a", 240)
    techMoreInserters2.prerequisites = {
        "more-inserters-1",
        "cube-advanced-electronics",
    }
end