## Adding compatibility with Ultracube for your mod that adds new technologies or recipes

Since Ultracube features different science packs to the base game and is missing many standard resources and intermediate products, mods that add their own technologies and recipes need to be adapated for compatibility. Ultracube takes a similar approach to Nullius by hiding technologies, recipes and items unless they have been specifically marked as Ultracube-compatible, since they likely wouldn't work correctly otherwise anyway.

You can see examples of the kind of tweaks that are needed in existing compatibility files [here](https://github.com/grandseiken/factorio-ultracube/tree/main/updates/compatibility).

### Where to add compatibility code

Compatibility code can be added in your mod or Ultracube itself.

You can add compatibility code in your mod by checking for the presence of Ultracube and making adjustments. This should ideally be done in `data.lua` to be sure the changes have been made in time for Ultracube to see them when it does compatibility checks in its `data-updates.lua`.

```
// in YourMod/data.lua
if mods["Ultracube"] then
  // tweak things
end
```

Alternatively, you can add compatibility code in Ultracube by checking for the presence of your mod:

```
// in Ultracube/updates/compatibility/your_mod.lua
if mods["YourMod"] then
  // tweak things
end

// in Ultracube/data-updates.lua
require("updates.compatibility.your_mod")
```

Note that:
* If your mod only does things like make modified copies of existing prototypes, you might not need any extra compatibility code.
* Anything done in `data-final-fixes.lua` will bypass Ultracube's compatibility checks.

### Technologies

Technologies will be hidden unless they are researched with Ultracube science cards and depend on Ultracube technologies.

You'll need to modify the `unit` field of your mod's technologies to use Ultracube science cards.

A helper function is available if you require("[\_\_Ultracube\_\_/prototypes/lib/tech_costs](https://github.com/grandseiken/factorio-ultracube/blob/main/prototypes/lib/tech_costs.lua)") (available automatically if adding compatibility code in Ultracube). `tech_cost_unit(LEVEL, 60)` gives standard research costs for various levels of science, with the `LEVEL` argument as follows:

| `LEVEL` | meaning |
|---------|---------|
| "0" | grey card research |
| "1a" | early green card research |
| "1b" | late green card research |
| "2" | blue card research |
| "3" | purple card research |
| "4" | black card research |
| "5" | purple and black card research |
| "6" | endgame (all cards) research |

You'll also need to set appropriate Ultracube prerequisite technologies (unless there are none), since no vanilla technologies are researchable in Ultracube.

Example:

```
local tech = data.raw.technology["cybersyn-train-network"]
tech.prerequisites = {
  "cube-combinatorics",
  "cube-rail-signals",
}
tech.unit = tech_cost_unit("1b", 120)
```

### Recipes, items and entities

* Recipes will be hidden unless any of their `name`, `order`, `subgroup` or `category` fields begin with the prefix `cube-`.
* Items will be hidden unless any of their `name`, `order`, or `subgroup` fields begin with the prefix `cube-`, or there is a compatible recipe as above with the same name.
* Some kinds of entities will be hidden unless any of their `name`, `order`, or `subgroup` fields begin with the prefix `cube-`, or there is a compatible item or recipe as above with the same name.

Most likely you'll want to set at least a recipe's category to an Ultracube recipe category so that the recipe can be crafted. `cube-fabricator-handcraft` is the most common category for items that can be made either by handcrafting or in the fabricator. You'll also need to change the ingredients to use items and fluids that are available in Ultracube.

You might want to set the `order` and `subgroup` fields of an item to move the item to a sensible place in the GUI, or just add a `cube-` prefix to normal `order`.

Example:

```
local recipe = data.raw.recipe["cybersyn-combinator"]
recipe.category = "cube-fabricator-handcraft"
recipe.ingredients = {
  {"copper-cable", 20},
  {"cube-electronic-circuit", 10},
}
data.raw.item["cybersyn-combinator"].order = "cube-" .. data.raw.item["cybersyn-combinator"].order
```

### Mystery furnace

There's a furnace that can burn any item and give a different result. Often it gives a cheeky downgrade or ingredient, but sometimes it's a surprise. If you'd like to make your modded items compatible you should require("[\_\_Ultracube\_\_/prototypes/lib/mystery](https://github.com/grandseiken/factorio-ultracube/blob/main/prototypes/lib/mystery.lua)") (available automatically if adding compatibility code in Ultracube) and call `add_mystery_recipe` like this:

```
// First parameter scales the crafting time.
add_mystery_recipe(1, "your-mod-item", "your-result-item")
```

## Adding compatibility with Ultracube for your mod that messes with machines or inventories via script

Ultracube is quite sensitive to other mods modifying entities in unexpected ways at runtime via script. To work correctly it needs to track the location of limited items such as the cube, and to do this in a UPS-friendly way takes a lot of complicated infrastructure that can break down. To avoid your mod causing script errors you need to be careful in the following situations:

### Destroying, creating, or moving / teleporting any entity that could ever concievably contain a cube

Ultracube needs to know when this happens so it can update its internal caches. You need to make sure you:

* Ensure [`script_raised_built`](https://lua-api.factorio.com/latest/events.html#script_raised_built) or [`script_raised_revive`](https://lua-api.factorio.com/latest/events.html#script_raised_revive) is correctly fired when creating such an entity, e.g. by setting `raise_built = true` when calling [`LuaSurface::create_entity`](https://lua-api.factorio.com/latest/classes/LuaSurface.html#create_entity).
* Ensure [`script_raised_destroy`](https://lua-api.factorio.com/latest/events.html#script_raised_destroy) is correctly fired when removing such an entity, e.g. by setting `raise_destroy = true` when calling [`LuaEntity::destroy`](https://lua-api.factorio.com/latest/classes/LuaEntity.html#destroy).
* Ensure [`script_raised_teleported`](https://lua-api.factorio.com/latest/events.html#script_raised_teleported) is correctly fired when teleporting any such entity other than player characters, which have special handling.

Failing to do this could crash the game with script errors and make your mod incompatible.

### Teleporting items

If your mod provides some new means to teleport or transfer an item, and that item could be a cube, it's good to tell Ultracube about it. Failing to do this won't crash the game, but will print a warning when it happens and Ultracube has to fall back to inefficient search methods that aren't good for UPS. You can do this by calling the remote interface and passing a hint about the entity into which the item was moved, to prioritise looking in and around the given entity next time Ultracube updates:

```
remote.call("Ultracube", "hint_entity", some_lua_entity)
```

This will also happen automatically when triggering `script_raised_teleported` and so on, so you don't need to do it in that case.

### Creating duplicated cubes, for example in lab surface mods

This isn't well supported yet and needs further investigation.