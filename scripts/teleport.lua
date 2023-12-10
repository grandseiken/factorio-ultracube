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
    for name, count in pairs(inventory.get_contents()) do
      return {name = name, count = count}
    end
  end
  return nil
end

local function insert_or_drop(teleporter, item)
  local inventory = teleporter.get_output_inventory()
  if inventory.is_empty() then
    inventory.insert(item)
    cube_search.hint_entity(teleporter)
  else
    local items_on_ground = teleporter.surface.spill_item_stack(
      teleporter.position, item, nil, nil, false)
    for _, e in pairs(items_on_ground) do
      cube_search.hint_entity(e)
    end
  end
end

function teleport.on_teleport(event)
  local src_teleporter = event.rocket_silo
  if src_teleporter.name ~= "cube-experimental-teleporter" then
    return
  end

  teleport_fx(src_teleporter)
  local send_item = get_send_item(event.rocket.get_inventory(1))
  if not send_item then
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
    dst_teleporter.launch_rocket()
  end

  if send_item then
    insert_or_drop(dst_teleporter or src_teleporter, send_item)
  end
end

return teleport