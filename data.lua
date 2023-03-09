-- Disable all default recipes and technologies.
for _, t in pairs(data.raw.technology) do
  t.enabled = false
end
for _, t in pairs(data.raw.recipe) do
  t.enabled = false
  if t.normal then
    t.normal.enabled = false
  end
  if t.expensive then
    t.expensive.enabled = false
  end
end

-- Disable all default autoplacing.
local function copy_autoplace_control(source, target)
  for _, t in pairs(data.raw["map-gen-presets"]) do
    for _, preset in pairs(t) do
      if preset.basic_settings and preset.basic_settings.autoplace_controls then
        preset.basic_settings.autoplace_controls[target] = preset.basic_settings.autoplace_controls[source]
      end
    end
  end
end

local function remove_autoplace_control(name)
  data.raw["autoplace-control"][name] = nil
  for _, t in pairs(data.raw["map-gen-presets"]) do
    for _, preset in pairs(t) do
      if preset.basic_settings and preset.basic_settings.autoplace_controls then
        preset.basic_settings.autoplace_controls[name] = nil
      end
    end
  end
end

copy_autoplace_control("stone", "cube-rare-metals")
remove_autoplace_control("iron-ore")
remove_autoplace_control("copper-ore")
remove_autoplace_control("stone")
remove_autoplace_control("coal")
remove_autoplace_control("uranium-ore")
remove_autoplace_control("crude-oil")
remove_autoplace_control("enemy-base")

data.raw.resource["iron-ore"].autoplace = nil
data.raw.resource["copper-ore"].autoplace = nil
data.raw.resource["stone"].autoplace = nil
data.raw.resource["coal"].autoplace = nil
data.raw.resource["uranium-ore"].autoplace = nil
data.raw.resource["crude-oil"].autoplace = nil

data.raw.turret["small-worm-turret"].autoplace = nil
data.raw.turret["medium-worm-turret"].autoplace = nil
data.raw.turret["big-worm-turret"].autoplace = nil
data.raw.turret["behemoth-worm-turret"].autoplace = nil
data.raw["unit-spawner"]["biter-spawner"].autoplace = nil
data.raw["unit-spawner"]["spitter-spawner"].autoplace = nil

-- TODO: rework lattice. More complications.
-- TODO: do we need wires for circuits or some other ingredient.
-- TODO: duplication still needs some other complication. Make input/output not trivially loopable somehow?

-- TODO: ultradense constituent and reassembly. Something with weird ratios.
-- TODO: upgrade graphics for (particularly) boiler, maybe also pipes/tanks/steam engine?

-- TODO: calcium -> intelligent calcium + (vesselheim) flask -> bottled consciousness / sentience transfer.
-- TODO: emotion synthesis. Joy / anguish. Regret (used for voiding?)
-- TODO: bottled consciousness + intermediates + Joy/Anguish -> 2x different construction
--       bots that look the same, but 1 horribly slow
-- TODO: (further on) basic antimatter unit. Basic dark matter unit.
-- TODO: some joke with hydroxyl group vs abelian group.

require("prototypes.item_groups")
require("prototypes.fuel_categories")
require("prototypes.recipe_categories")
require("prototypes.items")
require("prototypes.items_resources")
require("prototypes.items_production")
require("prototypes.recipes_intermediates")
require("prototypes.recipes_logistics")
require("prototypes.recipes_production")
require("prototypes.technology")
require("prototypes.resources")

require("prototypes.entities.boiler")
require("prototypes.entities.lab")
require("prototypes.entities.electric_mining_drills")
require("prototypes.entities.ultradense_furnace")
require("prototypes.entities.recovery_bay")
require("prototypes.entities.synthesizer")
require("prototypes.entities.fabricator")
require("prototypes.entities.explosions")
require("prototypes.entities.remnants")
require("prototypes.entities.tweaks")
