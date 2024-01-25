do
  local modloader = remote.interfaces["modloader"]
  if modloader and modloader[script.mod_name] then
    return
  end
end

local activation = require("__Ultracube__/scripts/activation")
local cube_fx = require("__Ultracube__/scripts/cube_fx")
local cube_search = require("__Ultracube__/scripts/cube_search")
local cube_management = require("__Ultracube__/scripts/cube_management")
local cubecam = require("__Ultracube__/scripts/cubecam")
local entity_cache = require("__Ultracube__/scripts/entity_cache")
local entity_combine = require("__Ultracube__/scripts/entity_combine")
local linked_entities = require("__Ultracube__/scripts/linked_entities")
local tech_unlock = require("__Ultracube__/scripts/tech_unlock")
local teleport = require("__Ultracube__/scripts/teleport")
local transition = require("__Ultracube__/scripts/transition")
local milestones = require("__Ultracube__/scripts/milestones")

local function create_initial_cube(player)
  local surface = player.surface
  local chest = nil
  for _ = 1, 100 do
    local v = vector_add(player.position, from_polar(16 + 8 * math.random(), 2 * math.pi * math.random()))
    chest = surface.create_entity {
      name = "iron-chest",
      position = v,
      force = player.force,
    }
    if chest then
      break
    end
  end
  if chest then
    chest.insert(cube_management.cubes.ultradense)
    entity_cache.add(chest)
    cube_search.hint_entity(chest)
  else
    error("Couldn't find suitable location to place starting entities.")
  end
end

local function on_entity_removed(entity, old_surface, old_position)
  entity_cache.remove(entity, old_surface, old_position)
  entity_combine.destroyed(entity)
  linked_entities.removed(entity)
  cube_search.remove_entity(entity)
  activation.remove_entity(entity)
end

local function on_entity_added(entity)
  linked_entities.added(entity)
  entity_cache.add(entity)
  entity_combine.created(entity)
end

local function on_entity_move(entity, old_surface, old_position)
  on_entity_removed(entity, old_surface, old_position)
  on_entity_added(entity)
end

local function on_picker_dolly_moved(e)
  on_entity_move(e.moved_entity, nil, e.start_pos)
end

local function on_load()
  activation.on_load()
  entity_cache.on_load()
  cube_fx.on_load()
  cube_search.on_load()
  linked_entities.on_load()

  if remote.interfaces["PickerDollies"] and remote.interfaces["PickerDollies"]["dolly_moved_entity_id"] then
    script.on_event(remote.call("PickerDollies", "dolly_moved_entity_id"), on_picker_dolly_moved)
  end
end

local function on_init()
  -- Disable starting things.
  if remote.interfaces.freeplay then
    remote.call("freeplay", "set_disable_crashsite", true)
    remote.call("freeplay", "set_custom_intro_message", {"cube-msg-intro"})
    remote.call("freeplay", "set_created_items", {
      ["cube-synthesizer"] = 1,
      ["cube-fabricator"] = 1,
      ["construction-robot"] = 5,
    })
    remote.call("freeplay", "set_respawn_items", {})
  end

  for _, interface in pairs {"silo_script", "better-victory-screen"} do
    if remote.interfaces[interface] and remote.interfaces[interface]["set_no_victory"] then
      remote.call(interface, "set_no_victory", true)
    end
  end

  activation.refresh()
  entity_cache.refresh()
  cube_fx.refresh()
  cube_search.refresh()
  linked_entities.refresh()
  for _, force in pairs(game.forces) do
    tech_unlock.sync(force)
  end
  on_load()
end

local function on_player_created(e)
  local player = game.get_player(e.player_index)
  if not global.cube_given then
    global.cube_given = true
    create_initial_cube(player)
  end

  local inventory = player.get_inventory(defines.inventory.character_armor)
  if inventory then
    inventory.insert("cube-regulation-armor")
    local grid = inventory[1].grid
    grid.put {name = "cube-personal-roboport-equipment"}
    grid.put {name = "cube-battery-equipment"}
    grid.put {name = "cube-solar-panel-equipment"}
    grid.put {name = "cube-solar-panel-equipment"}
    for _, grid_equipment in pairs(grid.equipment) do
      grid_equipment.energy = grid_equipment.max_energy
    end
  end
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
    defines.events.on_player_trash_inventory_changed,
    defines.events.on_player_cancelled_crafting,
    defines.events.on_player_crafted_item,
    defines.events.on_player_cursor_stack_changed,
    defines.events.on_pre_player_crafted_item,
  },
  function(e)
    cube_management.update_player(e.player_index)
  end)

script.on_event(
  {
    defines.events.on_player_dropped_item,
    defines.events.on_player_fast_transferred,
  },
  function(e)
    cube_management.update_player(e.player_index)
    cube_search.hint_entity(e.entity)
  end)

script.on_event(
  {
    defines.events.on_pre_player_left_game,
  },
  function(e)
    for _, entity in ipairs(cube_management.drop_before_leaving(e.player_index)) do
      cube_search.hint_entity(entity)
    end
  end)

script.on_event(
  {
    defines.events.on_built_entity,
    defines.events.on_robot_built_entity,
  },
  function(e)
    if not e.created_entity.unit_number then
      return
    end
    tech_unlock.constructed(e.created_entity)
    on_entity_added(e.created_entity)
  end)

script.on_event(
  defines.events.on_entity_died,
  function(e)
    if not e.entity.unit_number then
      return
    end
    linked_entities.return_cubes(e.entity, nil, true)
    on_entity_removed(e.entity)
  end)

script.on_event(
  {
    defines.events.script_raised_built,
    defines.events.script_raised_revive,
  },
  function(e)
    if not e.entity.unit_number then
      return
    end
    tech_unlock.constructed(e.entity)
    on_entity_added(e.entity)
    cube_search.hint_entity(e.entity)
  end)

script.on_event(
  defines.events.script_raised_destroy,
  function(e)
    if not e.entity.unit_number then
      return
    end
    linked_entities.return_cubes(e.entity, nil, true)
    on_entity_removed(e.entity)
  end)

script.on_event(
  defines.events.script_raised_teleported,
  function(e)
    if not e.entity.unit_number then
      return
    end
    on_entity_move(e.entity, e.old_surface_index, e.old_position)
    cube_search.hint_entity(e.entity)
  end)

script.on_event(
  {
    defines.events.on_player_mined_entity,
    defines.events.on_robot_mined_entity,
  },
  function(e)
    if not e.entity.unit_number then
      return
    end
    linked_entities.return_cubes(e.entity, e.buffer)
    on_entity_removed(e.entity)
    if e.player_index then
      entity_combine.mined_final(e.entity, game.players[e.player_index])
    end
  end)

script.on_event(
  {
    defines.events.on_surface_cleared,
    defines.events.on_surface_deleted,
  },
  function(e)
    entity_cache.refresh()
    -- Should really clear a bunch of structures, but other surfaces can
    -- be added only by other (incompatible) mods.
  end)

script.on_event(
  defines.events.on_player_removed, function(e)
    cubecam.remove_player(e.player_index)
  end)

script.on_event(
  defines.events.on_research_finished,
  function(e)
    tech_unlock.trigger(e.research.force, e.research.name, true)
  end)

script.on_event(
  defines.events.on_rocket_launch_ordered,
  function(e)
    cube_search.hint_entity(e.rocket)
  end)

script.on_event(
  defines.events.on_rocket_launched, teleport.on_teleport)

script.on_event(defines.events.on_tick,
  function(e)
    local tick = e.tick
    cube_fx.tick(tick)
    transition.tick(tick)
    linked_entities.tick(tick)
    cubecam.tick(tick)
  end)

-- Custom input events.
script.on_event("cube-toggle-alerts", function(e)
  local settings = settings.get_player_settings(e.player_index)
  local value = settings["cube-show-cube-alerts"].value
  local new_value = not value
  local player = game.players[e.player_index]
  if new_value then
    player.print({"cube-msg-alerts-enabled"})
  else
    player.print({"cube-msg-alerts-disabled"})
  end
  settings["cube-show-cube-alerts"] = {value = new_value}
end)

script.on_event("cube-open-cubecam", function(e)
  cubecam.toggle_open(game.get_player(e.player_index), false)
end)
script.on_event("cube-open-cubecam-fullscreen", function(e)
  cubecam.toggle_open(game.get_player(e.player_index), true)
end)
script.on_event(defines.events.on_gui_click, function(e)
  cubecam.on_click(game.get_player(e.player_index), e.element)
end)
script.on_event(defines.events.on_gui_value_changed, function(e)
  cubecam.on_value_changed(game.get_player(e.player_index), e.element)
end)
script.on_event(defines.events.on_runtime_mod_setting_changed, function(e)
  cubecam.on_settings_changed(game.get_player(e.player_index), e.setting)
end)
script.on_event(defines.events.on_player_display_scale_changed, function(e)
  cubecam.on_settings_changed(game.get_player(e.player_index), "display-scale")
end)


local function remote_hint_entity(entity)
  if entity then
    cube_search.hint_entity(entity)
  end
end

-- Better victory screen support.
local function better_victory_screen_statistics()
  local force = game.forces["player"]
  local stats = {}
  local victory_statistics = global.victory_statistics

  local distance_travelled_by_cube = victory_statistics.distance_travelled_by_cube
  local cube_utilisation = victory_statistics.cube_working_samples /
      (victory_statistics.cube_working_samples + victory_statistics.cube_idle_samples)
  local production = force.item_production_statistics
  local cubes_consumed = production.get_output_count("cube-ultradense-utility-cube")
  local cubes_consumed_dormant = production.get_output_count("cube-dormant-utility-cube")
  local cubes_consumed_phantom = production.get_output_count("cube-phantom-ultradense-constituent")
  local cubes_consumed_phantom_dormant = production.get_output_count("cube-dormant-phantom-constituent")
  local cubes_reconstructed = production.get_output_count("cube-legendary-iron-gear")
  local cubes_consumed_total = cubes_consumed + cubes_consumed_dormant +
      cubes_consumed_phantom + cubes_consumed_phantom_dormant
  local matter_created = production.get_input_count("cube-basic-matter-unit")

  stats["ultracube"] = {order = "a", stats = {
    ["cube-distance-travelled"]        = {order = "a", value = distance_travelled_by_cube, unit = "distance"},
    ["cube-utilisation"]               = {order = "b", value = cube_utilisation, unit = "percentage"},
    ["cubes-consumed"]                 = {order = "c", value = cubes_consumed},
    ["cubes-consumed-dormant"]         = {order = "d", value = cubes_consumed_dormant},
    ["cubes-consumed-phantom"]         = {order = "e", value = cubes_consumed_phantom},
    ["cubes-consumed-phantom-dormant"] = {order = "f", value = cubes_consumed_phantom_dormant},
    ["cubes-reconstructed"]            = {order = "g", value = cubes_reconstructed},
    ["cubes-consumed-total"]           = {order = "h", value = cubes_consumed_total},
    ["matter-created"]                 = {order = "i", value = matter_created},
  }}

  -- Ignore-flag some military-oriented stats we don't care about.
  stats["miscellaneous"] = {stats = {["total-enemy-kills"] = {ignore = true}}}
  stats["player"]        = {stats = {["kills"]             = {ignore = true}}}
  return {by_force = {[force.name] = stats}}
end

remote.add_interface("Ultracube", {
  ["hint_entity"] = remote_hint_entity,
  ["better-victory-screen-statistics"] = better_victory_screen_statistics,
  ["milestones_presets"] = milestones
})

