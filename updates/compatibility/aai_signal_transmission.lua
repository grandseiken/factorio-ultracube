if mods["aai-signal-transmission"] then
  data:extend({
    {
      type = "recipe",
      name = "cube-aai-signal-sender",
      ingredients = {
        {"cube-spectral-processor", 20},
        {"battery", 20},
        {"cube-rare-metals", 10},
        {"cube-advanced-engine", 10},
      },
      result = "aai-signal-sender",
      enabled = false,
      energy_required = 10,
    },
    {
      type = "recipe",
      name = "cube-aai-signal-receiver",
      ingredients = {
        {"cube-spectral-processor", 20},
        {"cube-sophisticated-matter-unit", 20},
        {"cube-rare-metals", 20},
        {"cube-advanced-engine", 10},
      },
      result = "aai-signal-receiver",
      enabled = false,
      energy_required = 10,
    },
    {
      type = "technology",
      name = "aai-signal-transmission",
      icon_size = 256,
      icon = "__aai-signal-transmission__/graphics/technology/signal-transmission.png",
      effects = {
        {type = "unlock-recipe", recipe = "cube-aai-signal-sender"},
        {type = "unlock-recipe", recipe = "cube-aai-signal-receiver"},
      },
      prerequisites = {"cube-phantom-electronics"},
      unit = tech_cost_unit("2", 180),
      order = "x-0-0",
    },
  })

  add_mystery_recipe(1, "aai-signal-sender", "cube-spectral-processor")
  add_mystery_recipe(1, "aai-signal-receiver", "cube-spectral-processor")

  data.raw.item["aai-signal-sender"].subgroup = "cube-combinator-extra"
  data.raw.item["aai-signal-sender"].order = "a-z-a"
  data.raw.item["aai-signal-receiver"].subgroup = "cube-combinator-extra"
  data.raw.item["aai-signal-receiver"].order = "a-z-b"
end
