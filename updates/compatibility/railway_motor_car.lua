if mods["railway-motor-car"] then
  local name_base = "railway-motor-car-base"
  local name_nuclear = "railway-motor-car-nuclear"

  local recipe_base = data.raw.recipe[name_base]
  recipe_base.category = "cube-fabricator-handcraft"
  recipe_base.normal.ingredients = data.raw.recipe["cube-locomotive"].ingredients
  local recipe_nuclear = data.raw.recipe[name_nuclear]
  recipe_nuclear.category = "cube-fabricator-handcraft"
  recipe_nuclear.normal.ingredients = {
    {type = "item", name = name_base, amount = 1},
    {type = "item", name = "cube-nuclear-fuel", amount = 5},
  }

  local tech_base = data.raw.technology[name_base]
  tech_base.prerequisites = {"cube-transitive-ultralocomotion"}
  tech_base.unit = tech_cost_unit("2", 240)
  local tech_nuclear = data.raw.technology[name_nuclear]
  tech_nuclear.prerequisites = {name_base, "cube-kovarex-enrichment-process"}
  tech_nuclear.unit = tech_cost_unit("3", 240)

  local item_base = data.raw.item[name_base]
  item_base.order = "cube-" .. item_base.order
  item_base.subgroup = "cube-equipment"
  data.raw["battery-equipment"][name_base].categories = {"cube-armor"}
  local item_nuclear = data.raw.item[name_nuclear]
  item_nuclear.order = "cube-" .. item_nuclear.order
  item_nuclear.subgroup = "cube-equipment"
  data.raw["battery-equipment"][name_nuclear].categories = {"cube-armor"}

  add_mystery_recipe(2, name_base, "cube-electronic-circuit")
  add_mystery_recipe(2, name_nuclear, "cube-electronic-circuit")
end
