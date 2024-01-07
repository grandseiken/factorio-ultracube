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
    {
      type = "technology",
      name = "cathodes",
      icon_size = 128, icon_mipmaps = 4,
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
    {"cube-electronic-circuit", 1},
    {"cube-glass", 2},
    {"cube-basic-matter-unit", 2},
  }
  recipe = data.raw.recipe["SNTD-nixie-tube"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {"SNTD-old-nixie-tube", 2},
    {"cube-rare-metals", 4},
    {"cube-basic-matter-unit", 4},
  }
  recipe = data.raw.recipe["SNTD-nixie-tube-small"]
  recipe.category = "cube-fabricator-handcraft"
  recipe.ingredients = {
    {"SNTD-old-nixie-tube", 1},
    {"cube-rare-metals", 2},
    {"cube-basic-matter-unit", 2},
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