print(serpent.block(mods))
if mods["nixie-tubes"] then
  data:extend({
    {
      type = "technology",
      name = "cathodes",
      icon_size = 128, icon_mipmaps = 4,
      icon = "__nixie-tubes__/graphics/nixie-technology-icon.png",
      effects = {
        {type = "unlock-recipe", recipe = "cube-nixie-tube"},
        {type = "unlock-recipe", recipe = "cube-nixie-tube-alpha"},
        {type = "unlock-recipe", recipe = "cube-nixie-tube-small"},
      },
      prerequisites = {"cube-crusher"},
      unit = {
        count = 60,
        ingredients = {
          {"cube-basic-contemplation-unit", 1},
          {"cube-fundamental-comprehension-card", 1},
        },
        time = 20,
      },
      order = "x-0-0",
    },
  })
end