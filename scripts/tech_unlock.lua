local unlock_trigger_technologies = {
  ["cube-basic-contemplation-unit"] = 0,
  ["cube-fundamental-comprehension-card"] = 1,
}

local function get_unlocks_for_technology(technology_name)
  local unlock_index = unlock_trigger_technologies[technology_name]
  if not unlock_index then
    return {}
  end
  local filters = {
    {filter = "research-unit-ingredient", ingredient = technology_name, mode = "and"},
  }
  for name, index in pairs(unlock_trigger_technologies) do
    if index > unlock_index then
      filters[#filters + 1] = {
        filter = "research-unit-ingredient",
        ingredient = name, invert = true, mode = "and",
      }
    end
  end
  return game.get_filtered_technology_prototypes(filters)
end

function unlock_technologies(force, technology_name, unlocked)
  for name, _ in pairs(get_unlocks_for_technology(technology_name)) do
    force.technologies[name].enabled = unlocked
  end
end

function sync_unlock_technologies(force)
  for name, _ in pairs(unlock_trigger_technologies) do
    local unlocked = not force.technologies[name] or force.technologies[name].researched
    unlock_technologies(force, name, unlocked)
  end
end

