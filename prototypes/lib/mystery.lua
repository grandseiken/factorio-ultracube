function add_mystery_recipe(a, b, c, d, e)
  local item = nil
  for t, _ in pairs(defines.prototypes.item) do
    if data.raw[t] then
      item = data.raw[t][b]
    end
    if item then break end
  end
  local results = {{type = "item", name = "cube-residual-tendrils",
                    amount_min = 0, amount_max = math.floor(1 + a)}}
  if c then
    results[#results + 1] = {type = "item", name = c, amount = e or 1}
  end
  data:extend({
    {
      type = "recipe",
      name = "cube-mystery-" .. b,
      icon = item.icon,
      icon_size = item.icon_size,
      icons = item.icons,
      localised_name = {"recipe-name.cube-mystery"},
      ingredients = {{type = "item", name = b, amount = d or 1}},
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
