require("__Ultracube__/scripts/lib")

-- Disable all default items (except for whitelisted), recipes and technologies.
local whitelist = make_set({
  "raw-fish",
  "water",
  "steam",
  "sulfuric-acid",
  "uranium-ore",
  "uranium-235",
  "uranium-238",
  "uranium-fuel-cell",
  "used-up-uranium-fuel-cell",
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
  "spidertron",
  "spidertron-remote",
  "car",
  "rail",
  "locomotive",
  "cargo-wagon",
  "fluid-wagon",
  "train-stop",
  "rail-signal",
  "rail-chain-signal",
  "transport-belt",
  "underground-belt",
  "splitter",
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
  "small-electric-pole",
  "medium-electric-pole",
  "big-electric-pole",
  "substation",
  "inserter",
  "fast-inserter",
  "long-handed-inserter",
  "filter-inserter",
  "stack-inserter",
  "stack-filter-inserter",
  "heat-pipe",
  "heat-exchanger",
  "centrifuge",
  "night-vision-equipment",
  "exoskeleton-equipment",
  "battery-mk2-equipment",
  "personal-roboport-mk2-equipment",
  "fusion-reactor-equipment",
  -- Compatibility.
  -- TODO: this is not a good system, make it possible for mods to specify.
  "nixie-tube",
  "nixie-tube-alpha",
  "nixie-tube-small",
  "check-valve",
  "overflow-valve",
  "underflow-valve",
  "pushbutton",
  "item-sensor",
  "cybersyn-combinator",
  "aai-signal-sender",
  "aai-signal-receiver",
  "textplate-small-plastic",
  "textplate-large-plastic",
  "textplate-small-stone",
  "textplate-large-stone",
  "textplate-small-steel",
  "textplate-large-steel",
  "textplate-small-concrete",
  "textplate-large-concrete",
  "textplate-small-glass",
  "textplate-large-glass",
  "textplate-small-gold",
  "textplate-large-gold",
  "textplate-small-uranium",
  "textplate-large-uranium",
})

local entity_prototypes = {
  "lab",
  "inserter",
  "transport-belt",
  "underground-belt",
  "loader-1x1",
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
