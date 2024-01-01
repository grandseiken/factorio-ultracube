if mods["textplates"] then
  local textplates = {
    "stone", "iron", "copper", "steel",
    "concrete", "glass", "gold", "plastic", "uranium",
  }
  local recipes = data.raw.recipe
  for _, v in ipairs(textplates) do
    if recipes["textplate-small-" .. v] then
      recipes["textplate-small-" .. v].enabled = false
    end
    if recipes["textplate-large-" .. v] then
      recipes["textplate-large-" .. v].enabled = false
    end
    data.raw.technology["textplates-" .. v] = nil
  end

  local function handle_textplates(material, ingredient, prerequisite, tech_unit)
    local small = "textplate-small-" .. material
    local large = "textplate-large-" .. material
    local technology = "textplates-" .. material

    recipes[small].enabled = false
    recipes[large].enabled = false
    recipes[small].category = "cube-fabricator-handcraft"
    recipes[large].category = "cube-fabricator-handcraft"
    data.raw.technology[technology] = nil
    if ingredient then
      recipes[small].ingredients = {{ingredient, 1}}
      recipes[large].ingredients = {{ingredient, 4}}
      data.raw.item[small].flags = {}
      data.raw.item[large].flags = {}
    else
      data.raw.item[small].flags = {"hidden"}
      data.raw.item[large].flags = {"hidden"}
    end

    if ingredient and prerequisite then
      data:extend({{
        type = "technology",
        name = technology,
        localised_name = {"technology-name.textplate", {"textplates." .. material .. "-C"}},
        effects = {
          {type = "unlock-recipe", recipe = small},
          {type = "unlock-recipe", recipe = large},
        },
        icon = "__textplates__/graphics/entity/" .. material .. "/t.png",
        icon_size = 128,
        order = "a",
        prerequisites = {prerequisite},
        unit = tech_unit,
      }})
    elseif ingredient then
      recipes[small].enabled = true
      recipes[large].enabled = true
    end
  end

  handle_textplates("iron")
  handle_textplates("copper")
  handle_textplates("plastic", "cube-basic-matter-unit")
  handle_textplates("stone", "stone-brick", "cube-electric-furnace", tech_cost_unit("0", 20))
  handle_textplates("steel", "cube-rare-metals", "cube-ultradense-furnace", tech_cost_unit("0", 60))
  handle_textplates("concrete", "concrete", "cube-concrete", tech_cost_unit("1a", 60))
  handle_textplates("glass", "cube-glass", "cube-crusher", tech_cost_unit("1a", 60))
  handle_textplates("gold", "sulfur", "cube-sulfur-processing", tech_cost_unit("1a", 120))
  handle_textplates("uranium", "uranium-238", "cube-uranium-processing", tech_cost_unit("2", 120))

  add_mystery_recipe(1, "textplate-small-plastic", "cube-basic-matter-unit")
  add_mystery_recipe(1, "textplate-large-plastic", "cube-basic-matter-unit")
  add_mystery_recipe(1, "textplate-small-stone", "stone")
  add_mystery_recipe(1, "textplate-large-stone", "stone")
  add_mystery_recipe(1, "textplate-small-steel", "cube-rare-metals")
  add_mystery_recipe(1, "textplate-large-steel", "cube-rare-metals")
  add_mystery_recipe(1, "textplate-small-concrete", "concrete")
  add_mystery_recipe(1, "textplate-large-concrete", "concrete")
  add_mystery_recipe(1, "textplate-small-glass", "cube-glass")
  add_mystery_recipe(1, "textplate-large-glass", "cube-glass")
  add_mystery_recipe(1, "textplate-small-gold", "sulfur")
  add_mystery_recipe(1, "textplate-large-gold", "sulfur")
  add_mystery_recipe(1, "textplate-small-uranium", "uranium-238")
  add_mystery_recipe(1, "textplate-large-uranium", "uranium-238")
end
