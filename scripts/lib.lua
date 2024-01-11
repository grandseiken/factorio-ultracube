function make_set(array)
  local r = {}
  for _, v in ipairs(array) do
    r[v] = true
  end
  return r
end

function inverse_map(map)
  local r = {}
  for k, v in pairs(map) do
    r[v] = k
  end
  return r
end

function from_polar(r, theta)
  return {x = r * math.cos(theta), y = r * math.sin(theta)}
end

function from_polar_orientation(r, orientation)
  return from_polar(r, 2 * math.pi * (orientation - 0.25))
end

function vector_add(v, u)
  return {x = v.x + u.x, y = v.y + u.y}
end

function vector_sub(v, u)
  return {x = v.x - u.x, y = v.y - u.y}
end

function vector_length(v)
  return math.sqrt(v.x * v.x + v.y * v.y)
end

function string_starts(s, start)
  return string.sub(s, 1, string.len(start)) == start
end

function transfer_inventory(src_inv, dst_inv)
  for i = 1, #src_inv do
    -- swap_stack is a tiny bit slower than set_stack, but set_stack can lose the quick-bar links to non-fungible items (e.g. blueprints)
    dst_inv[i].swap_stack(src_inv[i])
  end
end