if mods["stack-combinator"] then
  local tech = data.raw.technology["stack-combinator"]
  tech.unit = tech_cost_unit("0", 60)
  tech.prerequisites = {"cube-combinatorics"}

  data.raw.recipe["stack-combinator"].category = "cube-fabricator-handcraft"
  data.raw.item["stack-combinator"].subgroup = "cube-combinator-extra"
end