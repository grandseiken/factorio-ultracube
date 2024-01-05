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