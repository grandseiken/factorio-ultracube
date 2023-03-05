-- Disable all default recipes and technologies.
for _, t in pairs(data.raw.technology) do
  t.enabled = false
end
for _, t in pairs(data.raw.recipe) do
  t.enabled = false
  if t.normal then
    t.normal.enabled = false
  end
  if t.expensive then
    t.expensive.enabled = false
  end
end

-- Disable all default autoplacing.
function remove_autoplace_control(name)
  data.raw["autoplace-control"][name] = nil
  for _, t in pairs(data.raw["map-gen-presets"]) do
    for _, preset in pairs(t) do
      if preset.basic_settings and preset.basic_settings.autoplace_controls then
        preset.basic_settings.autoplace_controls[name] = nil
      end
    end
  end
end

remove_autoplace_control("iron-ore")
remove_autoplace_control("copper-ore")
remove_autoplace_control("stone")
remove_autoplace_control("coal")
remove_autoplace_control("uranium-ore")
remove_autoplace_control("crude-oil")
remove_autoplace_control("enemy-base")

data.raw.resource["iron-ore"].autoplace = nil
data.raw.resource["copper-ore"].autoplace = nil
data.raw.resource["stone"].autoplace = nil
data.raw.resource["coal"].autoplace = nil
data.raw.resource["uranium-ore"].autoplace = nil
data.raw.resource["crude-oil"].autoplace = nil

data.raw.turret["small-worm-turret"].autoplace = nil
data.raw.turret["medium-worm-turret"].autoplace = nil
data.raw.turret["big-worm-turret"].autoplace = nil
data.raw.turret["behemoth-worm-turret"].autoplace = nil
data.raw["unit-spawner"]["biter-spawner"].autoplace = nil
data.raw["unit-spawner"]["spitter-spawner"].autoplace = nil

require("prototypes.item_groups")
require("prototypes.recipe_categories")
require("prototypes.items")
require("prototypes.recipes_intermediates")
require("prototypes.recipes_logistics")
