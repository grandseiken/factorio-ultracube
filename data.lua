require("prototypes.scripts.remove_unused")
require("prototypes.scripts.autoplace")

-- RELEASE BLOCKERS (v0.2)
-------------------
-- 1. Finish gamma handling
-- - Current numbers seem good, but cube usage is too awkward - hard to buffer enough to avoid
--   it getting stuck - can we maintain overall cubetime while making it different somehow?
-- - - Ideally full cubetime should ~exactly process 4 ports. Currently ~8, but increasing seems to imply
--     we should produce more power (maybe it is just fine)
-- - Could be in the blender (?) -> and could make/consume water/steam (?)
-- - Could provide some energy as steam instead
-- 2. Finish beacons: - juice recipe + icon? +one per machine (check spaceex etc)
-- 3. Various (BASICALLY KNOWN)
-- 3a. Phantom FX (sound design, aura graphics)
-- 3b. Menu sim 5: belts that spell cube, 1 cube goes then 64 phantoms, loop it back fast
-- 3c. Should refined concrete use mineral water?
-- 3d. always_show_made_in for all intermediates?

-- v0.3+
-------------------
-- - Reorganise compatibility to make other mods easier (+mystery recipes into compat)
-- - Revert bulkframes to pre-antimatter values (~250MJ, 2.5MW in) and add a more
--   interesting late-game storage solution (... energy + tendrils -> haunted cells???)
-- - - Related to: revisit tendril expulsion (better recipe)?
-- - Constant-rate flexible thing (from deep ore science) + late-game raw material swapping of some kind (?)
-- - - Just use e.g. advanced chemical plant, electrolysis machine, condenser.
-- - - Krastorio 1 might have something interesting!
-- - - Cubetime can increase the rate?
-- - Or could involve an cube-compatible alternative fuel
-- - Icons in tooltips?
-- - Is there a way to avoid antimatter ports showing up on power stats
-- - - Apparently not other than converting to fixed-recipe fluid-powered assemblers and
--     measuring manually, but that means no power bars (unless they can be modded back in?)
-- - Later tech to make quantum decode output something different with 1 match?
-- - Barreling recipes (+ mystery furnace)
-- - make cube sparks aligned per-machine
-- - make nuclear reactor a dummy so copy/paste undo works properly (and check it generally)
-- - - except then its description won't show up as a reactor...?
-- - - but it could be really a reactor modded to be inoperable somehow
-- - tech graphics: resplendent plate, phantom handling, seance, concretes, roboport
-- - - advanced engine tech graphic + name (?)
-- - Check phantom handling isn't too unwieldy, potentially have an alternative smaller synthesizer?
-- - allow prod modules on some bulk recipes once 2.0 is out with stack size fix
-- - Uranium processing, could it use a sludge fluid or something
-- - Optional compatibility with alien biomes/worldgen mod (as a lib)

-- v.later
-------------------
-- analysis machine that unlocks techs based on finding things in the world?
-- - or a secret tech tree you find out in the world?
-- rework fuel refinery? (to not need cube directly, something else instead? or maybe it can use other cubes?)
-- World events? (ghost/forest/daylight)
-- - ghost effects spooky player
-- think about reintroducing biters + military? or biter farming?
-- storylore tooltips
-- something where cube splits in exactly 2 (joy + anguish?), which are used for different things, then recombined.
-- - maybe: 1 can be used as fuel, one can be used as something else?
-- - Or 1 fuel-only; 32 phantoms?
-- - Or random chance for different subcubes?
-- - Slow-start feedback loop from e.g. tiny chance of diamond while (e.g. deep) crushing
-- Other resource/intermediate conversions, or more efficient recipes but that still require the originals somehow
-- - Or high power cost?
-- Local-only solar panels?

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
require("prototypes.entities.beacon")
require("prototypes.entities.belts")
require("prototypes.entities.boiler")
require("prototypes.entities.chemical_plant")
require("prototypes.entities.containers")
require("prototypes.entities.crusher")
require("prototypes.entities.cyclotron")
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
