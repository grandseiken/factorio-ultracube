if mods["pushbutton"] then
  data:extend({
    {
      type = "recipe",
      name = "cube-pushbutton",
      ingredients =
      {
        {type = "item", name = "constant-combinator", amount = 1},
        {type = "item", name = "cube-electronic-circuit", amount = 5},
      },
      results = {{type = "item", name = "pushbutton", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
  })

  local tech = data.raw.technology["cube-combinatorics"]
  table.insert(tech.effects, {type = "unlock-recipe", recipe = "cube-pushbutton"})

  add_mystery_recipe(1, "pushbutton", "cube-advanced-circuit")

  data.raw.item["pushbutton"].subgroup = "cube-combinator-extra"
  data.raw.item["pushbutton"].order = "cube-x"
end
