local cube_search = require("__Ultracube__/scripts/cube_search")

local teleport = {}

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
  local teleporter = event.rocket_silo
  if teleporter then
    insert_or_drop(teleporter, "raw-fish")
  end
end

return teleport