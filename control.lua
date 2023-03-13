require("scripts.cube_management")
require("scripts.tech_unlock")

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

  initialise_cube_management()
  for _, force in pairs(game.forces) do
    sync_unlock_technologies(force)
  end
end

script.on_init(on_init)
script.on_configuration_changed(on_init)

local function on_player_created(e)
  if not global["cube_given"] then
    global["cube_given"] = true
    game.players[e.player_index].insert("cube-ultradense-utility-cube")
  end
end

local function on_player_item_change(e)
  update_player_cube_status(e.player_index)
end

local function on_mined_entity(e)
  return_cube_fuel(e.entity, e.buffer)
end

local function on_entity_died(e)
  return_cube_fuel(e.entity, e.loot)
end

script.on_event(defines.events.on_player_created, on_player_created)

script.on_event(defines.events.on_player_main_inventory_changed, on_player_item_change)
script.on_event(defines.events.on_player_dropped_item, on_player_item_change)
script.on_event(defines.events.on_player_cancelled_crafting, on_player_item_change)
script.on_event(defines.events.on_player_crafted_item, on_player_item_change)
script.on_event(defines.events.on_player_cursor_stack_changed, on_player_item_change)
script.on_event(defines.events.on_player_fast_transferred, on_player_item_change)
script.on_event(defines.events.on_pre_player_crafted_item, on_player_item_change)

script.on_event(defines.events.on_player_mined_entity, on_mined_entity)
script.on_event(defines.events.on_robot_mined_entity, on_mined_entity)
script.on_event(defines.events.on_entity_died, on_entity_died)

script.on_event(defines.events.on_research_finished, function(e)
  unlock_technologies(e.research.force, e.research.name, true)
end)
