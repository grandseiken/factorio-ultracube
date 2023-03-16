function make_set(array)
  local r = {}
  for _, v in ipairs(array) do
    r[v] = true
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

function vector_length(v)
  return math.sqrt(v.x * v.x + v.y * v.y)
end