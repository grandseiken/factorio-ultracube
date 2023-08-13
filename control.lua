do
  local modloader = remote.interfaces["modloader"]
  if modloader and modloader[script.mod_name] then
    return
  end
end

require("__Ultracube__/scripts/cube_fx")
require("__Ultracube__/scripts/cube_management")
require("__Ultracube__/scripts/entity_cache")
require("__Ultracube__/scripts/multi_furnace")
require("__Ultracube__/scripts/tech_unlock")

local function on_picker_dolly_moved(e)
  remove_entity_cache(e.moved_entity, e.start_pos)
  add_entity_cache(e.moved_entity)
end

local function on_load()
  entity_cache_on_load()
  cube_fx_data_on_load()
  cube_search_data_on_load()

  if remote.interfaces["PickerDollies"] and remote.interfaces["PickerDollies"]["dolly_moved_entity_id"] then
    script.on_event(remote.call("PickerDollies", "dolly_moved_entity_id"), on_picker_dolly_moved)
  end
end

local function on_init()
  -- Disable starting things.
  if remote.interfaces.freeplay then
    remote.call("freeplay", "set_disable_crashsite", true)
    remote.call("freeplay", "set_created_items", {
      ["cube-synthesizer"] = 1,
      ["cube-fabricator"] = 1,
      ["cube-construction-robot-0"] = 5,
    })
    remote.call("freeplay", "set_respawn_items", {})
  end

  refresh_entity_cache()
  refresh_cube_fx_data()
  refresh_cube_search_data()
  for _, force in pairs(game.forces) do
    sync_unlock_technologies(force)
  end
  on_load()
end

local function on_player_created(e)
  local player = game.players[e.player_index]
  if not global.cube_given then
    global.cube_given = true
    player.insert(cubes.ultradense)
  end

  local inventory = player.get_inventory(defines.inventory.character_armor)
  inventory.insert("cube-modular-armor")
  local grid = inventory[1].grid
  grid.put {name = "cube-personal-roboport-equipment"}
  grid.put {name = "cube-battery-equipment"}
  grid.put {name = "cube-solar-panel-equipment"}
  grid.put {name = "cube-solar-panel-equipment"}
end

script.on_load(on_load)
script.on_init(on_init)
script.on_configuration_changed(on_init)

commands.add_command(
  "cube_refresh", nil,
  function()
    on_init()
    game.print("Refreshed data.")
  end)

script.on_event(defines.events.on_player_created, on_player_created)

script.on_event(
  {
    defines.events.on_player_main_inventory_changed,
    defines.events.on_player_cancelled_crafting,
    defines.events.on_player_crafted_item,
    defines.events.on_player_cursor_stack_changed,
    defines.events.on_pre_player_crafted_item
  },
  function(e)
    update_player_cube_status(e.player_index)
  end)

script.on_event(
  {
    defines.events.on_player_dropped_item,
    defines.events.on_player_fast_transferred,
  },
  function(e)
    update_player_cube_status(e.player_index)
    cube_search_hint_entity(e.entity)
  end)

-- TODO: does fast replace leave broken entries in cache?
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
  {
    defines.events.on_surface_cleared,
    defines.events.on_surface_deleted,
  },
  function(e)
    refresh_entity_cache()
  end)

script.on_event(
  defines.events.on_research_finished,
  function(e)
    unlock_technologies(e.research.force, e.research.name, true)
  end)

script.on_event(defines.events.on_tick,
  function(e)
    cube_fx_tick(e.tick)
    multi_furnace_tick(e.tick)
  end)