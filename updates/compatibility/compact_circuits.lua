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
    {"cube-electronic-circuit", 20},
    {"cube-advanced-circuit", 30},
    {"cube-spectral-processor", 10},
  }
  local item = data.raw.item[proc_name]
  item.order = "cube-" .. item.order
  item.subgroup = "cube-combinator-extra"

  proc_name = proc_name .. "_1x1"
  proc = data.raw.recipe[proc_name]
  proc.category = "cube-fabricator-handcraft"
  proc.ingredients = {
    {"cube-electronic-circuit", 10},
    {"cube-advanced-circuit", 10},
    {"cube-spectral-processor", 3},
  }

  item = data.raw.item[proc_name]
  item.order = "cube-" .. item.order
  item.subgroup = "cube-combinator-extra"
end

