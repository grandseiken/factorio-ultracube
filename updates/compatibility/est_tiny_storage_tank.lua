if mods["est-tiny-storage-tank"] then
  local technology = data.raw.technology["cube-fluid-handling"]
  local enable_setting = settings.startup["tiny-storage-tank-enable"].value

  if enable_setting == "both-variants" or enable_setting == "inline-variant" then
    table.insert(technology.effects, {type = "unlock-recipe", recipe = "tiny-inline-storage-tank"})
    data:extend({{
      type = "recipe",
      name = "tiny-inline-storage-tank",
      ingredients = {
        {type = "item", name = "cube-basic-matter-unit", amount = 4},
        {type = "item", name = "cube-rare-metals", amount = 4},
        {type = "item", name = "pipe", amount = 1}
      },
      results = {{type = "item", name = "tiny-inline-storage-tank", amount = 1}},
      energy_required = 2,
      category = "cube-fabricator-handcraft",
      enabled = false,
    }})
    data.raw.item["tiny-inline-storage-tank"].subgroup = "storage"
    data.raw.item["tiny-inline-storage-tank"].order = "cube-y"
    add_mystery_recipe(1, "tiny-inline-storage-tank", "pipe")
  end
  if enable_setting == "both-variants" or enable_setting == "fourway-variant" then
    table.insert(technology.effects, {type = "unlock-recipe", recipe = "tiny-4way-storage-tank"})
    data:extend({{
      type = "recipe",
      name = "tiny-4way-storage-tank",
      ingredients = {
          {type = "item", name = "cube-basic-matter-unit", amount = 4},
          {type = "item", name = "cube-rare-metals", amount = 4},
          {type = "item", name = "pipe", amount = 2}
      },
      results = {{type = "item", name = "tiny-4way-storage-tank", amount = 1}},
      energy_required = 2,
      category = "cube-fabricator-handcraft",
      enabled = false,
    }})
    data.raw.item["tiny-4way-storage-tank"].subgroup = "storage"
    data.raw.item["tiny-4way-storage-tank"].order = "cube-y"
    add_mystery_recipe(2, "tiny-4way-storage-tank", "pipe")
  end
end