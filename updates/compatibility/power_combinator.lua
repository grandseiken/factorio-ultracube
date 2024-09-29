if mods["power-combinator"] then

  -- Loup: This is not a one-to-one conversion. I'm messing with the recipes to not worry about compatibility with wire ingredients, and to just make it simpler.

  -- Technology
  local tech = data.raw.technology["power-combinator"]
  tech.prerequisites = {
    "cube-combinatorics",
  }
  tech.unit = tech_cost_unit("1b", 100)


  local tech2 = data.raw.technology["power-combinator-MK2"]
  tech2.prerequisites = {
    "power-combinator",
  }
  tech2.unit = tech_cost_unit("2", 100)

  -- Recipes
  local recipe = data.raw.recipe["power-combinator"]
    recipe.category = "cube-fabricator-handcraft"
    recipe.ingredients = {
        {"constant-combinator", 1},
        {"cube-electronic-circuit", 1},
    }
  data.raw.item["power-combinator"].order = "cube-" .. data.raw.item["power-combinator"].order
  add_mystery_recipe(1, "power-combinator", "constant-combinator")

  -- Recipe: Filter power combinator
    local recipe2 = data.raw.recipe["power-combinator-MK2"]
    recipe2.category = "cube-fabricator-handcraft"
    recipe2.ingredients = {
        {"power-combinator", 1},
        {"cube-advanced-circuit", 1},
    }
    data.raw.item["power-combinator-MK2"].order = "cube-" .. data.raw.item["power-combinator-MK2"].order
    add_mystery_recipe(1, "power-combinator-MK2", "power-combinator")
end
