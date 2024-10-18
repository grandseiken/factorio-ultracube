local function handle_technology(technology_name, unit, prerequisites)
  local tech = data.raw.technology[technology_name]
  local recipes = {}

  for _, e in ipairs(tech.effects) do
    if e.type == "unlock-recipe" then
      recipes[#recipes + 1] = e.recipe
    end
  end
  tech.prerequisites = prerequisites
  tech.unit = unit

  for _, name in ipairs(recipes) do
    data.raw.recipe[name].category = "cube-fabricator-handcraft"
    data.raw.item[name].order = "cube-" .. data.raw.item[name].order
    add_mystery_recipe(1, name, "pipe")
  end
end

if mods["underground-pipe-pack"] then
  data.raw.recipe["check-valve"].ingredients = {
    {type = "item", name = "pipe", amount = 1},
    {type = "item", name = "cube-basic-matter-unit", amount = 2},
    {type = "item", name = "cube-basic-motor-unit", amount = 1},
  }
  data.raw.recipe["80-overflow-valve"].ingredients = {
    {type = "item", name = "pipe", amount = 1},
    {type = "item", name = "cube-basic-matter-unit", amount = 2},
    {type = "item", name = "cube-basic-motor-unit", amount = 1},
  }
  data.raw.recipe["80-top-up-valve"].ingredients = {
    {type = "item", name = "pipe", amount = 1},
    {type = "item", name = "cube-basic-matter-unit", amount = 2},
    {type = "item", name = "cube-basic-motor-unit", amount = 1},
  }
  data.raw.recipe["underground-mini-pump"].ingredients = {
    {type = "item", name = "cube-basic-motor-unit", amount = 1},
    {type = "item", name = "cube-rare-metals", amount = 2},
    {type = "item", name = "small-pipe-coupler", amount = 2},
    {type = "item", name = "underground-pipe-segment-t1", amount = 10},
  }

  data.raw.recipe["underground-pipe-segment-t1"].ingredients = {
    {type = "item", name = "pipe", amount = 1},
    {type = "item", name = "stone", amount = 1},
  }
  data.raw.recipe["underground-pipe-segment-t2"].ingredients = {
    {type = "item", name = "underground-pipe-segment-t1", amount = 1},
    {type = "item", name = "cube-sophisticated-matter-unit", amount = 1},
    {type = "item", name = "stone", amount = 1},
  }
  data.raw.recipe["underground-pipe-segment-t3"].ingredients = {
    {type = "item", name = "underground-pipe-segment-t2", amount = 1},
    {type = "item", name = "cube-resplendent-plate", amount = 1},
    {type = "item", name = "stone", amount = 1},
  }

  data.raw.recipe["swivel-joint"].ingredients = {
    {type = "item", name = "cube-rare-metals", amount = 1},
    {type = "item", name = "cube-basic-matter-unit", amount = 2},
  }
  data.raw.recipe["small-pipe-coupler"].ingredients = {
    {type = "item", name = "cube-rare-metals", amount = 2},
    {type = "item", name = "cube-basic-matter-unit", amount = 1},
  }
  data.raw.recipe["medium-pipe-coupler"].ingredients = {
    {type = "item", name = "small-pipe-coupler", amount = 1},
    {type = "item", name = "cube-sophisticated-matter-unit", amount = 1},
    {type = "item", name = "cube-rare-metals", amount = 2},
  }
  data.raw.recipe["large-pipe-coupler"].ingredients = {
    {type = "item", name = "medium-pipe-coupler", amount = 1},
    {type = "item", name = "cube-resplendent-plate", amount = 1},
    {type = "item", name = "cube-rare-metals", amount = 2},
  }

  handle_technology(
    "advanced-underground-piping",
    tech_cost_unit("1a", 120),
    {
      "cube-fluid-handling",
      "cube-fundamental-comprehension-card",
    })

  handle_technology(
    "advanced-underground-piping-t2",
    tech_cost_unit("2", 180),
    {
      "advanced-underground-piping",
      "cube-sophisticated-matter-unit",
    })

  handle_technology(
    "advanced-underground-piping-t3",
    tech_cost_unit("3", 240),
    {
      "advanced-underground-piping-t2",
      "cube-deep-introspection-card",
    })
end
