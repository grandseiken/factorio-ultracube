local activation = require("__Ultracube__/scripts/activation")
local cube_management = require("__Ultracube__/scripts/cube_management")
local entity_cache = require("__Ultracube__/scripts/entity_cache")
local entity_combine = require("__Ultracube__/scripts/entity_combine")

local linked_entities = {}
local overload_sprites = {}
local get_linked = entity_combine.get_linked
local set_active = activation.set

function linked_entities.on_load()
  overload_sprites = global.overload_sprites
end

local function on_change(entity)
  -- TODO: this could be changed to do chunk-caching instead if it becomes a problem.
  if not entity or entity.name == "cube-beacon" or cube_management.module_machines()[entity.name] then
    global.module_machines_ticks = entity_cache.by_tick_size
  end
end

function linked_entities.refresh()
  if not overload_sprites then
    overload_sprites = {}
    global.overload_sprites = overload_sprites
  end
  on_change(nil)
end

function linked_entities.added(entity)
  on_change(entity)
  if entity and entity.name == "cube-beacon" then
    set_active(entity, "beacon", false)
  end
end

function linked_entities.removed(entity)
  on_change(entity)
  local unit_number = entity.unit_number
  if unit_number then
    local id = overload_sprites[entity.unit_number]
    if id and rendering.is_valid(id) then
      rendering.destroy(id)
    end
    overload_sprites[unit_number] = nil
  end
end

function linked_entities.tick(tick)
  local cache = entity_cache.get()
  local tick_index = tick % entity_cache.by_tick_size

  if global.module_machines_ticks and global.module_machines_ticks > 0 then
    global.module_machines_ticks = global.module_machines_ticks - 1
    local module_machines = cache.by_name_by_tick["__module-machines__"]
    if module_machines then
      for _, e in pairs(module_machines[tick_index]) do
        local entity = e.entity
        local active = not (entity.beacons_count and entity.beacons_count > 1)
        if set_active(entity, "effect", active) then
          if active then
            local unit_number = entity.unit_number
            local id = overload_sprites[unit_number]
            if id and rendering.is_valid(id) then
              rendering.destroy(id)
            end
            overload_sprites[unit_number] = nil
          else
            overload_sprites[entity.unit_number] = rendering.draw_sprite {
              sprite = "virtual-signal/cube-beacon-overload",
              surface = entity.surface,
              target = entity,
              target_offset = entity.prototype.alert_icon_shift,
            }
          end
        end
      end
    end
  end

  -- Can be optimized if necessary by increasing by_tick_size and reducing crafting speed to spread
  -- things out over more ticks.
  local beacons = cache.by_name_by_tick["cube-beacon"]
  if beacons then
    for _, e in pairs(beacons[tick_index]) do
      local entity = e.entity
      local linked = get_linked(e.entity)
      local fluid_source = linked[1]
      if not e.products_finished then
        e.products_finished = 0
      end
      local products_finished = fluid_source.products_finished
      set_active(entity, "beacon", products_finished > e.products_finished)
      e.products_finished = products_finished
    end
  end

  local antimatter_reactors = cache.by_name["cube-antimatter-reactor"]
  if antimatter_reactors then
    for _, e in pairs(antimatter_reactors) do
      local linked = get_linked(e)
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
          set_active(animation, "anti", energy > 0)
        end
      end
    end
  end

  local cyclotrons = cache.by_name["cube-cyclotron"]
  if cyclotrons then
    for _, e in pairs(cyclotrons) do
      local linked = get_linked(e)
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
      local linked = get_linked(e)
      if linked then
        local animation = linked[1]
        animation.active = e.rocket_silo_status == defines.rocket_silo_status.rocket_ready
      end
    end
  end
end

return linked_entities