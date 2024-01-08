if mods["stack-combinator"] then
  data:extend({
    {
      type = "technology",
      name = "cube-stack-combinator",
      localised_name = {"technology-name.stack-combinator"},
      localised_description = {"technology-description.stack-combinator"},
      icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/circuit-network.png"),
      effects = {
        {type = "unlock-recipe", recipe = "cube-stack-combinator"},
      },
      prerequisites = {"cube-combinatorics"},
      unit = tech_cost_unit("0", 60),
      order = "x-0-0",
    },
    {
      type = "recipe",
      name = "cube-stack-combinator",
      ingredients = {
        {"arithmetic-combinator", 1},
        {"repair-pack", 1},
      },
      results = {{"stack-combinator", 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
  })

  data.raw.item["stack-combinator"].order = "cube-" .. data.raw.item["stack-combinator"].order
  add_mystery_recipe(1, "stack-combinator", "repair-pack")
end