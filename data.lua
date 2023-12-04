require("prototypes.scripts.remove_unused")
require("prototypes.scripts.autoplace")

-- ANNOYING FIX TODOs:
----------------------
-- allow prod modules on some bulk recipes once 2.0 is out with stack size fix
-- tech graphics: resplendent plate, phantom handling, seance, concretes, roboport
-- - advanced engine tech graphic + name (?)
-- make cube sparks aligned per-machine?
-- make nuclear reactor a dummy so copy/paste undo works properly?
-- - except then its description won't show up as a reactor...?
-- - but it could be really a reactor modded to be inoperable somehow

-- RELEASE BLOCKERS
-------------------
-- 1. Teleporter (how do we do it with entities? -- ROCKET SILO might work.)
-- 2. Deep techs
-- - (a) Constant-rate flexible thing (from deep ore science) + late-game raw material swapping of some kind (?)
-- - Cubetime can increase the rate?
-- - Or could involve an cube-compatible alternative fuel
-- - (b) How to get singularity data? (deep core crystal is currently the mystery furance output)
-- - - Something where the cube must go in several machines in an odd/timed/awkward pattern?
-- - - e.g. because machine must recharge, or its output expires/cools somehow, or numbers are weird/loop
-- 3. Last armor/equipments/upgrades
-- - Infinite technologies
-- 4. antimatter + matter unit (+cube?) -> endgame antimatter power
-- - Gamma handling could be in the blender (?)
-- - Maybe a way to turn energy -> antimatter
-- 5. Various
-- - Reorganise compatibility to make other mods easier (+mystery recipes into compat)
-- - Phantom FX.
-- - More use for deep crystal, unobtainium?
-- - Fix deep core ore generation (?)
-- - Beacons? (!?): Small, effective, one per machine, powered by fluid
-- barreling recipes (+ mystery furnace)
-- 6. Menu sim 5: belts that spell cube, 1 cube goes then 64 phantoms, loop it back fast

-- RANDOM THOUGHT TODOs:
------------------------
-- analysis machine that unlocks techs based on finding things in the world
-- - or a secret tech tree you find out in the world?
-- rework fuel refinery? (to not need cube directly, something else instead? or maybe it can use other cubes?)
-- ghost effects spooky player

-- LONG-TERM TODOs:
-------------------
-- World events? (ghost/forest/daylight)
-- think about reintroducing biters + military?
-- storylore tooltips
-- move some current techs later and add earlier-game shit versions of things? e.g. miners, fabricator, perhaps even synthesizer

-- TECH TREE TODOs:
-------------------
-- PHANTOM FX:
-- - Sound design
-- - Replace "aura" graphics
-- should phantom constituent synthesis be done in a smaller machine...? it could be quite unwieldy atm o_o need to test
-- - maybe the dimensional engine could convert a synthesizer into a mini-synthesizer... !?
-- tendril expulsion: possibly ... require something from other branch in recipe? Maybe for more efficient version?
-- Kovarex redemption: extra fluid ingredients/results? Another nuclear ingredient to manage levels of (e.g. radioactive sludge)?
-- Make sure reactor fast-replace is working (seemed odd when picked up) plus 2 burnt result slots
-- power armor v2 (??? - haunted furnace?)

-- Random thoughts.
-- ?: something where cube splits in exactly 2 (joy + anguish?), which are used for different things, then recombined.
-- - maybe: 1 can be used as fuel, one can be used as something else?
-- - Or 1 fuel-only; 32 phantoms?
-- alternatively: something where cube has random chance to turn into red cube or blue cube. or maybe both
-- some exponential feedback loop that starts extremely slow somewhere (ala gardens or nuclear)
-- - how about this: deep crushing has tiny% chance to produce diamond or something
-- ?: can have some recipes that make old things e.g. matter units, but not strict replacement

-- Things to unlock from level 3/4+:
-- Matter repurposings? (convert basic intermediates into others, maybe big scale, but in some way that you still need
--                           original recipes occasionally - how exactly? and/or without conversion, reagents)
----- Or: maybe some way of converting like this, but high power cost, e.g. power -> more matter?
-- unobtainium?
-- After science 3/4 or nearby, later ideas...
-- Few other things with combining the earlier trees
-- ?: something to do with mechanical circuit network?
-- ?: some sort of weird biter farmer spawning synthesis.
require("menu_simulations.menu_simulations")

require("prototypes.equipment")
require("prototypes.fluids")
require("prototypes.fuel_categories")
require("prototypes.item_groups")
require("prototypes.items")
require("prototypes.items_equipment")
require("prototypes.items_logistics")
require("prototypes.items_modules")
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
require("prototypes.recipes_modules")
require("prototypes.recipes_production")
require("prototypes.recipes_quantum")
require("prototypes.recipes_resources")
require("prototypes.recipes_science")
require("prototypes.recipes_synthesis")
require("prototypes.resources")
require("prototypes.technology_0")
require("prototypes.technology_1")
require("prototypes.technology_2")
require("prototypes.technology_3_4")
require("prototypes.technology_5")
require("prototypes.technology_6")
require("prototypes.technology_compatibility")
require("prototypes.technology_upgrades")
require("prototypes.tweaks")

require("prototypes.entities.antimatter_reactor")
require("prototypes.entities.belts")
require("prototypes.entities.boiler")
require("prototypes.entities.chemical_plant")
require("prototypes.entities.containers")
require("prototypes.entities.crusher")
require("prototypes.entities.deep_core_ultradrill")
require("prototypes.entities.dimension_folding_engine")
require("prototypes.entities.distillery")
require("prototypes.entities.electric_furnace")
require("prototypes.entities.electric_mining_drills")
require("prototypes.entities.energy_bulkframe")
require("prototypes.entities.experimental_teleporter")
require("prototypes.entities.explosions")
require("prototypes.entities.fabricator")
require("prototypes.entities.forbidden_ziggurat")
require("prototypes.entities.fluid_burner")
require("prototypes.entities.fuel_refinery")
require("prototypes.entities.greenhouse")
require("prototypes.entities.heavy_turbine")
require("prototypes.entities.inserters")
require("prototypes.entities.lab")
require("prototypes.entities.loaders")
require("prototypes.entities.molecular_blender")
require("prototypes.entities.mystery_furnace")
require("prototypes.entities.nuclear_reactor")
require("prototypes.entities.particle_phase_aligner")
require("prototypes.entities.quantum_decoder")
require("prototypes.entities.recovery_bay")
require("prototypes.entities.remnants")
require("prototypes.entities.roboport")
require("prototypes.entities.robots")
require("prototypes.entities.stygian_energy_lab")
require("prototypes.entities.synthesizer")
require("prototypes.entities.ultradense_furnace")

require("prototypes.recipes_mystery")
for _, t in pairs(data.raw.technology) do
  t.enabled = false
end
