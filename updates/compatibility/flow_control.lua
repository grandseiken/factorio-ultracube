if mods["Flow Control"] then
  data.raw.recipe["pipe-elbow"].enabled = true
  data.raw.recipe["pipe-junction"].enabled = true
  data.raw.recipe["pipe-straight"].enabled = true

  data.raw.recipe["pipe-elbow"].order = "cube-" .. data.raw.item["pipe-elbow"].order
  data.raw.recipe["pipe-junction"].order = "cube-" .. data.raw.item["pipe-junction"].order
  data.raw.recipe["pipe-straight"].order = "cube-" .. data.raw.item["pipe-straight"].order

  add_mystery_recipe(1, "pipe-elbow", "pipe")
  add_mystery_recipe(1, "pipe-junction", "pipe")
  add_mystery_recipe(1, "pipe-straight", "pipe")
end

if mods["valves"] then
  data:extend({
    {
      type = "recipe",
      name = "cube-valves-one_way",
      ingredients = {
        {type = "item", name = "pipe", amount = 1},
        {type = "item", name = "cube-basic-matter-unit", amount = 2},
        {type = "item", name = "cube-basic-motor-unit", amount = 1},
      },
      results = {{type = "item", name = "valves-one_way", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "recipe",
      name = "cube-valves-overflow",
      ingredients = {
        {type = "item", name = "pipe", amount = 1},
        {type = "item", name = "cube-electronic-circuit", amount = 1},
        {type = "item", name = "cube-basic-motor-unit", amount = 1},
      },
      results = {{type = "item", name = "valves-overflow", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "recipe",
      name = "cube-valves-top_up",
      ingredients = {
        {type = "item", name = "pipe", amount = 1},
        {type = "item", name = "cube-electronic-circuit", amount = 1},
        {type = "item", name = "cube-basic-motor-unit", amount = 1},
      },
      results = {{type = "item", name = "valves-top_up", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
  })

  local tech = data.raw.technology["cube-fluid-handling"]
  table.insert(tech.effects, {type = "unlock-recipe", recipe = "cube-valves-one_way"})
  table.insert(tech.effects, {type = "unlock-recipe", recipe = "cube-valves-overflow"})
  table.insert(tech.effects, {type = "unlock-recipe", recipe = "cube-valves-top_up"})

  data.raw.item["valves-one_way"].order = "cube-" .. data.raw.item["valves-one_way"].order
  data.raw.item["valves-overflow"].order = "cube-" .. data.raw.item["valves-overflow"].order
  data.raw.item["valves-top_up"].order = "cube-" .. data.raw.item["valves-top_up"].order
  add_mystery_recipe(1, "valves-one_way", "pipe")
  add_mystery_recipe(1, "valves-overflow", "pipe")
  add_mystery_recipe(1, "valves-top_up", "pipe")
end
