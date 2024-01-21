local vanilla_categories = make_set({
  "game-interaction",
  "inserters",
  "belts",
  "electric-network",
  "copy-paste",
  "drag-building",
  "trains",
  "logistic-network",
  "ghost-building",
  "fast-replace",
})

for name, tip in pairs(data.raw["tips-and-tricks-item"]) do
  if name == "introduction" or (tip.category and vanilla_categories[tip.category]) then
    tip.indent = 1 + (tip.indent or 0)
    tip.starting_status = "unlocked"
  end
end

data:extend({
  {
    type = "tips-and-tricks-item",
    name = "cube-vanilla",
    is_title = true,
    starting_status = "unlocked",
    order = "1[vanilla]",
  },
  {
    type = "tips-and-tricks-item-category",
    name = "cube-tips",
    order = "0[cube]",
  },
  {
    type = "tips-and-tricks-item",
    name = "cube-ultracube",
    is_title = true,
    starting_status = "unlocked",
    category = "cube-tips",
    order = "0",
  },
  {
    type = "tips-and-tricks-item",
    name = "cube-cube",
    tag = "[item=cube-ultradense-utility-cube]",
    trigger = {
      type = "research",
      technology = "cube-fundamental-comprehension-card",
    },
    category = "cube-tips",
    indent = 1,
    order = "1",
  },
})