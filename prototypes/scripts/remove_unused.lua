-- Disable all default items (except for whitelisted), recipes and technologies.
local whitelist = {
  ["water"] = true,
  ["steam"] = true,
  ["pipe"] = true,
  ["storage-tank"] = true,
  ["steam-engine"] = true,
  ["offshore-pump"] = true,
  ["fast-transport-belt"] = true,
  ["fast-underground-belt"] = true,
  ["fast-splitter"] = true,
  ["express-transport-belt"] = true,
  ["express-underground-belt"] = true,
  ["express-splitter"] = true,
  ["small-lamp"] = true,
  ["copper-cable"] = true,
  ["red-wire"] = true,
  ["green-wire"] = true,
  ["constant-combinator"] = true,
  ["arithmetic-combinator"] = true,
  ["decider-combinator"] = true,
  ["power-switch"] = true,
  ["programmable-speaker"] = true,
  ["medium-electric-pole"] = true,
  ["big-electric-pole"] = true,
  ["substation"] = true,
  ["fast-inserter"] = true,
  ["long-handed-inserter"] = true,
  ["filter-inserter"] = true,
  ["stack-inserter"] = true,
  ["stack-filter-inserter"] = true,
}

local upgradable_prototypes = {
  "inserter",
  "transport-belt",
  "underground-belt",
  "splitter",
  "furnace",
  "assembling-machine",
}

local item_prototypes = {
  "item",
  "item-with-entity-data",
  "ammo",
  "capsule",
  "gun",
  "module",
  "spidertron-remote",
  "armor",
  "tool",
  "mining-tool",
  "repair-tool",
}

local function add_hidden_flag(t)
  if not t.flags then
    t.flags = {}
  end
  t.flags[#t.flags + 1] = "hidden"
end

for _, v in ipairs(upgradable_prototypes) do
  for _, t in pairs(data.raw[v]) do
    if not whitelist[t.name] then
      t.next_upgrade = nil
      add_hidden_flag(t)
    end
  end
end

for _, v in ipairs(item_prototypes) do
  for _, t in pairs(data.raw[v]) do
    if not whitelist[t.name] then
      add_hidden_flag(t)
    end
  end
end

for _, t in pairs(data.raw.fluid) do
  if not whitelist[t.name] then
    t.hidden = true
  end
end

for _, t in pairs(data.raw.recipe) do
  t.enabled = false
  if t.normal then
    t.normal.enabled = false
  end
  if t.expensive then
    t.expensive.enabled = false
  end
end
