local vanilla_tips = {
  "introduction",
  "show-info",
  "e-confirm",
  "clear-cursor",
  "pipette",
  "stack-transfers",
  "entity-transfers",
  "z-dropping",
  "shoot-targeting",
  "bulk-crafting",
  "rotating-assemblers",
  "circuit-network",
  "inserters",
  "burner-inserter-refueling",
  "long-handed-inserters",
  "move-between-labs",
  "insertion-limits",
  "limit-chests",
  "transport-belts",
  "belt-lanes",
  "splitters",
  "splitter-filters",
  "underground-belts",
  "electric-network",
  "steam-power",
  "electric-pole-connections",
  "low-power",
  "connect-switch",
  "copy-entity-settings",
  "copy-paste-trains",
  "copy-paste-filters",
  "copy-paste-requester-chest",
  "copy-paste-spidertron",
  "drag-building",
  "drag-building-poles",
  "pole-dragging-coverage",
  "drag-building-underground-belts",
  "fast-belt-bending",
  "fast-obstacle-traversing",
  "trains",
  "rail-building",
  "train-stops",
  "rail-signals-basic",
  "rail-signals-advanced",
  "gate-over-rail",
  "pump-connection",
  "train-stop-same-name",
  "logistic-network",
  "personal-logistics",
  "construction-robots",
  "passive-provider-chest",
  "storage-chest",
  "requester-chest",
  "active-provider-chest",
  "buffer-chest",
  "ghost-building",
  "ghost-rail-planner",
  "copy-paste",
  "fast-replace",
  "fast-replace-direction",
  "fast-replace-belt-splitter",
  "fast-replace-belt-underground",
}

local vanilla_categories = {
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
}

for _, name in pairs(vanilla_tips) do
  local tip = data.raw["tips-and-tricks-item"][name]
  tip.indent = 1 + (tip.indent or 0)
  tip.order = "z[vanilla]-" .. (tip.order or "")
  tip.starting_status = "unlocked"
end

for _, name in pairs(vanilla_categories) do
  local category = data.raw["tips-and-tricks-item-category"][name]
  category.order = "z[vanilla]-" .. (category.order or "")
end

data:extend({
  {
    type = "tips-and-tricks-item",
    name = "cube-vanilla",
    is_title = true,
    starting_status = "unlocked",
    order = "z[vanilla]",
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