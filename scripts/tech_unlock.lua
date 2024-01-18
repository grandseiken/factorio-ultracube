local unlock_trigger_technologies = make_set({
  "cube-basic-contemplation-unit",
  "cube-fundamental-comprehension-card",
  "cube-abstract-interrogation-card",
  "cube-deep-introspection-card",
  "cube-synthetic-premonition-card",
  "cube-complete-annihilation-card",
})

local special_condition_technologies = make_set({
  "cube-construct-forbidden-ziggurat",
  "cube-resonance-cascade",
  "cube-complete-annihilation-card",
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
  if unlock_trigger_technologies[technology_name] then
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
      if not special_condition_technologies[name] then
        force.technologies[name].enabled = unlocked
      end
    end
  end
  if technology_name == "cube-mystery-furnace" then
    force.technologies["cube-mystery-furnace-dummy"].researched = unlocked
  elseif technology_name == "cube-forbidden-ziggurat" then
    force.technologies["cube-construct-forbidden-ziggurat"].enabled = unlocked
  elseif technology_name == "cube-construct-forbidden-ziggurat" then
    force.technologies["cube-resonance-cascade"].enabled = unlocked
    force.technologies["cube-complete-annihilation-card"].enabled = unlocked
  elseif technology_name == "cube-everything" then
    local state = global.cube_victory_state
    if state ~= "victorious" then
      global.cube_victory_state = "victorious"

      local bvs = remote.interfaces["better-victory-screen"]
      if bvs and bvs["trigger_victory"] then
        remote.call("better-victory-screen", "trigger_victory", game.forces["player"], true)
      else
        game.set_game_state {
          game_finished = true,
          player_won = true,
          can_continue = true,
          victorious_force = "player",
        }
      end
      game.print({"cube-msg-victory-0"})
      game.print({"cube-msg-victory-1"})
      game.print({"cube-msg-victory-2"})
      game.print({"cube-msg-victory-3"})
    end
  end
end

function tech_unlock.sync(force)
  for name, _ in pairs(unlock_trigger_technologies) do
    local unlocked = not force.technologies[name] or force.technologies[name].researched
    tech_unlock.trigger(force, name, unlocked)
  end
  for _, tech in pairs(force.technologies) do
    if tech.enabled and tech.researched then
      for _, effect in ipairs(tech.effects) do
        if effect.type == "unlock-recipe" then
          local recipe = force.recipes[effect.recipe]
          if recipe then
            recipe.enabled = true
          end
        end
      end
    end
  end
end

function tech_unlock.constructed(entity)
  if entity.name == "cube-forbidden-ziggurat" then
    local technology = entity.force.technologies["cube-construct-forbidden-ziggurat"]
    if not technology.researched then
      technology.researched = true
      game.print({"cube-msg-project-completed"})
    end
  end
end

return tech_unlock