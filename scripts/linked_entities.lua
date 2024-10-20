local activation = require("__Ultracube__/scripts/activation")
local cube_management = require("__Ultracube__/scripts/cube_management")
local cube_search = require("__Ultracube__/scripts/cube_search")
local entity_cache = require("__Ultracube__/scripts/entity_cache")
local entity_combine = require("__Ultracube__/scripts/entity_combine")

local linked_entities = {}
local overload_sprites = nil
local get_linked = entity_combine.get_linked
local set_active = activation.set

local function fast_replace(e, name, spill)
  entity_cache.remove(e)
  cube_search.remove_entity(e)
  activation.remove_entity(e)
  linked_entities.removed(e)
  local opened_players = {}
  for k, player in pairs(game.players) do
    if player.opened == e then
      player.opened = nil
      opened_players[k] = player
    end
  end
  local new_entity = e.surface.create_entity {
    name = name,
    position = e.position,
    direction = e.direction,
    force = e.force,
    fast_replace = true,
    spill = spill,
    create_build_effect_smoke = false,
  }
  if new_entity then
    for _, player in pairs(opened_players) do
      player.opened = new_entity
    end
    return new_entity
  elseif e.valid then
    return e
  end
  return nil
end

function linked_entities.on_load()
  overload_sprites = storage.overload_sprites
end

local function on_change(entity)
  -- TODO: this could be changed to do chunk-caching instead if it becomes a problem.
  if not entity or entity.name == "cube-beacon" or cube_management.module_machines()[entity.name] then
    storage.module_machines_ticks = entity_cache.by_tick_size
  end
end

function linked_entities.refresh()
  if not overload_sprites then
    overload_sprites = {}
    storage.overload_sprites = overload_sprites
  end
  on_change(nil)
end

function linked_entities.added(entity)
  on_change(entity)
  if entity and entity.name == "cube-beacon" then
    set_active(entity, "cube-beacon", false)
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

  if storage.module_machines_ticks and storage.module_machines_ticks > 0 then
    storage.module_machines_ticks = storage.module_machines_ticks - 1
    local module_machines = cache.by_name_by_tick["__module-machines__"]
    if module_machines then
      for _, e in pairs(module_machines[tick_index]) do
        local entity = e.entity
        local active = not (entity.beacons_count and entity.beacons_count > 1)
        if set_active(entity, "cube-effect", active) then
          if active then
            local unit_number = entity.unit_number
            local sprite = overload_sprites[unit_number]
            if sprite and sprite.valid then
              sprite.destroy()
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
      set_active(entity, "cube-beacon", products_finished > e.products_finished)
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
        set_active(e, "cube-antimatter", energy > 0)
        if animation and animation.valid then
          set_active(animation, "cube-antimatter", energy > 0)
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

  local nuclear_reactors = cache.by_name["cube-nuclear-reactor"]
  if nuclear_reactors then
    local reactor_hysteresis = storage.reactor_hysteresis
    if not reactor_hysteresis then
      reactor_hysteresis = {}
      storage.reactor_hysteresis = reactor_hysteresis
    end
    for k, timer in pairs(reactor_hysteresis) do
      if timer > 0 then
        reactor_hysteresis[k] = timer - 1
      else
        reactor_hysteresis[k] = nil
      end
    end
    local new_entities = {}
    for _, e in pairs(nuclear_reactors) do
      local linked = get_linked(e)
      local reactor = linked[1]
      local new_entity = nil
      local en = e.unit_number
      local n = reactor.unit_number
      if reactor.name == "cube-nuclear-reactor-base" then
        if reactor.burner.currently_burning then
          reactor_hysteresis[en] = 300
        elseif reactor_hysteresis[en] and reactor.temperature > 100 then
          new_entity = fast_replace(reactor, "cube-nuclear-reactor-online", true)
        end
      elseif reactor.name == "cube-nuclear-reactor-online" and not reactor_hysteresis[en] then
        local burner = reactor.burner
        local status = reactor.status
        if not burner.currently_burning then
          new_entity = fast_replace(reactor, "cube-nuclear-reactor-base", true)
        elseif status == defines.entity_status.full_burnt_result_output or
               status == defines.entity_status.no_fuel then
          burner.currently_burning = nil
          reactor.surface.spill_item_stack {
            position = reactor.position,
            stack = {name = "depleted-uranium-fuel-cell", count = 1},
            allow_belts = false,
          }
        end
      end
      if new_entity then
        entity_combine.swap_linked(e, 1, n, new_entity)
        new_entities[#new_entities + 1] = new_entity
      end
    end
    for _, e in ipairs(new_entities) do
      entity_cache.add(e)
    end
  end
end

local fuel_map = {
  [cube_management.cubes.ultradense] = cube_management.cubes.dormant,
  [cube_management.cubes.combustion] = cube_management.cubes.dormant_combustion,
  [cube_management.cubes.ultradense_phantom] = cube_management.cubes.dormant_phantom,
}

local function insert_or_spill(entity, inventory, item)
  local inserted_count = 0
  if inventory then
    inserted_count = inventory.insert(item)
  end
  if inserted_count < item.count then
    item.count = item.count - inserted_count
    local spill = entity.surface.spill_item_stack {
      position = entity.position,
      stack = item,
      allow_belts = false,
    }
    for _, e in ipairs(spill) do
      cube_search.hint_entity(e)
    end
  end
end

local function transfer_or_drop_all(entity, inventory, item_set)
  for i = 1, entity.get_max_inventory_index() do
    local di = entity.get_inventory(i)
    if di then
      for _, stack in pairs(di.get_contents()) do
        if not item_set then
          insert_or_spill(entity, inventory, {name = stack.name, count = stack.count})
        elseif item_set[stack.name] then
          insert_or_spill(entity, inventory, {name = stack.name, count = stack.count})
          di.remove({name = stack.name, count = stack.count})
        end
      end
      if not item_set then
        di.clear()
      end
    end
  end
end

function linked_entities.return_cubes(entity, inventory, drop_all)
  local fuel = cube_management.get_entity_burning_fuel(entity)
  if fuel then
    local dormant = fuel_map[fuel]
    if dormant then
      insert_or_spill(entity, inventory, {name = dormant, count = 1})
      entity.burner.currently_burning = nil
    end
  end
  if drop_all then
    transfer_or_drop_all(entity, inventory, cube_management.cube_drop)
  end
  local linked = entity_combine.get_linked(entity)
  if linked then
    for _, e in ipairs(linked) do
      if e.valid then
        transfer_or_drop_all(e, inventory)
      end
    end
  end
end

return linked_entities