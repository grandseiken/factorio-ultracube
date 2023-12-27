if mods["cybersyn"] then
  data.raw.recipe["cybersyn-combinator"].ingredients = {
    {"copper-cable", 20},
    {"cube-electronic-circuit", 10},
  }
  local tech = data.raw.technology["cybersyn-train-network"]
  tech.prerequisites = {
    "cube-combinatorics",
    "cube-rail-signals",
  }
  tech.unit = tech_cost_unit("1b", 120)
end