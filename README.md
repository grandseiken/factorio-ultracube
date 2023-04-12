# Ultracube: Age of Cube

A work-in-progress overhaul mod for Factorio.

This mod is a bit more difficult than vanilla Factorio, but in a way that feels fairly different from many other overhaul mods.

It doesn't add huge numbers of intermediate products, and recipes for basic logistics and production machines are generally of roughly comparable complexity to the base game.

Instead, the player starts with a single extremely useful cube (additional copies cannot be crafted), required as a catalyst in various large bulk-processing steps.

As a result, significant portions of the factory resist copy-paste expansion and can be made more efficient only by solving logistical problems, making design improvements, or unlocking new technologies. Given any particular level of technological progress, there will exist some theoretical upper limit on the productivity of your factory, but getting close to this limit will be tricky.

The need to intelligently route the cube where it's needed presents a unique logistical puzzle. The circuit network will likely prove a necessity for full automation, even in the early game. The focus on high-volume bulk recipes that run only sporadically means planning the factory is rarely as simple as plugging throughput numbers into a calculator.

## Frequently asked questions

* **Why am I moving so slowly?** Take a look at the descriptions of the items in your inventory.

* **Where are the biters?** Currently, there are no military technologies and biters are disabled. This decision might be revisited if it seems like there could be a good place for biters in the mod, but right now the priority is to get the main production mechanics right.

* **I lost my cube!** Care has been taken to avoid the possibility of the cube being consumed or destroyed, but it's possible there's still some way to do it. If there's no alert visible with the mod setting for cube location alerts enabled, then the game can't find it either and it's likely gone. For now, run `/c game.player.insert("cube-ultradense-utility-cube")` in the console. If you have some idea how it might have gone missing, please file a bug report.

* **My factory isn't producing enough, how can I improve it?** Unlike in the base game, the biggest bottleneck on your production capacity is pretty much always going to be steps that require the cube (either as an ingredient or as fuel). At any given time, only one of these steps can be running. Try to think of ways to minimize the amount of time wasted while the cube travels between different machines. Also, many processes that involve the cube have more efficient (in terms of cube-time) replacements that can be unlocked later in the technology tree.

## Compatibility

This is an overhaul mod that removes many standard ingredients from the game, so it's unlikely to be compatible with other mods that add new recipes and haven't been specifically adapted to work with it.

Built-in support for some popular mods that add small numbers of recipes will probably come at some point, but isn't a priority yet.

If you would like to contribute support for compatibility with some other mod, you are welcome to open a pull request.

## Dependencies and credits

This mod depends on [Krastorio2Assets](https://github.com/raiguard/Krastorio2Assets) for additonal graphics and sounds. It doesn't depend on [Krastorio2](https://github.com/raiguard/Krastorio2) itself, but contains modified versions of some of its prototype definitions. Both mods are licensed under the GNU GPLv3. Many thanks to the Krastorio 2 developers for their work and for making this possible.