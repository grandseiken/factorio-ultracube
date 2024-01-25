local milestones = {
  {type = "group", name = "Science"},
  {type = "item",  name = "cube-basic-contemplation-unit",       quantity = 1},
  {type = "item",  name = "cube-fundamental-comprehension-card", quantity = 1},
  {type = "item",  name = "cube-abstract-interrogation-card",    quantity = 1},
  {type = "item",  name = "cube-deep-introspection-card",        quantity = 1},
  {type = "item",  name = "cube-synthetic-premonition-card",     quantity = 1},
  {type = "item",  name = "cube-complete-annihilation-card",     quantity = 1},
  {type = "item",  name = "cube-basic-contemplation-unit",       quantity = 1000, next = "x10"},
  {type = "item",  name = "cube-fundamental-comprehension-card", quantity = 1000, next = "x10"},
  {type = "item",  name = "cube-abstract-interrogation-card",    quantity = 1000, next = "x10"},
  {type = "item",  name = "cube-deep-introspection-card",        quantity = 1000, next = "x10"},
  {type = "item",  name = "cube-synthetic-premonition-card",     quantity = 1000, next = "x10"},
  {type = "item",  name = "cube-complete-annihilation-card",     quantity = 1000, next = "x10"},

  {type = "group", name = "The Cube"},
  {type = "item_consumption",  name = "cube-ultradense-utility-cube",        quantity = 100, next = "x10"},
  {type = "item_consumption",  name = "cube-phantom-ultradense-constituent", quantity = 1,   next = "x10", hidden = true},
  {type = "item_consumption",  name = "cube-legendary-iron-gear",            quantity = 1,   next = "x10", hidden = true},

  {type = "group", name = "Components"},
  {type = "item",  name = "cube-electronic-circuit", quantity = 1},
  {type = "item",  name = "cube-advanced-circuit",   quantity = 1},
  {type = "item",  name = "cube-spectral-processor", quantity = 1, hidden = true},
  {type = "item",  name = "cube-basic-motor-unit",   quantity = 1},
  {type = "item",  name = "cube-advanced-engine",    quantity = 1},
  {type = "item",  name = "cube-arcane-drive",       quantity = 1, hidden = true},
  {type = "item",  name = "cube-electronic-circuit", quantity = 1000, next = "x10"},
  {type = "item",  name = "cube-advanced-circuit",   quantity = 1000, next = "x10"},
  {type = "item",  name = "cube-spectral-processor", quantity = 1000, next = "x10", hidden = true},
  {type = "item",  name = "cube-basic-motor-unit",   quantity = 1000, next = "x10"},
  {type = "item",  name = "cube-advanced-engine",    quantity = 1000, next = "x10"},
  {type = "item",  name = "cube-arcane-drive",       quantity = 1000, next = "x10", hidden = true},

  {type = "group", name = "Materials"},
  {type = "item",  name = "cube-basic-matter-unit",  quantity = 1},
  {type = "item",  name = "cube-rare-metals",        quantity = 1},
  {type = "fluid", name = "cube-gelatinous-tar",     quantity = 1},
  {type = "item",  name = "cube-spectralite",        quantity = 1, hidden = true},
  {type = "item",  name = "cube-resplendent-plate",  quantity = 1, hidden = true},
  {type = "item",  name = "cube-basic-matter-unit",  quantity = 10000, next = "x10"},
  {type = "item",  name = "cube-rare-metals",        quantity = 10000, next = "x10"},
  {type = "fluid", name = "cube-gelatinous-tar",     quantity = 100000, next = "x10"},
  {type = "item",  name = "cube-spectralite",        quantity = 10000, next = "x10", hidden = true},
  {type = "item",  name = "cube-resplendent-plate",  quantity = 10000, next = "x10", hidden = true},

  {type = "group", name = "Logistics"},
  {type = "item",  name = "stack-inserter",               quantity = 1},
  {type = "item",  name = "aai-v2-loader",                quantity = 1},
  {type = "item",  name = "car",                          quantity = 1},
  {type = "item",  name = "locomotive",                   quantity = 1},
  {type = "item",  name = "spidertron",                   quantity = 1},
  {type = "item",  name = "construction-robot",           quantity = 1},
  {type = "item",  name = "cube-logistic-robot-0",        quantity = 1},
  {type = "item",  name = "cube-roboport",                quantity = 1},
  {type = "item",  name = "cube-beacon",                  quantity = 1},
  {type = "item",  name = "cube-experimental-teleporter", quantity = 1, hidden = true},
  {type = "item",  name = "cube-forbidden-ziggurat",      quantity = 1, hidden = true},

  {type = "group", name = "Power"},
  {type = "item",  name = "cube-boiler",             quantity = 1},
  {type = "item",  name = "cube-stygian-energy-lab", quantity = 1},
  {type = "item",  name = "cube-nuclear-reactor",    quantity = 1},
  {type = "item",  name = "cube-antimatter-reactor", quantity = 1},

  {type = "group", name = "Kills"},
  {type = "kill",  name = "character", quantity = 1, next = "x5", hidden = true},
}

local function milestones_preset()
  return {
    ["Ultracube: Age of Cube"] = {
      required_mods = {"Ultracube"},
      milestones = milestones,
    },
  }
end

return milestones_preset
