require("__aai-loaders__/prototypes/phase-1/combined/loaders")

AAILoaders.make_tier{
  name = "",
  transport_belt = "transport-belt",
  color = {255, 217, 85},
  recipe = {},
  localise = false,
}

AAILoaders.make_tier{
  name = "v2",
  transport_belt = "fast-transport-belt",
  color = {255, 24, 38},
  recipe = {},
  upgrade = "aai-v3-loader",
  localise = false,
}

AAILoaders.make_tier{
  name = "v3",
  transport_belt = "express-transport-belt",
  color = {90, 190, 255},
  recipe = {},
  upgrade = "aai-v4-loader",
  localise = false,
}

AAILoaders.make_tier{
  name = "v4",
  transport_belt = "cube-v4-transport-belt",
  color = {210, 1, 247},
  recipe = {},
  localise = false,
}

local function add_hidden_flag(t)
  if not t.flags then
    t.flags = {}
  end
  t.flags[#t.flags + 1] = "hidden"
end

local function add_energy_source(t, energy_scale)
  t.energy_per_item = "5KJ"
  t.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    input_flow_limit = (energy_scale * 0.4) .. "MW",
    emissions_per_minute = energy_scale * 20,
    drain = (energy_scale * 50) .. "KW",
  }
end

add_hidden_flag(data.raw["loader-1x1"]["aai-loader"])
add_hidden_flag(data.raw["item"]["aai-loader"])
add_energy_source(data.raw["loader-1x1"]["aai-loader"], 1)
add_energy_source(data.raw["loader-1x1"]["aai-v2-loader"], 2)
add_energy_source(data.raw["loader-1x1"]["aai-v3-loader"], 3)
add_energy_source(data.raw["loader-1x1"]["aai-v4-loader"], 4)

data.raw["item"]["aai-loader"].stack_size = 20
data.raw["item"]["aai-v2-loader"].stack_size = 20
data.raw["item"]["aai-v3-loader"].stack_size = 20
data.raw["item"]["aai-v4-loader"].stack_size = 20

data.raw["item"]["aai-loader"].subgroup = "inserter"
data.raw["item"]["aai-v2-loader"].subgroup = "inserter"
data.raw["item"]["aai-v3-loader"].subgroup = "inserter"
data.raw["item"]["aai-v4-loader"].subgroup = "inserter"
data.raw["item"]["aai-loader"].order = "0[1-loader]"
data.raw["item"]["aai-v2-loader"].order = "1[2-loader]"
data.raw["item"]["aai-v3-loader"].order = "2[3-loader]"
data.raw["item"]["aai-v4-loader"].order = "3[4-loader]"

data.raw["item"]["aai-loader"].localised_description = nil
data.raw["item"]["aai-v2-loader"].localised_description = nil
data.raw["item"]["aai-v3-loader"].localised_description = nil
data.raw["item"]["aai-v4-loader"].localised_description = nil
data.raw["loader-1x1"]["aai-loader"].localised_description = nil
data.raw["loader-1x1"]["aai-v2-loader"].localised_description = nil
data.raw["loader-1x1"]["aai-v3-loader"].localised_description = nil
data.raw["loader-1x1"]["aai-v4-loader"].localised_description = nil