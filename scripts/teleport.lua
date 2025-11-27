local cube_search = require("__Ultracube__/scripts/cube_search")
local entity_cache = require("__Ultracube__/scripts/entity_cache")

local teleport = {}

local function teleport_fx(teleporter)
  local surface = teleporter.surface
  local position = teleporter.position
  position.y = position.y + 2
  surface.play_sound({
    path = "cube-experimental-teleporter-effect-sound",
    volume_modifier = 0.8,
    position = position,
  })
  surface.create_entity {
    name = "cube-experimental-teleporter-explosion",
    position = position,
    force = teleporter.force,
    source = teleporter,
  }
end

local function get_send_item(inventory)
  if inventory then
    for _, stack in pairs(inventory.get_contents()) do
      return {name = stack.name, count = stack.count}
    end
  end
  return nil
end

local function get_send_players(teleporter)
  local result = {}
  local tp = teleporter.position
  for _, player in pairs(game.players) do
    if player.character and player.character.surface == teleporter.surface then
      local cp = player.character.position
      if cp.x >= tp.x - 1 and cp.x <= tp.x + 1 and
         cp.y >= tp.y + 0.25 and cp.y <= tp.y + 2.25 then
          result[#result + 1] = player.character
      end
    end
  end
  return result
end

local function insert_or_drop(teleporter, item)
  local inventory = teleporter.get_output_inventory()
  if inventory.is_empty() and inventory.insert(item) then
    cube_search.hint_entity(teleporter)
  else
    local items_on_ground = teleporter.surface.spill_item_stack {
      position = teleporter.position, stack = item, allow_belts = false,
    }
    for _, e in pairs(items_on_ground) do
      cube_search.hint_entity(e)
    end
  end
end

function teleport.on_teleport(event)
  local src_teleporter = event.rocket_silo
  if not src_teleporter or src_teleporter.name ~= "cube-experimental-teleporter" then
    return
  end

  teleport_fx(src_teleporter)
  if not storage.teleport_table then
    storage.teleport_table = {}
  end
  local entry = storage.teleport_table[src_teleporter.unit_number]
  if entry then
    storage.teleport_table[src_teleporter.unit_number] = nil
    local position = entry.dst_teleporter.position
    position.y = position.y + 1.25
    for _, player in ipairs(entry.send_players) do
      player.teleport(position)
    end
    position = entry.src_teleporter.position
    position.y = position.y + 1.25
    for _, player in ipairs(entry.swap_players) do
      player.teleport(position)
    end
    return
  end

  local send_item = get_send_item(event.rocket.attached_cargo_pod.get_inventory(1))
  local send_players = get_send_players(src_teleporter)
  if not send_item and #send_players == 0 then
    return
  end

  local cache = entity_cache.get()
  local empty_destinations = {}
  local ready_destinations = {}
  for _, e in pairs(cache.by_name["cube-experimental-teleporter"]) do
    if e.valid and e.unit_number ~= src_teleporter.unit_number and
       e.rocket_silo_status == defines.rocket_silo_status.rocket_ready then
      ready_destinations[#ready_destinations + 1] = e
      if e.get_output_inventory().is_empty() then
        empty_destinations[#empty_destinations + 1] = e
      end
    end
  end

  local dst_teleporter = nil
  if #empty_destinations > 0 then
    dst_teleporter = empty_destinations[math.random(#empty_destinations)]
  elseif #ready_destinations > 0 then
    dst_teleporter = ready_destinations[math.random(#ready_destinations)]
  end

  if dst_teleporter then
    local swap_inventory = dst_teleporter.get_inventory(defines.inventory.rocket_silo_rocket)
    local swap_item = get_send_item(swap_inventory)
    if swap_item then
      insert_or_drop(src_teleporter, swap_item)
      swap_inventory.clear()
    end
    storage.teleport_table[dst_teleporter.unit_number] = {
      src_teleporter = src_teleporter,
      dst_teleporter = dst_teleporter,
      send_players = send_players,
      swap_players = get_send_players(dst_teleporter),
    }
    dst_teleporter.launch_rocket()
  end

  if send_item then
    insert_or_drop(dst_teleporter or src_teleporter, send_item)
    event.rocket.attached_cargo_pod.get_inventory(1).remove(send_item)
  end
  event.rocket.attached_cargo_pod.destroy {raise_destroy = true}
  event.rocket.destroy {raise_destroy = true}
end

return teleport