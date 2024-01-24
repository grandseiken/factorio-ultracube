local recipes = data.raw.recipe
local items = data.raw.item

for name, fluid in pairs(data.raw.fluid) do
  local item_name = name .. "-barrel"
  local item = items[item_name]
  local fill_recipe = recipes["fill-" .. item_name]
  local empty_recipe = recipes["empty-" .. item_name]

  if item and fill_recipe and empty_recipe then
    item.subgroup = "cube-fill-barrel"
    fill_recipe.subgroup = "cube-fill-barrel"
    fill_recipe.category = "cube-fabricator"
    empty_recipe.subgroup = "cube-empty-barrel"
    empty_recipe.category = "cube-fabricator"

    local subgroup = data.raw["item-subgroup"][fluid.subgroup]
    local order = "cube-0-" .. fluid.order
    if subgroup then
      order = "cube-" .. subgroup.order .. "-" .. fluid.order
    end

    item.order = order
    fill_recipe.order = order
    empty_recipe.order = order

    local tech = data.raw.technology[fluid.barrelling_unlock_tech or "cube-fluid-handling"]
    table.insert(tech.effects, {type = "unlock-recipe", recipe = fill_recipe.name})
    table.insert(tech.effects, {type = "unlock-recipe", recipe = empty_recipe.name})
    add_mystery_recipe(1, item_name, "empty-barrel")
  end
end