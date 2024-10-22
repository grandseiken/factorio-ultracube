if mods["compaktcircuit"] then
  local tech = data.raw.technology["compaktcircuit-tech"]
  tech.prerequisites = {
      "cube-combinatorics",
      "cube-spectral-processor"
  }
  tech.unit = tech_cost_unit("2", 100)

  local proc_name = "compaktcircuit-processor"
  local proc = data.raw.recipe[proc_name]
  proc.category = "cube-fabricator-handcraft"
  proc.ingredients = {
    {type = "item", name = "cube-electronic-circuit", amount = 20},
    {type = "item", name = "cube-advanced-circuit", amount = 30},
    {type = "item", name = "cube-spectral-processor", amount = 10},
  }
  local item = data.raw.item[proc_name]
  item.order = "cube-" .. item.order
  item.subgroup = "cube-combinator-extra"
  add_mystery_recipe(1, proc_name, "cube-spectral-processor")

  proc_name = proc_name .. "_1x1"
  proc = data.raw.recipe[proc_name]
  proc.category = "cube-fabricator-handcraft"
  proc.ingredients = {
    {type = "item", name = "cube-electronic-circuit", amount = 10},
    {type = "item", name = "cube-advanced-circuit", amount = 10},
    {type = "item", name = "cube-spectral-processor", amount = 3},
  }

  item = data.raw.item[proc_name]
  item.order = "cube-" .. item.order
  item.subgroup = "cube-combinator-extra"
  add_mystery_recipe(1, proc_name, "cube-spectral-processor")

  item = data.raw["item-with-tags"]["compaktcircuit-processor_with_tags"]
  item.order = "cube-" .. item.order
  item.subgroup = "cube-combinator-extra"

  item = data.raw.item["compaktcircuit-iopoint"]
  item.order = "cube-" .. item.order
  item.subgroup = "cube-combinator-extra"
end
