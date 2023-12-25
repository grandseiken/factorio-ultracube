for _, character in pairs(data.raw.character) do
  character.crafting_categories = {
    "crafting",
    "cube-synthesizer-handcraft",
    "cube-fabricator-handcraft",
  }

  for _, animation in ipairs(character.animations) do
    if animation.armors then
      for _, armor in ipairs(animation.armors) do
        if armor == "heavy-armor" then
          animation.armors[#animation.armors + 1] = "cube-regulation-armor"
          animation.armors[#animation.armors + 1] = "cube-modular-armor"
          break
        end
        if armor == "power-armor" then
          animation.armors[#animation.armors + 1] = "cube-power-armor"
          animation.armors[#animation.armors + 1] = "cube-power-armor-mk2"
          break
        end
      end
    end
  end
end
