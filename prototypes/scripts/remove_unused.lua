require("scripts.lib")

-- Disable all default items (except for whitelisted), recipes and technologies.
local whitelist = make_set({
  "water",
  "steam",
  "sulfuric-acid",
  "stone",
  "stone-brick",
  "wood",
  "coal",
  "pump",
  "pipe",
  "pipe-to-ground",
  "iron-chest",
  "logistic-chest-passive-provider",
  "logistic-chest-active-provider",
  "logistic-chest-storage",
  "logistic-chest-buffer",
  "logistic-chest-requester",
  "storage-tank",
  "steam-engine",
  "offshore-pump",
  "accumulator",
  "radar",
  "stone-wall",
  "gate",
  "concrete",
  "hazard-concrete",
  "refined-concrete",
  "refined-hazard-concrete",
  "landfill",
  "car",
  "rail",
  "locomotive",
  "cargo-wagon",
  "fluid-wagon",
  "train-stop",
  "rail-signal",
  "rail-chain-signal",
  "fast-transport-belt",
  "fast-underground-belt",
  "fast-splitter",
  "express-transport-belt",
  "express-underground-belt",
  "express-splitter",
  "small-lamp",
  "copper-cable",
  "sulfur",
  "battery",
  "explosives",
  "cliff-explosives",
  "flying-robot-frame",
  "red-wire",
  "green-wire",
  "constant-combinator",
  "arithmetic-combinator",
  "decider-combinator",
  "power-switch",
  "programmable-speaker",
  "medium-electric-pole",
  "big-electric-pole",
  "substation",
  "fast-inserter",
  "long-handed-inserter",
  "filter-inserter",
  "stack-inserter",
  "stack-filter-inserter",
  -- Compatibility.
  "nixie-tube",
  "nixie-tube-alpha",
  "nixie-tube-small",
  "check-valve",
  "overflow-valve",
  "underflow-valve",
})

local entity_prototypes = {
  "lab",
  "inserter",
  "transport-belt",
  "underground-belt",
  "splitter",
  "furnace",
  "assembling-machine",
  "mining-drill",
  "construction-robot",
  "logistic-robot",
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
  "artillery-wagon",
}

local function add_hidden_flag(t)
  if not t.flags then
    t.flags = {}
  end
  t.flags[#t.flags + 1] = "hidden"
end

for _, v in ipairs(entity_prototypes) do
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
