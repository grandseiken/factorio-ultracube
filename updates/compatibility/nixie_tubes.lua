if mods["nixie-tubes"] then
  data:extend({
    {
      type = "recipe",
      name = "cube-nixie-tube",
      localised_name = {"item-name.nixie-tube"},
      ingredients = {
        {type = "item", name = "cube-electronic-circuit", amount = 1},
        {type = "item", name = "cube-glass", amount = 2},
        {type = "item", name = "cube-basic-matter-unit", amount = 2},
      },
      results = {{type = "item", name = "nixie-tube", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "recipe",
      name = "cube-nixie-tube-alpha",
      localised_name = {"item-name.nixie-tube-alpha"},
      ingredients = {
        {type = "item", name = "cube-electronic-circuit", amount = 1},
        {type = "item", name = "cube-glass", amount = 2},
        {type = "item", name = "cube-basic-matter-unit", amount = 2},
      },
      results = {{type = "item", name = "nixie-tube-alpha", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "recipe",
      name = "cube-nixie-tube-small",
      localised_name = {"item-name.nixie-tube-small"},
      ingredients = {
        {type = "item", name = "cube-electronic-circuit", amount = 1},
        {type = "item", name = "cube-glass", amount = 1},
        {type = "item", name = "cube-basic-matter-unit", amount = 1},
      },
      results = {{type = "item", name = "nixie-tube-small", amount = 1}},
      energy_required = 1,
      category = "cube-fabricator-handcraft",
      enabled = false,
    },
    {
      type = "technology",
      name = "cathodes",
      icon_size = 128,
      icon = "__nixie-tubes__/graphics/nixie-technology-icon.png",
      effects = {
        {type = "unlock-recipe", recipe = "cube-nixie-tube"},
        {type = "unlock-recipe", recipe = "cube-nixie-tube-alpha"},
        {type = "unlock-recipe", recipe = "cube-nixie-tube-small"},
      },
      prerequisites = {
        "cube-combinatorics",
        "cube-crusher",
      },
      unit = tech_cost_unit("1a", 60),
      order = "x-0-0",
    },
  })

  add_mystery_recipe(1, "nixie-tube", "cube-glass")
  add_mystery_recipe(1, "nixie-tube-alpha", "cube-glass")
  add_mystery_recipe(1, "nixie-tube-small", "cube-glass")

  data.raw.item["nixie-tube"].subgroup = "cube-combinator-extra"
  data.raw.item["nixie-tube"].order = "cube-y"
  data.raw.item["nixie-tube-alpha"].subgroup = "cube-combinator-extra"
  data.raw.item["nixie-tube-alpha"].order = "cube-y"
  data.raw.item["nixie-tube-small"].subgroup = "cube-combinator-extra"
  data.raw.item["nixie-tube-small"].order = "cube-y"
end

if mods["SantasNixieTubeDisplay"] or mods["UPSFriendlyNixieTubeDisplay"] then
  local tech = data.raw.technology["SNTD-nixie-tubes-1"]
  tech.prerequisites = {"cube-combinatorics", "cube-crusher"}
  tech.unit = tech_cost_unit("1a", 60)
  tech = data.raw.technology["SNTD-nixie-tubes-2"]
  tech.unit = tech_cost_unit("1a", 80)

  local recipe = data.raw.recipe["SNTD-old-nixie-tube"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "cube-electronic-circuit", amount = 1},
    {type = "item", name = "cube-glass", amount = 2},
    {type = "item", name = "cube-basic-matter-unit", amount = 2},
  }
  recipe = data.raw.recipe["SNTD-nixie-tube"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "SNTD-old-nixie-tube", amount = 2},
    {type = "item", name = "cube-rare-metals", amount = 4},
    {type = "item", name = "cube-basic-matter-unit", amount = 4},
  }
  recipe = data.raw.recipe["SNTD-nixie-tube-small"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {type = "item", name = "SNTD-old-nixie-tube", amount = 1},
    {type = "item", name = "cube-rare-metals", amount = 2},
    {type = "item", name = "cube-basic-matter-unit", amount = 2},
  }

  data.raw.item["SNTD-old-nixie-tube"].subgroup = "cube-combinator-extra"
  data.raw.item["SNTD-old-nixie-tube"].order = "cube-y-a"
  data.raw.item["SNTD-nixie-tube"].subgroup = "cube-combinator-extra"
  data.raw.item["SNTD-nixie-tube"].order = "cube-y-b"
  data.raw.item["SNTD-nixie-tube-small"].subgroup = "cube-combinator-extra"
  data.raw.item["SNTD-nixie-tube-small"].order = "cube-y-c"

  add_mystery_recipe(1, "SNTD-old-nixie-tube", "cube-glass")
  add_mystery_recipe(1, "SNTD-nixie-tube", "SNTD-old-nixie-tube")
  add_mystery_recipe(1, "SNTD-nixie-tube-small", "SNTD-old-nixie-tube")
end