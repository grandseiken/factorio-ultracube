if mods["Flow Control"] then
  data.raw.recipe["pipe-elbow"].enabled = true
  data.raw.recipe["pipe-junction"].enabled = true
  data.raw.recipe["pipe-straight"].enabled = true

  data:extend({
    {
      type = "recipe",
      name = "cube-check-valve",
      ingredients = {
        {type = "item", name = "pipe", amount = 1},
        {type = "item", name = "cube-basic-matter-unit", amount = 2},
        {type = "item", name = "cube-basic-motor-unit", amount = 1},
      },
      results = {{type = "item", name = "check-valve", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "recipe",
      name = "cube-overflow-valve",
      ingredients = {
        {type = "item", name = "pipe", amount = 1},
        {type = "item", name = "cube-electronic-circuit", amount = 1},
        {type = "item", name = "cube-basic-motor-unit", amount = 1},
      },
      results = {{type = "item", name = "overflow-valve", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "recipe",
      name = "cube-underflow-valve",
      ingredients = {
        {type = "item", name = "pipe", amount = 1},
        {type = "item", name = "cube-electronic-circuit", amount = 1},
        {type = "item", name = "cube-basic-motor-unit", amount = 1},
      },
      results = {{type = "item", name = "underflow-valve", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "technology",
      name = "flow_control_valves_tech",
      icon_size = 256, icon_mipmaps = 4,
      icon = "__Flow Control__/graphics/technology/flow_control_valves_tech.png",
      effects = {
        {type = "unlock-recipe", recipe = "cube-check-valve"},
        {type = "unlock-recipe", recipe = "cube-overflow-valve"},
        {type = "unlock-recipe", recipe = "cube-underflow-valve"},
      },
      prerequisites = {
        "cube-fundamental-comprehension-card",
        "cube-fluid-handling",
      },
      unit = tech_cost_unit("1a", 120),
      order = "x-0-1",
    },
  })
  data.raw.item["check-valve"].order = "cube-" .. data.raw.item["check-valve"].order
  data.raw.item["overflow-valve"].order = "cube-" .. data.raw.item["overflow-valve"].order
  data.raw.item["underflow-valve"].order = "cube-" .. data.raw.item["underflow-valve"].order
  data.raw.recipe["pipe-elbow"].order = "cube-" .. data.raw.item["pipe-elbow"].order
  data.raw.recipe["pipe-junction"].order = "cube-" .. data.raw.item["pipe-junction"].order
  data.raw.recipe["pipe-straight"].order = "cube-" .. data.raw.item["pipe-straight"].order

  add_mystery_recipe(1, "pipe-elbow", "pipe")
  add_mystery_recipe(1, "pipe-junction", "pipe")
  add_mystery_recipe(1, "pipe-straight", "pipe")
  add_mystery_recipe(1, "check-valve", "pipe")
  add_mystery_recipe(1, "overflow-valve", "pipe")
  add_mystery_recipe(1, "underflow-valve", "pipe")
end
