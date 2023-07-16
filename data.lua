require("prototypes.scripts.remove_unused")
require("prototypes.scripts.autoplace")

-- TODO: output buffer on rare metals / matter, etc, can it be fixed?
-- TODO: upgrade graphics for (particularly) boiler, maybe also pipes/tanks/steam engine?
-- TODO: tech cost review.
-- TODO: "raw cost" view fixing.
-- TODO: all items seem to be unlocked in FNEI/signals etc without researching them.

-- TODO: icon reworks
--       - advanced engine tech graphic + name (?)
--       - tar processing/reclamation icons
--       - emotional synthesis icon + tech graphic
--       - roboport tech graphic
--       - concretes tech graphic?
-- TODO: layered icons look bad when disabled. Bake them.
-- TODO: renames: unstable gas?
-- TODO: recipe crafting_machine_tint for all chemical-plant

-- TODO: important things
-- still something for matter; or maybe only for sophisticated matter
-- something for contemplation units?

-- TODO: analysis machine that unlocks techs based on finding things in the world?
-- TODO: rework fuel refinery (shouldn't need cube directly, something else instead?)
--       more with besselheim; twinned logistics robots

-- TODO: extend upgrade techs
--       - lab speed + increase times (?)
--       - toolbelt!
--       - more armour stuff

-- TODO: think about reintroducing biters + military?
-- TODO: storylore tooltips!

-- TODO: after science 2, split into 3 (?) different focus trees that interlink & eventually merge together.
--   - 1: SCALE scale-focused, scale puzzles, maybe
--   - 2: POWER maybe power / energy / byproducts-focused?
--   - 3: PUZZLE either - cube logistics puzzles

-- next science names: deep ? card; erudite ? card; ...
--
-- Tech unlocks:
-- 1: modules 1; V4 belts; some equipments
-- 2: fancy power solutions; bigger accumulator; some equipments
-- 3: logistics bots; spidertron; ???
-- 1+2: modules 2; cliff explosives
-- 1+3: matter repurposings (convert basic intermediates into others, maybe big scale, but in some way that you still need
--                           original recipes occasionally - how exactly? and/or without conversion, reagents)
-- 2+3: cube teleportation (krastorio teleporter graphic?), some equipments
-- maybe some way of converting power -> more matter?
--
-- OK so PLAN
-- BRANCH 1:
-- deep core powder -> crystal (? later), other stuff
-- BRANCH 3:
-- GIN: potato (greenhouse) -> (crusher) -> mashed potato -> berries (greenhouse) + essential oils + water -> (distillery?) -> gin
-- GIN + cube + cerebral -> emotional synthesis -> split joy/anguish cube -> other stuff
-- BRANCH 2:
-- ??? 100 ultradense constituents -> various things you need to choose between -> dormant constituents -> reassembly

-- [DONE] 1: something that forces cube to go far away on train
--
-- Requirements/puzzles and interactions:
-- ?: GIN (need for joy/anguish - grow berries in greenhouse?) -> emotional decomposition -> logistics bots + cube split
-- ?: mechanical circuit network? maybe a secret tech tree you find out in the world?
-- 1+2: ultradense constituent and reassembly. Something with weird ratios. Need to recharge many constituents at once?
-- 1+3: something where cube splits in 2 (joy + anguish?), which are used for different things, then recombined.
--      can have some recipes that make old things e.g. matter units, but not strict replacement
-- 2+3: blue chips
-- ?: some more efficient basic materials but they come out in awkward ways (like
--    only make matter+tar at the same time or something, etc)
-- 2: some cube process that outputs random / multiple products.
--    basic antimatter unit. Basic dark matter unit. Matter annihilation (matter + antimatter) -> energy!
-- 3: many interlinked recipes with short time and low amounts or
--    (if possible) computation via recipes, crypts and locks, decoder via furnaces with randomized hidden changing recipes?
--    e.g. quantum decoder; or qbits; every recipe is random with one pair from 6*6 options (so 1/21 chance)
-- ?: some sort of weird biter farmer spawning synthesis.
-- ?: late game forbidden tech. Experiments on cube. Suffering. Regret.

require("prototypes.equipment")
require("prototypes.fluids")
require("prototypes.fuel_categories")
require("prototypes.item_groups")
require("prototypes.items")
require("prototypes.items_equipment")
require("prototypes.items_logistics")
require("prototypes.items_resources")
require("prototypes.items_production")
require("prototypes.items_science")
require("prototypes.mechanical_network.data")
require("prototypes.mechanical_network.entities")
require("prototypes.recipe_categories")
require("prototypes.recipes_compatibility")
require("prototypes.recipes_equipment")
require("prototypes.recipes_fluids")
require("prototypes.recipes_intermediates")
require("prototypes.recipes_logistics")
require("prototypes.recipes_production")
require("prototypes.recipes_resources")
require("prototypes.recipes_science")
require("prototypes.recipes_synthesis")
require("prototypes.resources")
require("prototypes.technology_0")
require("prototypes.technology_1")
require("prototypes.technology_2")
require("prototypes.technology_compatibility")
require("prototypes.technology_upgrades")
require("prototypes.tweaks")

require("prototypes.entities.boiler")
require("prototypes.entities.chemical_plant")
require("prototypes.entities.containers")
require("prototypes.entities.crusher")
require("prototypes.entities.deep_core_ultradrill")
require("prototypes.entities.electric_furnace")
require("prototypes.entities.electric_mining_drills")
require("prototypes.entities.explosions")
require("prototypes.entities.fabricator")
require("prototypes.entities.fluid_burner")
require("prototypes.entities.fuel_refinery")
require("prototypes.entities.greenhouse")
require("prototypes.entities.lab")
require("prototypes.entities.recovery_bay")
require("prototypes.entities.remnants")
require("prototypes.entities.roboport")
require("prototypes.entities.robots")
require("prototypes.entities.synthesizer")
require("prototypes.entities.ultradense_furnace")

for _, t in pairs(data.raw.technology) do
  t.enabled = false
end
