require("prototypes.scripts.remove_unused")
require("prototypes.scripts.autoplace")

-- TODO: rename to megacube?
-- TODO: useless coal from decorations.
-- TODO: output buffer on rare metals / matter, etc, can it be fixed?
-- TODO: layered icons look bad when disabled. Bake them.
-- TODO: upgrade graphics for (particularly) boiler, maybe also pipes/tanks/steam engine?

-- TODO: icon reworks
--       - tar processing icon + tech graphic
--       - emotional synthesis icon + tech graphic, + cerebral tech graphic
-- TODO: renames
--       - unstable gas? heavy/light oil (essential oils?)

-- TODO: science 2 techs:
--       rework emotion synthesis (different recipe, maybe pre-ingredient)
--       science 3: more products, something made from gas
--       construction robots, roboport + 2 chests
--       circuit 2?
--       accumulators?
--       science 3

-- TODO: maybe use glass in vehicles (especially car)
--       remove fuel values or categories from wood/coal
--       hypercube can be used in trains for lols. vehicle fuel generally
--       technology allows (hypercube only) speed/acceleration bonus to work from cargo

-- TODO: science 2 recipes
--       matter + circuit + motor/engine + bottled consciousness + joy/anguish -> 2x different construction robot

-- TODO: little things
--       walls; gates; radar; cliff explosives; landfill; modular armour + equipments
--       extend upgrade techs
--       - lab speed + increase times (?)

-- TODO: storylore tooltips!
-- TODO: after science 2, split into 3 (?) different focus trees that interlink & eventually merge together.
--       - 1: maybe scale-focused, cube scale puzzles, maybe
--       - 2: maybe power / energy / byproducts-focused?
--       - 3: either - cube logistics puzzles, many interlinked recipes with short time and low amounts or
--            (if possible) computation via recipes, crypts and locks, decoder via furnaces with randomized hidden changing recipes?
-- TODO: (2) some cube process that outputs random / multiple products.
-- TODO: (2/1?) ultradense constituent and reassembly. Something with weird ratios. Need to recharge many constituents at once?
-- TODO: (1?) something that forces cube to go far away on train (cube powered miner, basically)
-- TODO: (2?) some sort of weird biter farmer spawning synthesis.
-- TODO: (3) late game forbidden tech. Experiments on cube. Suffering. Regret.
-- TODO: (1) some sort of teleport cube logistics option.
-- TODO: (2) (further on) basic antimatter unit. Basic dark matter unit. Matter annihilation (matter + antimatter) -> energy!
-- TODO: (1) eventually, modules.

require("prototypes.equipment")
require("prototypes.fluids")
require("prototypes.fuel_categories")
require("prototypes.item_groups")
require("prototypes.items")
require("prototypes.items_equipment")
require("prototypes.items_resources")
require("prototypes.items_production")
require("prototypes.items_science")
require("prototypes.recipe_categories")
require("prototypes.recipes_intermediates")
require("prototypes.recipes_logistics")
require("prototypes.recipes_production")
require("prototypes.recipes_science")
require("prototypes.resources")
require("prototypes.technology_0")
require("prototypes.technology_1")
require("prototypes.technology_unknown")
require("prototypes.technology_upgrades")
require("prototypes.tweaks")

require("prototypes.entities.boiler")
require("prototypes.entities.chemical_plant")
require("prototypes.entities.crusher")
require("prototypes.entities.electric_furnace")
require("prototypes.entities.electric_mining_drills")
require("prototypes.entities.explosions")
require("prototypes.entities.fabricator")
require("prototypes.entities.fuel_refinery")
require("prototypes.entities.greenhouse")
require("prototypes.entities.lab")
require("prototypes.entities.recovery_bay")
require("prototypes.entities.remnants")
require("prototypes.entities.robots")
require("prototypes.entities.synthesizer")
require("prototypes.entities.ultradense_furnace")

for _, t in pairs(data.raw.technology) do
  t.enabled = false
end
