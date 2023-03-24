require("scripts.cube_fx")
require("scripts.cube_management")
require("scripts.entity_cache")
require("scripts.tech_unlock")

local function on_load()
  entity_cache_on_load()
end

local function on_init()
  -- Disable starting things.
  if remote.interfaces.freeplay then
    remote.call("freeplay", "set_disable_crashsite", true)
    remote.call("freeplay", "set_created_items", {
      ["cube-synthesizer"] = 1,
    })
    remote.call("freeplay", "set_respawn_items", {})
  end

  refresh_entity_cache()
  for _, force in pairs(game.forces) do
    sync_unlock_technologies(force)
  end
  on_load()
end

script.on_load(on_load)
script.on_init(on_init)
script.on_configuration_changed(on_init)

script.on_event(
  defines.events.on_console_command,
  function (e)
    if e.command == "cube-refresh" then
      on_init()
      game.print("Refreshed data.")
    end
  end)

script.on_event(
  defines.events.on_player_created,
  function(e)
    if not global.cube_given then
      global.cube_given = true
      game.players[e.player_index].insert(cubes.ultradense)
    end
  end)

script.on_event(
  {
    defines.events.on_player_main_inventory_changed,
    defines.events.on_player_dropped_item,
    defines.events.on_player_cancelled_crafting,
    defines.events.on_player_crafted_item,
    defines.events.on_player_cursor_stack_changed,
    defines.events.on_player_fast_transferred,
    defines.events.on_pre_player_crafted_item
  },
  function(e)
    update_player_cube_status(e.player_index)
  end)

script.on_event(
  {
    defines.events.on_built_entity,
    defines.events.on_robot_built_entity
  },
  function(e)
    add_entity_cache(e.created_entity)
  end)

script.on_event(
  defines.events.on_entity_died,
  function(e)
    return_cube_fuel(e.entity, e.loot)
    remove_entity_cache(e.entity)
  end)

script.on_event(
  {
    defines.events.on_player_mined_entity,
    defines.events.on_robot_mined_entity
  },
  function(e)
    return_cube_fuel(e.entity, e.buffer)
    remove_entity_cache(e.entity)
  end)

script.on_event(
  defines.events.on_research_finished,
  function(e)
    unlock_technologies(e.research.force, e.research.name, true)
  end)

script.on_event(defines.events.on_tick,
  function(e)
    cube_fx_tick(e.tick)
  end)