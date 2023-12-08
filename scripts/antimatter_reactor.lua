local entity_cache = require("__Ultracube__/scripts/entity_cache")
local entity_combine = require("__Ultracube__/scripts/entity_combine")

local antimatter_reactor = {}

function antimatter_reactor.tick(tick)
  local cache = entity_cache.get()
  for _, e in pairs(cache.antimatter_reactors) do
    local linked = entity_combine.get_linked(e)
    local interface = linked[1]
    if interface and interface.valid then
      local energy = 0
      for i = 1, 4 do
        local port = linked[1 + i]
        if port and port.valid then
          energy = energy + port.energy
          port.energy = 0
        end
      end
      interface.power_production = energy
      interface.electric_buffer_size = energy
    end
    -- for i = 1, 4 do
    --   local generator = linked[i]
    --   if generator and generator.valid then
    --     generator.energy = 0
    --   end
    -- end
  end
end

return antimatter_reactor