![Thumbnail](thumbnail.png)

An overhaul mod for Factorio featuring:
* Completely reworked tech tree and recipes.
* Unique logistic challenges and assorted devious automation puzzles.
* Six tiers of science and a new endgame goal.
* Multiplayer compatibility.

# Overview

This mod overhauls Factorio in a way that should hopefully feel fairly unique.

The player starts with a single extremely useful cube (additional copies cannot be crafted), required as a catalyst in various large bulk-processing steps. Everything from research to power generation ultimately depends on it.

As a result, substantial portions of the factory resist copy-paste expansion, and can be made more efficient only by solving logistical problems, making design improvements, or unlocking new technologies.

At any given level of technological progress, there will exist some theoretical upper bound on the potential output of your factory. Getting close to the limit will be tricky: you'll need to set up automation to intelligently route the cube where it's needed, deal with sporadically-running high-throughput machines, and probably invest in a fair amount of circuit network trickery.

The technology tree has been carefully rebuilt from scratch to fit, and there are some new tools to play with, too.

## You might like this mod if:

* You enjoy solving automation and logistic puzzles, monitoring and iterating on complex setups which probably won't be perfect first try.
* You like the idea of a dynamic factory, with different sections that turn on at different times, and not every belt tends towards either completely empty or completely backed-up.
* You want an excuse to experiment with Factorio's core mechanics in unusual ways.
* You appreciate Rube Goldberg machines.

## You might not like this mod if:

* You're looking for a "vanilla plus" experience.
* You need compatibility with other large/overhaul mods.
* You can't live without the ability to scale up production arbitrarily. (There are still benefits in going big, and ways to do so, but you can't always just stamp down more machines in the usual way.)
* You're not willing to experiment at least a little bit with combinators and circuit conditions.

## Comparison to other overhaul mods

In terms of raw volume of content, Ultracube probably lies somewhere between the base game and Krastorio 2. Playtime might vary, but the scope isn't excessive.

As for difficulty, it's trickier to compare. Ultracube mostly avoids the long, complicated recipe chains with many intermediate products often found in overhaul mods. There are only a handful of raw resources, and many recipes are fairly simple. There's a bit more fluid and byproduct handling, but nothing masochistic.

Instead, additional complexity comes largely from logistics and macro-level interactions. While individual recipes might not seem complicated on the surface, it'll be difficult to make them all run efficiently together. Other processes might need a bit of careful planning or lateral thinking to get working at all, even if they only have a few steps.

Progression should be relatively clear, without too much hunting around in the tech tree for what's next, but at the same frequently presenting new and interesting challenges.

The overall feel is probably closer to something like Freight Forwarding (but maybe a bit more radical) than other overhauls.

## Development status and roadmap

Endgame is not quite finished, and especially the latter half or so of the mod will likely be subject to some balance passes after further playtesting. Feedback is welcome!

# Compatibility

This is an overhaul mod that removes most standard resources, ingredients, technologies and entities from the game.

As you might expect, compatibility with other large overhaul mods that make their own drastic changes to the technology tree is unlikely.

Quality-of-life mods without new technologies or recipes like [Far Reach](https://mods.factorio.com/mod/far-reach) or [Even Distribution](https://mods.factorio.com/mod/even-distribution) should mostly work just fine.

Mods that add new recipes or technologies must be specifically adapted to work with Ultracube. Technologies need to be changed to fit into the Ultracube tech tree with appropriate prerequisites, and be researched with Ultracube science cards. Recipes need to be changed to have Ultracube ingredients. Support can be added with either conditional logic in Ultracube code to check for the presence of the other mod and make the necessary adjustments, or the other way around.

Mods that teleport, create, destroy or otherwise mess with items and machines via script also have the potential to cause issues. This could either be by allowing for some way to accidentally destroy an irreplaceable item (something that's otherwise carefully guarded against), or by interfering with the optimized caching logic that Ultracube uses to track the current location of such items at all times (necessary for various UX and technical reasons) in a UPS-friendly manner.

Regardless of technical obstacles, practical considerations could make some other mods a poor match. Ultracube imposes unusual constraints and is designed and balanced with those in mind. Combining it with mods that provide ways around those constraints is likely to result in something that doesn't make a whole lot of sense.

## Compatible mods

The following mods have been adapted to work with Ultracube:

* [AAI Loaders](https://mods.factorio.com/mod/aai-loaders) (integrated as standard)
* [Flow Control](https://mods.factorio.com/mod/Flow%20Control)
* [Nixie Tubes](https://mods.factorio.com/mod/nixie-tubes)
* [Pushbutton](https://mods.factorio.com/mod/pushbutton)
* [Picker Dollies](https://mods.factorio.com/mod/PickerDollies)
* [Textplates](https://mods.factorio.com/mod/textplates)

This list is expected to grow with time. You can submit a pull request, github issue or mod portal comment if you'd like to see compatibility with some other mod in particular.

## Compatibility guide

TODO: make it easy to for other mod authors to add compatibility for their mod and describe here how to do so.

# FAQ

* **Where are the biters?** Currently there are no military technologies and biters are disabled. This decision might be revisited later.

* **Where are all the technologies?** Most technologies are hidden at the start of the game. The technology tree will expand as you gain access to new levels of science.

* **So do I have to manually hand-feed this cube all the time or what?** You will likely need to do a few things manually in the short early-game section. Technologies will soon allow for automation.

* **Can I really automate this?** Everything can be automated, and there is probably more than one way to do it.

* **I lost my cube!** Its location will show up on the minimap. If you somehow manage to destroy the cube and the game can't find it, you'll see a warning message. In that case please file a bug report.

* **My factory isn't producing enough, how can I improve it?** The main production bottleneck will always be processes that require the cube as a catalyst. At most one of these steps can be running at any given time. Try to think of ways to get the most use out of it per unit of time and ensure it never gets stuck anywhere. Look in the technology tree for things that could help.

* **Bulk-processing machines sometimes won't accept ingredients even though it seems like they should.** This is an [issue with Factorio's assembling machine logic](https://forums.factorio.com/viewtopic.php?f=7&t=101436). It seems that it will be fixed with the DLC release. Until then, you'll just have to work around it. (This bug is also the reason productivity modules aren't allowed in cube-powered recipes: bonus outputs block progress, get the cube stuck and make things worse.)

# Dependencies and credits

This mod depends on [Krastorio2Assets](https://mods.factorio.com/mod/Krastorio2Assets) for additonal graphics and sounds. It doesn't depend on the [Krastorio2 code](https://mods.factorio.com/mod/Krastorio2) itself, but contains modified versions of some of its prototype definitions. Both mods are licensed under the GNU GPLv3. I am extremely grateful to the Krastorio 2 authors, since this mod wouldn't have happened without their work.