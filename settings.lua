data:extend({
  {
    type = "bool-setting",
    name = "cube-show-cube-alerts",
    setting_type = "runtime-per-user",
    default_value = true,
    order = "0",
  },
  {
    type = "string-setting",
    name = "cube-cube-fx-frequency",
    setting_type = "runtime-global",
    default_value = "normal",
    allowed_values = {
      "normal",
      "low",
      "lower",
      "verylow",
      "off",
    },
    order = "1",
  },
  {
    type = "bool-setting",
    name = "cube-powered-cars",
    setting_type = "runtime-global",
    default_value = true,
    order = "2",
  },
  {
    type = "int-setting",
    name = "cube-cubecam-scale",
    setting_type = "runtime-per-user",
    default_value = 100,
    order = "3",
  }
})

local allowed_values_cubecam_scale = {}
for i = 10, 150, 1 do
  allowed_values_cubecam_scale[i] = i
end

data.raw["int-setting"]["cube-cubecam-scale"].allowed_values = allowed_values_cubecam_scale

data.raw["string-setting"]["aai-loaders-mode"].hidden = true
data.raw["string-setting"]["aai-loaders-mode"].allowed_values = {"expensive"}
data.raw["string-setting"]["aai-loaders-mode"].default_value = "expensive"
data.raw["string-setting"]["aai-loaders-lubricant-recipe"].hidden = true
data.raw["string-setting"]["aai-loaders-lubricant-recipe"].allowed_values = {"disabled"}
data.raw["string-setting"]["aai-loaders-lubricant-recipe"].default_value = "disabled"
data.raw["bool-setting"]["aai-loaders-fit-assemblers"].hidden = true
data.raw["bool-setting"]["aai-loaders-fit-assemblers"].default_value = false
