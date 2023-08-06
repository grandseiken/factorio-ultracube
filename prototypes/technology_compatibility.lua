require("prototypes.lib.tech_costs")

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
      unit = tech_cost_unit("1a", 60),
      order = "x-0-0",
    },
  })
  data.raw.item["nixie-tube"].subgroup = "cube-combinator-extra"
  data.raw.item["nixie-tube"].order = "y"
  data.raw.item["nixie-tube-alpha"].subgroup = "cube-combinator-extra"
  data.raw.item["nixie-tube-alpha"].order = "y"
  data.raw.item["nixie-tube-small"].subgroup = "cube-combinator-extra"
  data.raw.item["nixie-tube-small"].order = "y"
end

if mods["Flow Control"] then
  data:extend({
    {
      type = "technology",
      name = "flow_control_valves_tech",
      icon_size = 256, icon_mipmaps = 4,
      icon = "__Flow Control__/graphics/technology/flow_control_valves_tech.png",
      effects = {
        {type = "unlock-recipe", recipe = "cube-check-valve"},
        {type = "unlock-recipe", recipe = "cube-overflow-valve"},
        {type = "unlock-recipe", recipe = "cube-underflow-valve"},
      },
      prerequisites = {
        "cube-fundamental-comprehension-card",
        "cube-fluid-handling",
      },
      unit = tech_cost_unit("1a", 120),
      order = "x-0-1",
    },
  })
  data.raw.item["pushbutton"].subgroup = "cube-combinator-extra"
  data.raw.item["pushbutton"].order = "x"
end

if mods["pushbutton"] then
  data:extend({
    {
      type = "technology",
      name = "pushbutton",
      icon_size = 256, icon_mipmaps = 4,
      icon = "__pushbutton__/graphics/rwSiA9L.png",
      effects = {
        {type = "unlock-recipe", recipe = "cube-pushbutton"},
      },
      prerequisites = {
        "cube-combinatorics",
        "cube-advanced-electronics",
      },
      unit = tech_cost_unit("1a", 60),
      order = "x-0-2",
    },
  })
end