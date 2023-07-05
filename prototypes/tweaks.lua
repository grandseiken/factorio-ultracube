data.raw.generator["steam-engine"].maximum_temperature = 215
data.raw.pump.pump.pumping_speed = 250
data.raw.pump.pump.energy_usage = "40KW"
data.raw.pump.pump.energy_source.drain = "0KW"
data.raw.character.character.crafting_categories = {
  "crafting",
  "cube-synthesizer-handcraft",
  "cube-fabricator-handcraft",
}

data.raw.container["iron-chest"].inventory_size = 20
data.raw.inserter["long-handed-inserter"].fast_replaceable_group = "inserter"
data.raw.inserter["stack-inserter"].stack_size_bonus = 3
data.raw.inserter["stack-filter-inserter"].stack_size_bonus = 3
data.raw.item["copper-cable"].subgroup = "cube-components"
data.raw.item["copper-cable"].order = "0[b-conductive-wire]"
data.raw.item["stone-brick"].subgroup = "cube-furnace"
data.raw.item["stone-brick"].order = "0[a-brick]"
data.raw.item["radar"].subgroup = "cube-logistic-machines"
data.raw.item["radar"].order = "0[radar]"
data.raw.item["radar"].icon = "__Krastorio2Assets__/icons/entities/advanced-radar.png"
data.raw.item["wood"].fuel_category = "cube-fuel-general"
data.raw.item["sulfur"].subgroup = "cube-chemical-intermediates"
data.raw.item["sulfur"].order = "0[sulfur]"
data.raw.item["battery"].subgroup = "cube-chemical-intermediates"
data.raw.item["battery"].order = "1[battery]"
data.raw.item["flying-robot-frame"].subgroup = "cube-chemical-intermediates"
data.raw.item["flying-robot-frame"].order = "2[frame]"
data.raw.fluid.water.icon = "__Krastorio2Assets__/icons/fluids/water.png"
data.raw.fluid.steam.icon = "__Krastorio2Assets__/icons/fluids/steam.png"
data.raw.item.wood.subgroup = "cube-fuel"
data.raw.item.wood.order = "0[wood]"
data.raw.car.car.burner.fuel_categories = {"cube-cube", "cube-fuel-canister", "cube-fuel-general"}
data.raw.car.car.burner.burnt_inventory_size = 1
data.raw.locomotive.locomotive.burner.fuel_categories = {"cube-cube", "cube-fuel-canister", "cube-fuel-general"}
data.raw.locomotive.locomotive.burner.burnt_inventory_size = 1

data.raw.radar["radar"].icon = "__Krastorio2Assets__/icons/entities/advanced-radar.png"
data.raw.radar["radar"].vehicle_impact_sound = {
  filename = "__base__/sound/car-metal-impact.ogg",
  volume = 0.65,
}
data.raw.radar["radar"].pictures.layers[1].filename = "__Krastorio2Assets__/entities/advanced-radar/radar.png"
data.raw.radar["radar"].pictures.layers[2].filename = "__Krastorio2Assets__/entities/advanced-radar/radar-shadow.png"
data.raw.radar["radar"].pictures.layers[1].hr_version.filename = "__Krastorio2Assets__/entities/advanced-radar/hr-radar.png"
data.raw.radar["radar"].pictures.layers[2].hr_version.filename = "__Krastorio2Assets__/entities/advanced-radar/hr-radar-shadow.png"