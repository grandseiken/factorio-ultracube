local item_prototypes = {
  "item",
  "tool",
  "gun",
  "ammo",
  "armor",
  "module",
  "item-with-entity-data",
  "capsule",
  "rail-planner",
  "spidertron-remote",
}

function add_mystery_recipe(a, b, c, d, e)
  local item = nil
  for _, t in ipairs(item_prototypes) do
    item = data.raw[t][b]
    if item then break end
  end
  local results = {{type = "item", name = "cube-residual-tendrils",
                    amount_min = 0, amount_max = math.floor(1 + a)}}
  if c then
    results[#results + 1] = {c, e or 1}
  end
  data:extend({
    {
      type = "recipe",
      name = "cube-mystery-" .. b,
      icon = item.icon,
      icon_size = item.icon_size,
      icon_mipmaps = item.icon_mipmaps,
      icons = item.icons,
      localised_name = {"recipe-name.cube-mystery"},
      ingredients = {{b, d or 1}},
      results = results,
      energy_required = 2 * a,
      category = "cube-mystery-furnace",
      subgroup = "cube-mystery",
      hidden = true,
      hide_from_player_crafting = true,
      unlock_results = false,
    }
  })
end
