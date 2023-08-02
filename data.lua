require("prototypes.scripts.remove_unused")
require("prototypes.scripts.autoplace")

-- ANNOYING FIX TODOs:
----------------------
-- icon reworks
-- - advanced engine tech graphic + name (?)
-- - tar processing/reclamation icons
-- - emotional synthesis icon + tech graphic
-- - roboport tech graphic?
-- - concretes tech graphic?
-- layered icons look bad when disabled. Bake them.
-- rename: unstable gas?
-- all items seem to be unlocked in FNEI/signals etc without researching them.
-- "raw cost" view doesn't seem to work for fluid composites
-- upgrade graphics for boiler; maybe also pipes/tanks/steam engine?
-- - and possibly slightly increase base pipe capacity
-- output buffer issue on rare metals / matter bulk processes, etc, can it be fixed?

-- IMPORTANT TODOs:
-------------------
-- still something for matter; or maybe only for sophisticated matter
-- perhaps something with constituents
-- something for contemplation units?

-- RANDOM THOUGHT TODOs:
------------------------
-- analysis machine that unlocks techs based on finding things in the world
-- strange device / mystery furnace (downgrades items, gives you potatoes, but some secret good things)
-- maybe a secret tech tree you find out in the world? (e.g. mechanical network)
-- rework fuel refinery? (to not need cube directly, something else instead? or maybe it can use other cubes?)
-- more with besselheim?
-- unlock bigger tanks

-- LONG-TERM TODOs:
-------------------
-- rearrange upgrade techs; some 3/4-level techs could be on the way to 3/4 instead (e.g. loaders or logistic chests maybe)
-- more armour stuff
-- think about reintroducing biters + military?
-- storylore tooltips

-- TECH TREE TODOs:
-------------------
-- after science 2, split into 2 (or 3) different focus trees that interlink & eventually merge together.
-- 1. Deep core drilling -> sorta "scale/distance" focused
-- 2. Cube splitting, in new building (probably antimatter reactor, maybe matter plant) -> various logistics puzzles focused
-- 3. Something maybe power / energy / resource / byproducts-focused? Possibly distillation / emotional things
-- Next science names: deep/erudite contemplation/introspection/reflection card; annihillation card...

-- deep dust -> various uses, e.g. crystal (somehow), components
-- emotion -> bots (done), other byproduct-y uses
-- cube split to 64 phantom constituents -> then many different recipes -> dormant constituents (?) + reassembly

-- will need some new intermediate products:
-- - blue chips
-- - weird cells or something
-- - even better engines
-- use a bunch more metal and a ton more stone (mainly branch 1 (scale)), somehow

-- Main tech

-- Tech unlocks:
-- Modules (perhaps initially in different parts of the tree)
-- - Careful about what modules can go in what machines, might need dedicated types for cube-machines
-- - Possibly start from a common module-base precursor + component for type
-- - Eventually higher-tier modules
-- V4 belts
-- Better armour and equipments; legs early
-- New power solutions:
-- - Joy -> steam (not efficient)
-- - Despair -> some sort of power somehow (lol)
-- - Dust -> better fuel recipe
-- - (Much later) matter/antimatter; nuclear; or other better power (you should need to combine multiple)
-- Somewhere: logistics chest (one more science)
-- Spidertron
-- New ways to get matter, and possibly widgets/contemplation
-- Matter repurposings? (convert basic intermediates into others, maybe big scale, but in some way that you still need
--                           original recipes occasionally - how exactly? and/or without conversion, reagents)
-- Cube teleportation (using krastorio teleporter graphic)
-- Maybe some way of converting power -> more matter?
--

-- Random thoughts.
-- 1+2: ultradense constituent and reassembly. Something with weird ratios. Need to recharge many constituents at once?
-- 1+3: something where cube splits in 2 (joy + anguish?), which are used for different things, then recombined.
--      can have some recipes that make old things e.g. matter units, but not strict replacement
-- 2+3: blue chips
-- ?: some more efficient basic materials but they come out in awkward ways (like
--    only make matter+tar at the same time or something, etc)
-- 2: some cube process that outputs random / multiple products.
--    basic antimatter unit. Matter annihilation (matter + antimatter) -> energy!
-- 3: many interlinked recipes with short time and low amounts or

-- After science 3/4 or nearby, later ideas...
-- Quantum decoder; via multi-furnace (quantum computer or research server); qbits;
-- - every recipe is random with one pair from 6*6 options (so 1/21 chance)
-- Very last thing to do destroys the cube (e.g. in intergalactic tranceiver) to produce final science plus
-- materials to rebuild it in a long/expensive process.
-- ?: something to do with mechanical circuit network?
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
require("prototypes.technology_3_4")
require("prototypes.technology_5")
require("prototypes.technology_compatibility")
require("prototypes.technology_upgrades")
require("prototypes.tweaks")

require("prototypes.entities.belts")
require("prototypes.entities.boiler")
require("prototypes.entities.chemical_plant")
require("prototypes.entities.containers")
require("prototypes.entities.crusher")
require("prototypes.entities.deep_core_ultradrill")
require("prototypes.entities.dimensionality_disruptor")
require("prototypes.entities.distillery")
require("prototypes.entities.electric_furnace")
require("prototypes.entities.electric_mining_drills")
require("prototypes.entities.explosions")
require("prototypes.entities.fabricator")
require("prototypes.entities.fluid_burner")
require("prototypes.entities.fuel_refinery")
require("prototypes.entities.greenhouse")
require("prototypes.entities.lab")
require("prototypes.entities.loaders")
require("prototypes.entities.recovery_bay")
require("prototypes.entities.remnants")
require("prototypes.entities.roboport")
require("prototypes.entities.robots")
require("prototypes.entities.synthesizer")
require("prototypes.entities.ultradense_furnace")

for _, t in pairs(data.raw.technology) do
  t.enabled = false
end
