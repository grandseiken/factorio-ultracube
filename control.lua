local util = require("util")

local heavy_items = {
  "cube-ultradense-utility-cube",
  "cube-dormant-utility-cube",
}

local unlock_technologies = {
  ["cube-fundamental-comprehension-card"] = 1,
}

local function on_init()
  if not remote.interfaces.freeplay then
    return
  end

  -- Disable starting things.
  if remote.interfaces["freeplay"] then
    remote.call("freeplay", "set_disable_crashsite", true)
    remote.call("freeplay", "set_created_items", {
      ["cube-synthesizer"] = 1,
    })
    remote.call("freeplay", "set_respawn_items", {})
  end

  -- Initialise heavy recipes.
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

script.on_init(on_init)
script.on_configuration_changed(on_init)

local function on_player_created(e)
  if not global["cube_given"] then
    global["cube_given"] = true
    game.players[e.player_index].insert("cube-ultradense-utility-cube")
  end
end

local function set_player_status(e)
  local player = game.players[e.player_index]
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

local function on_mined_entity(e)
  if e.entity.burner and e.entity.burner.currently_burning and
     e.entity.burner.currently_burning.name == "cube-ultradense-utility-cube" then
    e.buffer.insert("cube-dormant-utility-cube")
  end
end

local function on_entity_died(e)
  if e.entity.burner and e.entity.burner.currently_burning and
     e.entity.burner.currently_burning.name == "cube-ultradense-utility-cube" then
    e.loot.insert("cube-dormant-utility-cube")
  end
end

local function on_research_finished(e)
  local unlock_index = unlock_technologies[e.research.name]
  if not unlock_index then
    return
  end
  local filters = {
    {filter = "enabled", invert = true},
    {filter = "research-unit-ingredient", ingredient = e.research.name, mode = "and"},
  }
  for name, index in pairs(unlock_technologies) do
    if index > unlock_index then
      filters[#filters + 1] = {
        filter = "research-unit-ingredient",
        ingredient = name, invert = true, mode = "and",
      }
    end
  end
  for name, _ in pairs(game.get_filtered_technology_prototypes(filters)) do
    e.research.force.technologies[name].enabled = true
  end
end

script.on_event(defines.events.on_player_created, on_player_created)
script.on_event(defines.events.on_player_main_inventory_changed, set_player_status)
script.on_event(defines.events.on_player_dropped_item, set_player_status)
script.on_event(defines.events.on_player_cancelled_crafting, set_player_status)
script.on_event(defines.events.on_player_crafted_item, set_player_status)
script.on_event(defines.events.on_player_cursor_stack_changed, set_player_status)
script.on_event(defines.events.on_player_fast_transferred, set_player_status)
script.on_event(defines.events.on_pre_player_crafted_item, set_player_status)
script.on_event(defines.events.on_player_mined_entity, on_mined_entity)
script.on_event(defines.events.on_robot_mined_entity, on_mined_entity)
script.on_event(defines.events.on_entity_died, on_entity_died)
script.on_event(defines.events.on_research_finished, on_research_finished)
