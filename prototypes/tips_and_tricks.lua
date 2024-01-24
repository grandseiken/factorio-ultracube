require("__Ultracube__/scripts/lib")

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
    name = "cube-boiler",
    tag = "[item=cube-boiler]",
    trigger = {
      type = "unlock-recipe",
      recipe = "cube-boiler",
    },
    category = "cube-tips",
    indent = 1,
    order = "1",
  },
  {
    type = "tips-and-tricks-item",
    name = "cube-logistics",
    tag = "[item=cube-ultradense-utility-cube]",
    trigger = {
      type = "research",
      technology = "cube-electronics",
    },
    category = "cube-tips",
    indent = 1,
    order = "2",
  },
  {
    type = "tips-and-tricks-item",
    name = "cube-efficiency",
    tag = "[recipe=cube-utility-cube-recharge]",
    trigger = {
      type = "research",
      technology = "cube-fundamental-comprehension-card",
    },
    category = "cube-tips",
    indent = 1,
    order = "3",
  },
  {
    type = "tips-and-tricks-item",
    name = "cube-ultralocomotion",
    tag = "[item=locomotive]",
    trigger = {
      type = "research",
      technology = "cube-transitive-ultralocomotion",
    },
    category = "cube-tips",
    indent = 1,
    order = "4",
  },
  {
    type = "tips-and-tricks-item",
    name = "cube-nuclear-reactor",
    tag = "[entity=cube-nuclear-reactor]",
    trigger = {
      type = "research",
      technology = "cube-nuclear-power",
    },
    category = "cube-tips",
    indent = 1,
    order = "5",
  },
  {
    type = "tips-and-tricks-item",
    name = "cube-quantum-decoder",
    tag = "[item=cube-quantum-decoder]",
    trigger = {
      type = "research",
      technology = "cube-quantum-decoder",
    },
    category = "cube-tips",
    indent = 1,
    order = "6",
  },
})