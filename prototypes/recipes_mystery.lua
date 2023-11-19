local function add_mystery(a, b, c)
  local item = data.raw.item[b]

  data:extend({
    {
      type = "recipe",
      name = "cube-mystery-" .. b,
      icon = item.icon,
      icon_size = item.icon_size,
      icon_mipmaps = item.icon_mipmaps,
      icons = item.icons,
      localised_name = {"recipe-name.cube-mystery"},
      ingredients = {{b, 1}},
      results = {
        {c, 1},
        {type = "item", name = "cube-residual-tendrils", amount_min = 0, amount_max = math.floor(1 + a)}
      },
      energy_required = 2 * a,
      category = "cube-mystery-furnace",
      subgroup = "cube-mystery",
      hidden = true,
      hide_from_player_crafting = true,
    }
  })
end

add_mystery(1, "fast-transport-belt", "transport-belt")
add_mystery(1, "express-transport-belt", "fast-transport-belt")
add_mystery(1, "cube-v4-transport-belt", "express-transport-belt")
add_mystery(1, "fast-underground-belt", "underground-belt")
add_mystery(1, "express-underground-belt", "fast-underground-belt")
add_mystery(1, "cube-v4-underground-belt", "express-underground-belt")
add_mystery(1, "fast-splitter", "splitter")
add_mystery(1, "express-splitter", "fast-splitter")
add_mystery(1, "cube-v4-splitter", "express-splitter")
add_mystery(1, "aai-v2-loader", "aai-loader")
add_mystery(1, "aai-v3-loader", "aai-v2-loader")
add_mystery(1, "aai-v4-loader", "aai-v3-loader")