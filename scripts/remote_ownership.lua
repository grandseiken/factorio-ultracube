local cube_search = require("__Ultracube__/scripts/cube_search")
local remote_ownership = {}

local function get_ownership_table()
  local t = global.remote_ownership_table
  if not t then
    t = {}
    global.remote_ownership_table = t
    global.remote_ownership_next_id = 1
    global.remote_ownership_free_list = {}
  end
  return t, global.remote_ownership_free_list
end

function remote_ownership.create_token(item, timeout, data)
  local ownership_table, free_list = get_ownership_table()
  local token_id, _ = next(free_list)
  if token_id then
    free_list[token_id] = nil
  else
    token_id = global.remote_ownership_next_id
    global.remote_ownership_next_id = token_id + 1
  end

  ownership_table[token_id] = {
    item = item,
    surface = data.surface,
    position = data.position,
    velocity = data.velocity,
    height = data.height,
    hidden = data.hidden,
    timeout = timeout or 1,
  }
  return token_id
end

function remote_ownership.update_token(token_id, timeout, update_data)
  if token_id == 0 then
    return
  end
  local ownership_table, _ = get_ownership_table()
  local data = ownership_table[token_id]
  if not data then
    return
  end
  data.surface = update_data.surface or data.surface
  data.position = update_data.position or data.position
  data.velocity = update_data.velocity or data.velocity
  data.height = update_data.height or data.height
  data.hidden = update_data.hidden ~= nil and update_data.hidden or data.hidden
  data.timeout = timeout or 1
end

function remote_ownership.release_token(token_id)
  if token_id == 0 then
    return nil
  end
  local ownership_table, free_list = get_ownership_table()
  local data = ownership_table[token_id]
  if not data then
    if token_id < global.remote_ownership_next_id and not free_list[token_id] then
      free_list[token_id] = true
    end
    return nil
  end
  local item = data.item
  ownership_table[token_id] = nil
  free_list[token_id] = true
  return item
end

function remote_ownership.tick()
  local ownership_table = global.remote_ownership_table
  if not ownership_table then
    return
  end

  for token_id, data in pairs(ownership_table) do
    local timeout = data.timeout
    timeout = timeout - 1
    if timeout > 0 then
      data.timeout = timeout
    else
      local item = data.item
      local surface = data.surface
      if not surface or not surface.valid then
        surface = game.surfaces[1]
      end
      local position = data.position or {x = 0, y = 0}
      local spill = surface.spill_item_stack(position, item, nil, nil, false)
      for _, e in ipairs(spill) do
        cube_search.hint_entity(e)
      end
      ownership_table[token_id] = nil
    end
  end
end

return remote_ownership