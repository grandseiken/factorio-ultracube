# Ultracube: Age of Cube

A work-in-progress overhaul mod for Factorio.

![Thumbnail](thumbnail.png)

This mod is a bit more difficult than vanilla Factorio, but in a way that I hope feels fairly unique.

The player starts with a single extremely useful cube (additional copies cannot be crafted), required as a catalyst in various large bulk-processing steps.

As a result, substantial portions of the factory resist copy-paste expansion, and can be made more efficient only by solving logistical problems, making design improvements, or unlocking new technologies.

At any given level of technological progress, there exists some theoretical upper bound on the possible output of your factory. Getting close to the limit will be tricky: you'll need to intelligently route the cube where it's needed, deal with sporadically-running high-throughput machines, and probably invest in a decent amount of circuit network trickery.

It doesn't introduce huge numbers of intermediate products or incredibly complex recipe chains. The aim is to have (roughly) comparable scope to the base game in terms of raw volume of content, but to frequently present new and interesting challenges.

The technology tree has been rebuilt from scratch. A few production chains share similarities with vanilla equivalents, but there's usually some kind of twist. There's a bit more fluid and byproduct handling, but nothing overly masochistic. Some big traditional staples are totally gone.

It currently features three levels of science and an assortment of devious puzzles, with more content on the way.

## You might like this mod if:

* Fill in.

## You might not like this mod if:

* Fill in.

# Screenshots

![Early-game spaghetti](screenshots/spaghetti.jpg)
(Relatively) early-game spaghetti.

# Frequently asked questions

* **Why am I moving so slowly?** Take a look at the descriptions of the items in your inventory.

* **Where are the biters?** Currently, there are no military technologies and biters are disabled. This decision might be revisited if it seems like there could be a good place for biters in the mod, but right now the priority is to get the main production mechanics right.

* **The technology tree seems pretty small.** Most technologies are hidden at the start of the game. The technology tree will expand as you gain access to new levels of science.

* **I lost my cube!** Care has been taken to avoid the possibility of the cube being consumed or destroyed, but it's possible there's still some way to do it. If there's no alert visible with the mod setting for cube location alerts enabled, then the game can't find it either and it's likely gone. For now, run `/c game.player.insert("cube-ultradense-utility-cube")` in the console. If you have some idea how it might have gone missing, please file a bug report.

* **My factory isn't producing enough, how can I improve it?** The main production bottleneck will always be processes that require the cube (either as an ingredient or as fuel). Only one of these steps can be running at any given time. Try to think of ways to get the most use out of it per unit of time, and look in the technology tree for things to help with that.

* **Bulk-processing machines sometimes won't accept ingredients even though it seems like they should.** This is [an issue with the way factorio determines when a machine's output is full](https://forums.factorio.com/viewtopic.php?f=7&t=101436). The only way to fix this right now would be to give certain items ridiculous stack sizes (many thousands), so you'll just have to work around it for now.

# Compatibility

This is an overhaul mod that removes many standard ingredients and entities from the game. It's unlikely to be compatible with other mods that haven't been specifically adapted to work with it, unless they don't depend on any vanilla items or entities.

There is currently built-in support for the following mods:

* [Flow Control](https://mods.factorio.com/mod/Flow%20Control) for assorted one-way valves
* [Nixie Tubes](https://mods.factorio.com/mod/nixie-tubes) for displaying circuit network values
* [Pushbutton](https://mods.factorio.com/mod/pushbutton) for manual input of circuit signals
* [Picker Dollies](https://mods.factorio.com/mod/PickerDollies) for easily rearranging combinators without disconnecting circuit wires (gently recommended)

Additionally, simple mods like Far Reach or Even Distribution should work fine.

If you would like to contribute/request support for compatibility with some other mod, you are welcome to open a pull request or github issue.

# Dependencies and credits

This mod depends on [Krastorio2Assets](https://mods.factorio.com/mod/Krastorio2Assets) for additonal graphics and sounds. It doesn't depend on [Krastorio2](https://mods.factorio.com/mod/Krastorio2) itself, but contains modified versions of some of its prototype definitions. Both mods are licensed under the GNU GPLv3. Many thanks to the Krastorio 2 developers for their work and for making this possible.

It also incorporates loaders from [AAI Loaders](https://mods.factorio.com/mod/aai-loaders).