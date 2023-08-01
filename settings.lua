data:extend({
  {
    type = "bool-setting",
    name = "cube-show-cube-alerts",
    setting_type = "runtime-per-user",
    default_value = true,
  }
})

data.raw["string-setting"]["aai-loaders-mode"].hidden = true
data.raw["string-setting"]["aai-loaders-mode"].allowed_values = {"expensive"}
data.raw["string-setting"]["aai-loaders-mode"].default_value = "expensive"
data.raw["string-setting"]["aai-loaders-lubricant-recipe"].hidden = true
data.raw["string-setting"]["aai-loaders-lubricant-recipe"].allowed_values = {"disabled"}
data.raw["string-setting"]["aai-loaders-lubricant-recipe"].default_value = "disabled"
data.raw["bool-setting"]["aai-loaders-fit-assemblers"].hidden = true
data.raw["bool-setting"]["aai-loaders-fit-assemblers"].default_value = false