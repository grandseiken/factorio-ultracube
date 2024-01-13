local cube_item = data.raw.item["cube-ultradense-utility-cube"]
local fuel_items = {"wood", "coal", "cube-condensed-fuel", "cube-vehicle-fuel", "cube-nuclear-fuel"}
for _, name in ipairs(fuel_items) do
  local base = data.raw.item[name]
  data:extend({
    {
      type = "item",
      name = name .. "-ultralocomotion",
      localised_name = {"", {"item-name." .. name}, " (ultralocomotion)"},
      icon = base.icon,
      icon_size = base.icon_size,
      icon_mipmaps = base.icon_mipmaps,
      fuel_category = base.fuel_category,
      fuel_value = base.fuel_value,
      fuel_acceleration_multiplier = (base.fuel_acceleration_multiplier or 1) * cube_item.fuel_acceleration_multiplier,
      fuel_top_speed_multiplier = (base.fuel_top_speed_multiplier or 1) * cube_item.fuel_top_speed_multiplier,
      subgroup = base.subgroup,
      order = base.order,
      stack_size = 1,
      flags = {
        "hidden",
        "hide-from-bonus-gui",
        "hide-from-fuel-tooltip",
      },
    },
  })
end

local cube_cars = {}
for _, car in pairs(data.raw.car) do
  local cube_car = table.deepcopy(car)
  cube_car.name = "cube-powered-" .. car.name
  cube_car.localised_name = car.localised_name and car.localised_name or {"entity-name." .. car.name}
  cube_car.localised_description =
      car.localised_description and car.localised_description or {"?", {"entity-description."..car.name}, ""}
  cube_car.energy_per_hit_point = 0 -- Unstoppable, no slow down, destroys everything even at low speed
  -- Almost unstoppable except at low speed, but slight hitch looks unpleasant (almost looks like frame drops)
  -- cube_car.energy_per_hit_point = car.energy_per_hit_point / 100
  cube_car.immune_to_tree_impacts = true
  cube_car.immune_to_rock_impacts = true
  cube_car.immune_to_cliff_impacts = true
  if cube_car.flags then
    table.insert(cube_car.flags, "hidden")
  else
    cube_car.flags = {"hidden"}
  end

  for _, resistance in pairs(cube_car.resistances) do
    if resistance.type == "impact" then
      resistance.percent = 100
      goto forelse
    end
  end
  table.insert(cube_car.resistances, {type = "impact", percent = 100})

  ::forelse::
  cube_cars[#cube_cars + 1] = cube_car
end
data:extend(cube_cars)
