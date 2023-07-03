if mods["nixie-tubes"] then
  data:extend({
    {
      type = "recipe",
      name = "cube-nixie-tube",
      ingredients = {
        {"cube-electronic-circuit", 1},
        {"cube-glass", 2},
        {"cube-basic-matter-unit", 2},
      },
      results = {{"nixie-tube", 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "recipe",
      name = "cube-nixie-tube-alpha",
      ingredients = {
        {"cube-electronic-circuit", 1},
        {"cube-glass", 2},
        {"cube-basic-matter-unit", 2},
      },
      results = {{"nixie-tube-alpha", 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "recipe",
      name = "cube-nixie-tube-small",
      ingredients = {
        {"cube-electronic-circuit", 1},
        {"cube-glass", 1},
        {"cube-basic-matter-unit", 1},
      },
      results = {{"nixie-tube-small", 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
  })
end