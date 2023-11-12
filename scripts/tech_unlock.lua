local unlock_trigger_technologies = make_set({
  "cube-basic-contemplation-unit",
  "cube-fundamental-comprehension-card",
  "cube-abstract-interrogation-card",
  "cube-deep-introspection-card",
  "cube-synthetic-premonition-card",
})

local function get_unlocks_for_technology(force, technology_name)
  local filters = {
    {filter = "research-unit-ingredient", ingredient = technology_name, mode = "and"},
  }
  for name, _ in pairs(unlock_trigger_technologies) do
    if force.technologies[name] and not force.technologies[name].researched then
      filters[#filters + 1] = {
        filter = "research-unit-ingredient",
        ingredient = name, invert = true, mode = "and",
      }
    end
  end
  return game.get_filtered_technology_prototypes(filters)
end

local tech_unlock = {}

function tech_unlock.trigger(force, technology_name, unlocked)
  if not unlock_trigger_technologies[technology_name] then
    return
  end
  local technologies = nil
  if unlocked then
    technologies = get_unlocks_for_technology(force, technology_name)
  else
    technologies = game.get_filtered_technology_prototypes {{
      filter = "research-unit-ingredient",
      ingredient = technology_name,
      mode = "and",
    }}
  end
  for name, _ in pairs(technologies) do
    force.technologies[name].enabled = unlocked
  end
end

function tech_unlock.sync(force)
  for name, _ in pairs(unlock_trigger_technologies) do
    local unlocked = not force.technologies[name] or force.technologies[name].researched
    tech_unlock.trigger(force, name, unlocked)
  end
end

return tech_unlock