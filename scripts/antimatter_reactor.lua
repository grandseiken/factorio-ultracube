local entity_cache = require("__Ultracube__/scripts/entity_cache")
local entity_combine = require("__Ultracube__/scripts/entity_combine")

local antimatter_reactor = {}

function antimatter_reactor.tick(tick)
  local cache = entity_cache.get()
  for _, e in pairs(cache.antimatter_reactors) do
    local linked = entity_combine.get_linked(e)
    local interface = linked[1]
    local port = linked[2]
    if interface and port and interface.valid and port.valid then
      interface.energy = math.min(interface.electric_buffer_size, interface.energy + port.energy)
      port.energy = 0
    end
  end
end

return antimatter_reactor