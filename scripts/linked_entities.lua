local entity_cache = require("__Ultracube__/scripts/entity_cache")
local entity_combine = require("__Ultracube__/scripts/entity_combine")

local linked_entities = {}

function linked_entities.tick(tick)
  local cache = entity_cache.get()

  local antimatter_reactors = cache.by_name["cube-antimatter-reactor"]
  if antimatter_reactors then
    for _, e in pairs(antimatter_reactors) do
      local linked = entity_combine.get_linked(e)
      if linked then
        local animation = linked[1]
        local energy = 0
        for i = 1, 4 do
          local port = linked[1 + i]
          if port and port.valid then
            energy = energy + port.energy
            port.energy = 0
          end
        end
        e.power_production = energy
        e.electric_buffer_size = energy
        if animation and animation.valid then
          animation.active = energy > 0
        end
      end
    end
  end

  local cyclotrons = cache.by_name["cube-cyclotron"]
  if cyclotrons then
    for _, e in pairs(cyclotrons) do
      local linked = entity_combine.get_linked(e)
      if linked then
        local interface = linked[1]
        if interface and interface.valid then
          local transfer = math.min(e.electric_buffer_size - e.energy, interface.energy)
          if transfer > 0 then
            e.energy = e.energy + transfer
            interface.energy = interface.energy - transfer
          end
        end
      end
    end
  end

  local experimental_teleporters = cache.by_name["cube-experimental-teleporter"]
  if experimental_teleporters then
    for _, e in pairs(experimental_teleporters) do
      local linked = entity_combine.get_linked(e)
      if linked then
        local animation = linked[1]
        animation.active = e.rocket_silo_status == defines.rocket_silo_status.rocket_ready
      end
    end
  end
end

return linked_entities