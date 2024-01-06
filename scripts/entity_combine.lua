local entity_combine = {}

local combine_definitions = {
  ["cube-nuclear-reactor"] = {
    {
      name = "cube-nuclear-reactor-base",
    },
  },
  ["cube-cyclotron"] = {
    {
      name = "cube-cyclotron-interface",
      inoperable = true,
    },
  },
  ["cube-beacon"] = {
    {
      name = "cube-beacon-fluid-source",
      inoperable = true,
    },
  },
  ["cube-experimental-teleporter"] = {
    {name = "cube-experimental-teleporter-ready"},
    {name = "cube-experimental-teleporter-collision-1"},
    {
      name = "cube-experimental-teleporter-collision-2",
      offset = {-2, 0},
    },
    {
      name = "cube-experimental-teleporter-collision-3",
      offset = {2, 0},
    },
    {name = "cube-experimental-teleporter-overlay"},
  },
  ["cube-antimatter-reactor"] = {
    {name = "cube-antimatter-reactor-animation"},
    {
      name = "cube-antimatter-reactor-port",
      direction = defines.direction.north,
      offset = {0, -7},
    },
    {
      name = "cube-antimatter-reactor-port-flip",
      direction = defines.direction.south,
      offset = {0, 7},
    },
    {
      name = "cube-antimatter-reactor-port",
      direction = defines.direction.east,
      offset = {7, 0},
    },
    {
      name = "cube-antimatter-reactor-port-flip",
      direction = defines.direction.west,
      offset = {-7, 0},
    },
  },
}

local function get_combine_table()
  if global.combine_table then
    return global.combine_table
  end
  local combine_table = {}
  global.combine_table = combine_table
  return combine_table
end

local function get_inverse_table()
  if global.combine_inverse_table then
    return global.combine_inverse_table
  end
  local inverse_table = {}
  global.combine_inverse_table = inverse_table
  return inverse_table
end

function entity_combine.created(entity)
  local entries = nil
  if entity.name then
    entries = combine_definitions[entity.name]
  end
  if not entries or #entries <= 0 then
    return
  end

  local combine_table = get_combine_table()
  local inverse_table = get_inverse_table()
  local linked_entries = combine_table[entity.unit_number]
  if not linked_entries then
    linked_entries = {}
    combine_table[entity.unit_number] = linked_entries
  end
  for _, entry in ipairs(entries) do
    local position = entity.position
    if entry.offset then
      position.x = position.x + entry.offset[1]
      position.y = position.y + entry.offset[2]
    end
    local new_entity = entity.surface.create_entity {
      name = entry.name,
      position = position,
      direction = entry.direction or entity.direction,
      force = entity.force,
      player = entity.last_user,
      spill = false,
      raise_built = true,
      create_build_effect_smoke = false,
    }
    if new_entity then
      new_entity.destructible = false
      if entry.inoperable then
        new_entity.operable = false
      end
      linked_entries[#linked_entries + 1] = new_entity
      inverse_table[new_entity.unit_number] = entity
    end
  end
end

function entity_combine.destroyed(entity)
  local combine_table = get_combine_table()
  local inverse_table = get_inverse_table()
  local linked_entries = combine_table[entity.unit_number]
  if linked_entries then
    for _, e in ipairs(linked_entries) do
      if e.valid then
        inverse_table[e.unit_number] = nil
        e.destroy {raise_destroy = true}
      end
    end
    combine_table[entity.unit_number] = nil
    return
  end
end

function entity_combine.mined_final(entity, player)
  local inverse_table = get_inverse_table()
  local base_entity = inverse_table[entity.unit_number]
  inverse_table[entity.unit_number] = nil
  if base_entity and base_entity.valid then
    player.mine_entity(base_entity, true)
  end
end

function entity_combine.get_linked(entity)
  if not entity or not entity.unit_number then
    return nil
  end
  local combine_table = get_combine_table()
  return combine_table[entity.unit_number]
end

function entity_combine.swap_linked(entity, index, old_unit_number, new_entity)
  local inverse_table = get_inverse_table()
  local linked = entity_combine.get_linked(entity)
  linked[index] = new_entity
  inverse_table[old_unit_number] = nil
  inverse_table[new_entity.unit_number] = entity
end

return entity_combine