local entity_map = nil
local activation = {}

function activation.on_load()
  entity_map = storage.activation_map
end

function activation.refresh()
  if not entity_map then
    entity_map = {}
    storage.activation_map = entity_map
  end
end

function activation.remove_entity(entity)
  local unit_number = entity.unit_number
  if unit_number then
    entity_map[unit_number] = nil
  end
end

function activation.set(entity, key, active)
  local unit_number = entity.unit_number
  local table = entity_map[unit_number]
  if not table then
    table = {count = 0}
    entity_map[unit_number] = table
  end
  if active then
    if table[key] then
      table[key] = nil
      local count = table.count - 1
      table.count = count
      if count == 0 then
        entity.active = true
        entity.custom_status = nil
      end
      return true
    end
  else
    if not table[key] then
      table[key] = true
      local count = table.count
      table.count = count + 1
      if count == 0 then
        entity.active = false
        entity.custom_status = {
          diode = defines.entity_status_diode.red,
          label = {"entity-status." .. key},
        }
      end
      return true
    end
  end
  return false
end

return activation