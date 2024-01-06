if mods["pushbutton"] then
  data:extend({
    {
      type = "recipe",
      name = "cube-pushbutton",
      ingredients =
      {
        {"constant-combinator", 1},
        {"cube-electronic-circuit", 1},
        {"cube-advanced-circuit", 1},
      },
      results = {{"pushbutton", 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "technology",
      name = "pushbutton",
      icon_size = 256, icon_mipmaps = 4,
      icon = "__pushbutton__/graphics/rwSiA9L.png",
      effects = {
        {type = "unlock-recipe", recipe = "cube-pushbutton"},
      },
      prerequisites = {
        "cube-combinatorics",
        "cube-advanced-electronics",
      },
      unit = tech_cost_unit("1a", 60),
      order = "x-0-2",
    },
  })

  add_mystery_recipe(1, "pushbutton", "cube-advanced-circuit")

  data.raw.item["pushbutton"].subgroup = "cube-combinator-extra"
  data.raw.item["pushbutton"].order = "cube-x"
end
