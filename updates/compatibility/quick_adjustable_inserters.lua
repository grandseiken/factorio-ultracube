if mods["quick-adjustable-inserters"] then
  local tech = data.raw.technology["near-inserters"]
  if tech then
    tech.unit = tech_cost_unit("0", 40)
    tech.prerequisites = {
      "cube-inserters",
    }
  end

  tech = data.raw.technology["more-inserters-1"]
  if tech then
    tech.unit = tech_cost_unit("0", 120)
    tech.prerequisites = {
      "near-inserters",
      "cube-electronics",
    }
  end

  tech = data.raw.technology["more-inserters-2"]
  if tech then
    tech.unit = tech_cost_unit("1a", 240)
    tech.prerequisites = {
      "more-inserters-1",
      "cube-advanced-electronics",
    }
  end

  tech = data.raw.technology["long-inserters-1"]
  if tech then
    tech.unit = tech_cost_unit("2", 240)
    tech.prerequisites = {
      "near-inserters",
      "cube-abstract-interrogation-card",
    }
  end

  tech = data.raw.technology["long-inserters-2"]
  if tech then
    tech.unit = tech_cost_unit("3", 240)
    tech.prerequisites = {
      "long-inserters-1",
      "cube-deep-introspection-card",
    }
  end
end