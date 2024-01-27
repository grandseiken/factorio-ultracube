local entity_combine = require("__Ultracube__/scripts/entity_combine")
for _, e in pairs(game.surfaces[1].find_entities_filtered {name = {"accumulator", "cube-energy-bulkframe"}}) do
  entity_combine.created(e)
end