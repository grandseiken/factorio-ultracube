# Hypercube (Factorio mod)

A work-in-progress overhaul mod for Factorio.

This mod is a bit more difficult than vanilla Factorio, but in a way that feels fairly different from many other overhaul mods.

It doesn't add huge numbers of intermediate products, and recipes for basic logistics and production machines are generally of roughly comparable complexity to the base game.

Instead, the player starts with a single extremely useful cube (additional copies cannot be crafted), required as a catalyst in various large bulk-processing steps for raw materials.

As a result, significant portions of the factory resist copy-paste expansion and can be made more productive only by solving logistical problems, making design improvements, or unlocking new technologies. At any given level of technological progress there exists some theoretical upper limit on the total net output of the factory, but getting close to this limit will be tricky.

The need to intelligently route the single catalyst where it's needed presents an interesting logistical puzzle unique to this mod. The circuit network will likely prove a necessity for full automation, even in the relatively early game; the focus on high-volume bulk recipes that run only sporadically makes the the production process feel quite different, and means planning the factory is rarely as simple as plugging throughput numbers into a calculator.

## Frequently asked questions

* **Why am I moving so slowly?** Take a look at the descriptions of the items you're carrying.

* **Where are the biters?** Currently, there are no military technologies and biters are disabled. This decision might be revisited if it seems like there could be a good place for biters in the mod, but right now the priority is to get the main production mechanics right.

* **I lost my cube!** While care has been taken to eliminate obvious ways to accidentally destroy the cube, it's possible there's still some way to do it. If you really can't find it, it's not stuck in a machine as an ingredient or partially-used burner fuel (mining the machine will retrive your cube), for now run `/c game.player.insert("cube-ultradense-utility-cube")` in the console. If you have any idea how it got lost, please file a bug report. An in-game mechanic to facilitate retrieval of lost or destroyed cubes is planned.

## Compatibility

This is an overhaul mod that removes many standard ingredients from the game, so it's unlikely to be compatible with any other mod that adds new recipes and hasn't been specifically adapted to work with it.

Built-in support for some popular mods that add small numbers of recipes will probably come at some point, but isn't a priority yet.

## Dependencies and credits

This mod depends on [Krastorio2Assets](https://github.com/raiguard/Krastorio2Assets) for additonal graphics and sounds. It doesn't depend on [Krastorio2](https://github.com/raiguard/Krastorio2) itself, but contains modified versions of some of its prototype definitions. Both mods are licensed under the GNU GPLv3. Many thanks to the Krastorio 2 developers for their work and for making this possible.