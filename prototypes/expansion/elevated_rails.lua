if mods["elevated-rails"] then
  data:extend({
    {
      type = "technology",
      name = "cube-elevated-rail",
      localised_name = {"technology-name.elevated-rail"},
      localised_description = {"technology-description.elevated-rail"},
      icon = "__elevated-rails__/graphics/technology/elevated-rail.png",
      icon_size = 256,
      effects =
      {
        {type = "unlock-recipe", recipe = "cube-rail-support"},
        {type = "unlock-recipe", recipe = "cube-rail-ramp"},
        {type = "rail-planner-allow-elevated-rails", modifier = true},
      },
      prerequisites = {"cube-refined-concrete", "cube-railway"},
      unit = tech_cost_unit("3", 240),
    },
    {
      type = "recipe",
      name = "cube-rail-support",
      localised_name = {"entity-name.rail-support"},
      localised_description = {"entity-description.rail-support"},
      ingredients = {
        {type = "item", name = "refined-concrete", amount = 20},
        {type = "item", name = "cube-sophisticated-matter-unit", amount = 10}
      },
      results = {{type = "item", name = "rail-support", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "recipe",
      name = "cube-rail-ramp",
      localised_name = {"entity-name.rail-ramp"},
      localised_description = {"entity-description.rail-ramp"},
      ingredients = {
        {type = "item", name = "refined-concrete", amount = 100},
        {type = "item", name = "rail", amount = 8},
        {type = "item", name = "cube-sophisticated-matter-unit", amount = 10}
      },
      results = {{type = "item", name = "rail-ramp", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    }
  })
end