if mods['blueprint-shotgun'] then
  local tech_lv_0 = data.raw['technology']['blueprint-shotgun']
  tech_lv_0.prerequisites = {}
  tech_lv_0.unit = tech_cost_unit("0", 10)
  
  local tech_lv_1 = data.raw['technology']['blueprint-shotgun-upgrade-1']
  tech_lv_1.prerequisites = {
    "cube-fundamental-comprehension-card",
    "blueprint-shotgun",
  }
  tech_lv_1.unit = tech_cost_unit("1a", 50)
  
  local tech_lv_2 = data.raw['technology']['blueprint-shotgun-upgrade-2']
  tech_lv_2.prerequisites = {
    "blueprint-shotgun-upgrade-1",
  }
  tech_lv_2.unit = tech_cost_unit("1b", 100)
  
  local recipe_gun = data.raw['recipe']['blueprint-shotgun']
  recipe_gun.subgroup = 'cube-repair'
  recipe_gun.order = 'cube-b[repair]-b[blueprint-shotgun]'
  recipe_gun.ingredients = {
    {type = "item", name = "cube-local-turbine", amount = 1},
    {type = "item", name = "cube-basic-matter-unit", amount = 200},
    {type = "item", name = "pipe", amount = 1},
  }
  
  local recipe_ammo = data.raw['recipe']['item-canister']
  recipe_ammo.subgroup = 'cube-repair'
  recipe_ammo.order = 'cube-b[repair]-c[item-canister]'
  recipe_ammo.ingredients = {
    {type = "item", name = "cube-basic-motor-unit", amount = 1},
    {type = "item", name = "cube-basic-matter-unit", amount = 10},
  }
end
