if mods["blueprint-shotgun"] then
  local tech = data.raw["technology"]["blueprint-shotgun"]
  tech.prerequisites = {}
  tech.unit = tech_cost_unit("0", 10)
  
  local recipe_gun = data.raw["recipe"]["blueprint-shotgun"]
  recipe_gun.subgroup = "cube-repair"
  recipe_gun.order = "cube-b[repair]-b[blueprint-shotgun]"
  recipe_gun.ingredients = {
    {type = "item", name = "cube-local-turbine", amount = 1},
    {type = "item", name = "cube-basic-matter-unit", amount = 200},
    {type = "item", name = "pipe", amount = 1},
  }
  
  local recipe_ammo = data.raw["recipe"]["item-canister"]
  recipe_ammo.subgroup = "cube-repair"
  recipe_ammo.order = "cube-b[repair]-c[item-canister]"
  recipe_ammo.ingredients = {
    {type = "item", name = "cube-basic-motor-unit", amount = 1},
    {type = "item", name = "cube-basic-matter-unit", amount = 10},
  }
end
