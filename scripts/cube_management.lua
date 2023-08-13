require("__Ultracube__/scripts/lib")

cube_defines = {
  ultradense = "cube-ultradense-utility-cube",
  dormant = "cube-dormant-utility-cube",
  fuel_category = "cube-cube",
}

cubes = {
  ultradense = cube_defines.ultradense,
  dormant = cube_defines.dormant,
}

cube_info = make_set({cubes.ultradense, cubes.dormant})

local cubes = cubes
local cube_info = cube_info

local cube_recipes_cache = nil
function cube_recipes()
  if not cube_recipes_cache then
    cube_recipes_cache = {}
    for name, recipe in pairs(game.recipe_prototypes) do
      local data = {recipe = recipe, total = 0, ingredients = {}}
      for k, _ in pairs(cube_info) do
        data.ingredients[k] = 0
      end
      for _, ingredient in ipairs(recipe.ingredients) do
        if cube_info[ingredient.name] then
          data.total = data.total + ingredient.amount
          data.ingredients[ingredient.name] = ingredient.amount
        end
      end
      if data.total > 0 then
        cube_recipes_cache[name] = data
      end
    end
  end
  return cube_recipes_cache
end

local cube_recipe_categories_cache = nil
function cube_recipe_categories()
  if not cube_recipe_categories_cache then
    cube_recipe_categories_cache = {}
    for _, data in pairs(cube_recipes()) do
      cube_recipe_categories_cache[data.recipe.category] = true
    end
  end
  return cube_recipe_categories_cache
end

function player_cube_data(player)
  local data = {total = 0, ingredients = {}}
  for _, item in pairs(cubes) do
    data.ingredients[item] = 0
  end
  local recipes = cube_recipes()
  if player.crafting_queue then
    for _, craft in ipairs(player.crafting_queue) do
      local recipe = recipes[craft.recipe]
      if recipe then
        data.total = math.max(data.total, recipe.total)
        for k, count in pairs(recipe.ingredients) do
          data.ingredients[k] = math.max(data.ingredients[k], count)
        end
      end
    end
  end
  for _, item in pairs(cubes) do
    local count = player.get_item_count(item)
    data.total = data.total + count
    data.ingredients[item] = data.ingredients[item] + count
  end
  return data
end

function update_player_cube_status(player_index)
  local player = game.players[player_index]
  if player.controller_type == defines.controllers.character then
    player.character_running_speed_modifier = -1.0 + 0.5^player_cube_data(player).total
  end
end

function is_entity_burning_fuel(entity, fuel_item)
  return entity.burner and entity.burner.currently_burning and
         entity.burner.currently_burning.name == fuel_item
end

function return_cube_fuel(entity, inventory)
  if is_entity_burning_fuel(entity, cubes.ultradense) then
    inventory.insert(cubes.dormant)
  end
end