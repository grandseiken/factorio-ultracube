if mods["pushbutton"] then
  data:extend({
    {
      type = "recipe",
      name = "cube-pushbutton",
      ingredients =
      {
        {type = "item", name = "constant-combinator", amount = 1},
        {type = "item", name = "cube-electronic-circuit", amount = 1},
        {type = "item", name = "cube-advanced-circuit", amount = 1},
      },
      results = {{type = "item", name = "pushbutton", amount = 1}},
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
