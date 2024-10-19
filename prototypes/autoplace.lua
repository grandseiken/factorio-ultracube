local function copy_autoplace_control(source, target)
  for _, t in pairs(data.raw["map-gen-presets"]) do
    for _, preset in pairs(t) do
      if preset.basic_settings and preset.basic_settings.autoplace_controls then
        preset.basic_settings.autoplace_controls[target] = preset.basic_settings.autoplace_controls[source]
      end
    end
  end
end

local function remove_autoplace_control(name)
  data.raw["autoplace-control"][name] = nil
  for _, t in pairs(data.raw["map-gen-presets"]) do
    for _, preset in pairs(t) do
      if preset.basic_settings and preset.basic_settings.autoplace_controls then
        preset.basic_settings.autoplace_controls[name] = nil
      end
    end
  end
end

copy_autoplace_control("stone", "cube-rare-metals")
remove_autoplace_control("iron-ore")
remove_autoplace_control("copper-ore")
remove_autoplace_control("coal")
remove_autoplace_control("crude-oil")
remove_autoplace_control("enemy-base")

data.raw.resource["iron-ore"].autoplace = nil
data.raw.resource["copper-ore"].autoplace = nil
data.raw.resource["coal"].autoplace = nil
data.raw.resource["crude-oil"].autoplace = nil

local nauvis = data.raw.planet.nauvis
local nauvis_gen = nauvis.map_gen_settings
nauvis.pollutant_type = nil
nauvis_gen.autoplace_controls["iron-ore"] = nil
nauvis_gen.autoplace_controls["copper-ore"] = nil
nauvis_gen.autoplace_controls["coal"] = nil
nauvis_gen.autoplace_controls["crude-oil"] = nil
nauvis_gen.autoplace_controls["enemy-base"] = nil
nauvis_gen.autoplace_controls["cube-deep-core-vein"] = {}
nauvis_gen.autoplace_controls["cube-rare-metals"] = {}
nauvis_gen.autoplace_settings.entity.settings["iron-ore"] = nil
nauvis_gen.autoplace_settings.entity.settings["copper-ore"] = nil
nauvis_gen.autoplace_settings.entity.settings["coal"] = nil
nauvis_gen.autoplace_settings.entity.settings["crude-oil"] = nil
nauvis_gen.autoplace_settings.entity.settings["cube-deep-core-vein"] = {}
nauvis_gen.autoplace_settings.entity.settings["cube-rare-metals"] = {}

data.raw.turret["small-worm-turret"].autoplace = nil
data.raw.turret["medium-worm-turret"].autoplace = nil
data.raw.turret["big-worm-turret"].autoplace = nil
data.raw.turret["behemoth-worm-turret"].autoplace = nil
data.raw["unit-spawner"]["biter-spawner"].autoplace = nil
data.raw["unit-spawner"]["spitter-spawner"].autoplace = nil