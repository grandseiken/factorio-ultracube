local heavy_items = {
  "cube-ultradense-utility-cube",
  "cube-dormant-utility-cube",
}

function initialise_cube_management()
  local heavy_recipes = {}
  for name, recipe in pairs(game.recipe_prototypes) do
    local count = 0.0
    for _, ingredient in ipairs(recipe.ingredients) do
      for _, item in ipairs(heavy_items) do
        if item == ingredient.name then
          count = count + ingredient.amount
          break
        end
      end
    end
    if count > 0.0 then
      heavy_recipes[name] = count
    end
  end
  global["heavy_recipes"] = heavy_recipes
end

function update_player_cube_status(player_index)
  local player = game.players[player_index]
  local count = 0.0
  for _, item in ipairs(heavy_items) do
    count = count + player.get_item_count(item)
  end
  local heavy_recipes = global["heavy_recipes"]
  if player.crafting_queue then
    for _, craft in ipairs(player.crafting_queue) do
      if heavy_recipes[craft.recipe] then
        count = count + heavy_recipes[craft.recipe]
      end
    end
  end
  player.character_running_speed_modifier = -1.0 + 0.5^count
end

function return_cube_fuel(entity, inventory)
  if entity.burner and entity.burner.currently_burning and
     entity.burner.currently_burning.name == "cube-ultradense-utility-cube" then
    inventory.insert("cube-dormant-utility-cube")
  end
end