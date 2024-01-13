local cube_cars = {}

for _, car in pairs(data.raw.car) do
  local cube_car = table.deepcopy(car)
  cube_car.name = "cube-powered-" .. car.name
  cube_car.localised_name = car.localised_name and car.localised_name or {"entity-name."..car.name}
  cube_car.localised_description = car.localised_description and car.localised_description or {"?", {"entity-description."..car.name}, ""}
  cube_car.energy_per_hit_point = 0 -- Unstoppable, no slow down, destroys everything even at low speed
  -- cube_car.energy_per_hit_point = car.energy_per_hit_point / 100 -- Almost unstoppable except at low speed, but slight hitch looks unpleasant (almost looks like frame drops)
  cube_car.immune_to_tree_impacts = true
  cube_car.immune_to_rock_impacts = true
  cube_car.immune_to_cliff_impacts = true

  for _, resistance in pairs(cube_car.resistances) do
    if resistance.type == "impact" then
      resistance.percent = 100
      goto forelse
    end
  end
  table.insert(cube_car.resistances, {type = "impact", percent = 100})
  ::forelse::

  table.insert(cube_cars, cube_car)
end

data:extend(cube_cars)
