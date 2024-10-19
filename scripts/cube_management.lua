require("__Ultracube__/scripts/lib")

local cube_defines = {
  ultradense = "cube-ultradense-utility-cube",
  dormant = "cube-dormant-utility-cube",
  combustion = "cube-ultradense-combustion-cube",
  dormant_combustion = "cube-dormant-combustion-cube",
  ultradense_phantom = "cube-phantom-ultradense-constituent",
  dormant_phantom = "cube-dormant-phantom-constituent",
  legendary_iron_gear = "cube-legendary-iron-gear",
  fuel_category = "cube-cube",
}

local cubes = {
  ultradense = cube_defines.ultradense,
  ultradense_phantom = cube_defines.ultradense_phantom,
  combustion = cube_defines.combustion,
  dormant_combustion = cube_defines.dormant_combustion,
  dormant = cube_defines.dormant,
  dormant_phantom = cube_defines.dormant_phantom,
  legendary_iron_gear = cube_defines.legendary_iron_gear,
}

local cube_info = make_set({
  cubes.ultradense,
  cubes.dormant,
  cubes.combustion,
  cubes.dormant_combustion,
  cubes.ultradense_phantom,
  cubes.dormant_phantom,
  cubes.legendary_iron_gear,
})

local cube_drop = make_set({
  cubes.ultradense,
  cubes.dormant,
  cubes.combustion,
  cubes.dormant_combustion,
  cubes.ultradense_phantom,
  cubes.dormant_phantom,
  cubes.legendary_iron_gear,
  "cube-ultradense-debris",
  "cube-ultradense-powder",
  "cube-ultradense-mineral",
  "cube-ultradense-matter-unit",
  "cube-ultradense-composite",
})

local cube_weight = {
  [cubes.ultradense] = 1,
  [cubes.dormant] = 1,
  [cubes.combustion] = 1,
  [cubes.dormant_combustion] = 1,
  [cubes.ultradense_phantom] = 0,
  [cubes.dormant_phantom] = 0,
  [cubes.legendary_iron_gear] = 0,
}

local cube_ultradense_fuel = {
  [cubes.ultradense] = cubes.dormant,
  [cubes.combustion] = cubes.dormant_combustion,
}

local cube_management = {
  cube_defines = cube_defines,
  cubes = cubes,
  cube_info = cube_info,
  cube_drop = cube_drop,
  cube_weight = cube_weight,
  cube_ultradense_fuel = cube_ultradense_fuel,
}

local cube_recipes_cache = nil
function cube_management.recipes()
  if cube_recipes_cache then
    return cube_recipes_cache
  end

  cube_recipes_cache = {}
  for name, recipe in pairs(prototypes.recipe) do
    local data = {recipe = recipe, total_weight = 0, ingredients = {}}
    local is_cube_recipe = false
    for k, _ in pairs(cube_info) do
      data.ingredients[k] = 0
    end
    for _, ingredient in ipairs(recipe.ingredients) do
      if cube_info[ingredient.name] then
        is_cube_recipe = true
        data.total_weight = data.total_weight + ingredient.amount * cube_weight[ingredient.name]
        data.ingredients[ingredient.name] = ingredient.amount
      end
    end
    if is_cube_recipe then
      cube_recipes_cache[name] = data
    end
  end
  return cube_recipes_cache
end

local cube_recipe_categories_cache = nil
function cube_management.recipe_categories()
  if cube_recipe_categories_cache then
    return cube_recipe_categories_cache
  end

  cube_recipe_categories_cache = {}
  for _, data in pairs(cube_management.recipes()) do
    cube_recipe_categories_cache[data.recipe.category] = true
  end
  return cube_recipe_categories_cache
end

local module_machine_types = {"furnace", "assembling-machine", "rocket-silo", "lab", "mining-drill"}
local module_machines_cache = nil
function cube_management.module_machines()
  if module_machines_cache then
    return module_machines_cache
  end

  module_machines_cache = {}
  local entity_prototypes = prototypes.get_entity_filtered {{
    filter = "type",
    type = module_machine_types,
  }}
  for name, prototype in pairs(entity_prototypes) do
    if prototype.module_inventory_size and prototype.module_inventory_size > 0 then
      module_machines_cache[name] = true
    elseif prototype.allowed_effects then
      for _, _ in pairs(prototype.allowed_effects) do
        module_machines_cache[name] = true
        break
      end
    end
  end
  return module_machines_cache
end

function cube_management.player_data(player)
  local total_weight = 0
  local ingredients = {}
  for _, item in pairs(cubes) do
    ingredients[item] = 0
  end
  local recipes = cube_management.recipes()
  if (player.controller_type == defines.controllers.character or
      player.controller_type == defines.controllers.god) and player.crafting_queue then
    for _, craft in ipairs(player.crafting_queue) do
      local recipe = recipes[craft.recipe]
      if recipe then
        total_weight = math.max(total_weight, recipe.total_weight)
        for k, count in pairs(recipe.ingredients) do
          ingredients[k] = ingredients[k] + craft.count * count
        end
      end
    end
  end
  ingredients[cubes.ultradense] = math.min(ingredients[cubes.ultradense], 1)
  ingredients[cubes.dormant] = math.min(ingredients[cubes.dormant], 1)
  for _, item in pairs(cubes) do
    local count = player.get_item_count(item)
    local trash = player.get_inventory(defines.inventory.character_trash)
    if trash then
      count = count + trash.get_item_count(item)
    end
    total_weight = total_weight + count * cube_weight[item]
    ingredients[item] = ingredients[item] + count
  end
  return {total_weight = total_weight, ingredients = ingredients}
end

function cube_management.update_player(player_index)
  local player = game.get_player(player_index)
  if player.controller_type == defines.controllers.character then
    player.character_running_speed_modifier = -1.0 + 0.5^cube_management.player_data(player).total_weight
  end
end

function cube_management.get_entity_burning_fuel(entity)
  if entity.burner and entity.burner.currently_burning then
    return entity.burner.currently_burning.name
  end
  return nil
end

function cube_management.is_entity_burning_fuel(entity, fuel_item)
  return entity.burner and entity.burner.currently_burning and
         entity.burner.currently_burning.name == fuel_item
end

function cube_management.drop_before_leaving(player_index)
  local player = game.get_player(player_index)
  local recipes = cube_management.recipes()
  local keep_going = true
  while keep_going and player.crafting_queue do
    keep_going = false
    for _, craft in ipairs(player.crafting_queue) do
      if recipes[craft.recipe] then
        player.cancel_crafting {index = craft.index, count = craft.count}
        keep_going = true
        break
      end
    end
  end

  local results = {}
  local keep_going = true
  while keep_going do
    keep_going = false
    for item, _ in pairs(cube_drop) do
      local removed = player.remove_item(item)
      if removed > 0 then
        local spill = player.surface.spill_item_stack(player.position, {name = item, count = removed}, false, nil, false)
        for _, e in ipairs(spill) do
          results[#results + 1] = e
        end
        keep_going = true
      end
    end
  end
  return results
end

return cube_management