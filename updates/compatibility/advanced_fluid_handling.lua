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
    {"pipe", 1},
    {"cube-basic-matter-unit", 2},
    {"cube-basic-motor-unit", 1},
  }
  data.raw.recipe["80-overflow-valve"].ingredients = {
    {"pipe", 1},
    {"cube-basic-matter-unit", 2},
    {"cube-basic-motor-unit", 1},
  }
  data.raw.recipe["80-top-up-valve"].ingredients = {
    {"pipe", 1},
    {"cube-basic-matter-unit", 2},
    {"cube-basic-motor-unit", 1},
  }
  data.raw.recipe["underground-mini-pump"].ingredients = {
    {"cube-basic-motor-unit", 1},
    {"cube-rare-metals", 2},
    {"small-pipe-coupler", 2},
    {"underground-pipe-segment-t1", 10},
  }

  data.raw.recipe["underground-pipe-segment-t1"].ingredients = {
    {"pipe", 1},
    {"stone", 1},
  }
  data.raw.recipe["underground-pipe-segment-t2"].ingredients = {
    {"underground-pipe-segment-t1", 1},
    {"cube-sophisticated-matter-unit", 1},
    {"stone", 1},
  }
  data.raw.recipe["underground-pipe-segment-t3"].ingredients = {
    {"underground-pipe-segment-t2", 1},
    {"cube-resplendent-plate", 1},
    {"stone", 1},
  }

  data.raw.recipe["swivel-joint"].ingredients = {
    {"cube-rare-metals", 1},
    {"cube-basic-matter-unit", 2},
  }
  data.raw.recipe["small-pipe-coupler"].ingredients = {
    {"cube-rare-metals", 2},
    {"cube-basic-matter-unit", 1},
  }
  data.raw.recipe["medium-pipe-coupler"].ingredients = {
    {"small-pipe-coupler", 1},
    {"cube-sophisticated-matter-unit", 1},
    {"cube-rare-metals", 2},
  }
  data.raw.recipe["large-pipe-coupler"].ingredients = {
    {"medium-pipe-coupler", 1},
    {"cube-resplendent-plate", 1},
    {"cube-rare-metals", 2},
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
