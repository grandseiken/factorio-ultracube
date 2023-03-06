local util = require("util")

local heavy_recipes = {}
local heavy_items = {
  "cube-hyperdense-utility-cube",
  "cube-depleted-utility-cube",
}

local function on_init()
  if not remote.interfaces.freeplay then
    return
  end

  -- Disable starting things.
  if remote.interfaces["freeplay"] then
    remote.call("freeplay", "set_disable_crashsite", true)
    remote.call("freeplay", "set_created_items", {})
    remote.call("freeplay", "set_respawn_items", {})
  end

  -- Initialise heavy recipes.
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
    heavy_recipes[name] = count
  end
end

script.on_init(on_init)
script.on_configuration_changed(on_init)

function on_player_created(e)
  if not global["cube_given"] then
    global["cube_given"] = true
    game.players[e.player_index].insert("cube-hyperdense-utility-cube")
  end
end

function set_player_status(e)
  local player = game.players[e.player_index]
  local count = 0.0
  for _, item in ipairs(heavy_items) do
    count = count + player.get_item_count(item)
  end
  if player.crafting_queue then
    for _, craft in ipairs(player.crafting_queue) do
      if heavy_recipes[craft.recipe] then
        count = count + heavy_recipes[craft.recipe]
      end
    end
  end
  player.character_running_speed_modifier = -1.0 + 0.5^count
end

function on_mined_entity(e)
  if e.entity.burner and
     e.entity.burner.currently_burning.name == "cube-hyperdense-utility-cube" then
    e.buffer.insert("cube-depleted-utility-cube")
  end
end

function on_entity_died(e)
  if e.entity.burner and
     e.entity.burner.currently_burning.name == "cube-hyperdense-utility-cube" then
    e.loot.insert("cube-depleted-utility-cube")
  end
end

script.on_event(defines.events.on_player_created, on_player_created)
script.on_event(defines.events.on_player_main_inventory_changed, set_player_status)
script.on_event(defines.events.on_player_dropped_item, set_player_status)
script.on_event(defines.events.on_player_cancelled_crafting, set_player_status)
script.on_event(defines.events.on_player_cursor_stack_changed, set_player_status)
script.on_event(defines.events.on_player_fast_transferred, set_player_status)
script.on_event(defines.events.on_pre_player_crafted_item, set_player_status)
script.on_event(defines.events.on_player_mined_entity, on_mined_entity)
script.on_event(defines.events.on_robot_mined_entity, on_mined_entity)
script.on_event(defines.events.on_entity_died, on_entity_died)
