local transition_table = {
  ["cube-mechanical-network-and-gate"] = {
    ["cube-mechanical-network-bit-0"] = "cube-mechanical-network-and-gate-0",
    ["cube-mechanical-network-bit-1"] = "cube-mechanical-network-and-gate-1",
  },
  ["cube-mechanical-network-or-gate"] = {
    ["cube-mechanical-network-bit-0"] = "cube-mechanical-network-or-gate-0",
    ["cube-mechanical-network-bit-1"] = "cube-mechanical-network-or-gate-1",
  },
  ["cube-mechanical-network-xor-gate"] = {
    ["cube-mechanical-network-bit-0"] = "cube-mechanical-network-xor-gate-0",
    ["cube-mechanical-network-bit-1"] = "cube-mechanical-network-xor-gate-1",
  },
}

local reset_table = {
  ["cube-mechanical-network-and-gate-0"] = "cube-mechanical-network-and-gate",
  ["cube-mechanical-network-and-gate-1"] = "cube-mechanical-network-and-gate",
  ["cube-mechanical-network-or-gate-0"] = "cube-mechanical-network-or-gate",
  ["cube-mechanical-network-or-gate-1"] = "cube-mechanical-network-or-gate",
  ["cube-mechanical-network-xor-gate-0"] = "cube-mechanical-network-xor-gate",
  ["cube-mechanical-network-xor-gate-1"] = "cube-mechanical-network-xor-gate",
}

local function fast_replace(e, name, spill)
  remove_entity_cache(e)
  remove_entity_search(e)
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

function transition_tick(tick)
  local new_entities = {}
  local cache = get_entity_cache()
  for _, e in pairs(cache.multi_furnaces) do
    local name = e.name
    local transition = nil
    local reset_target = reset_table[name]
    if reset_target then
      if e.products_finished > 0 then
        transition = reset_target
      end
    else
      local transition_items = transition_table[name]
      local inventory = e.get_inventory(defines.inventory.furnace_source)
      if transition_items and inventory then
        for item, count in pairs(inventory.get_contents()) do
          local result = transition_items[item]
          if count > 0 and result then
            transition = result
            inventory.clear()
            break
          end
        end
      end
    end

    if transition then
      local new_entity = fast_replace(e, transition, false)
      if new_entity then
        new_entities[#new_entities + 1] = new_entity
      end
    end
  end

  for _, e in pairs(cache.reactors) do
    local new_entity = nil
    if e.name == "cube-nuclear-reactor" and e.temperature > 100 and not e.burner.currently_burning then
      new_entity = fast_replace(e, "cube-nuclear-reactor-online", true)
    elseif e.name == "cube-nuclear-reactor-online" and e.temperature < 100 and not e.burner.currently_burning then
      new_entity = fast_replace(e, "cube-nuclear-reactor", true)
    end
    if new_entity then
      new_entities[#new_entities + 1] = new_entity
    end
  end
  for _, e in ipairs(new_entities) do
    add_entity_cache(e)
  end
end