data:extend({
  {
    type = "custom-input",
    name = "cube-toggle-alerts",
    key_sequence = "CONTROL + L",
    consuming = "game-only",
    action = "lua",
  },
  {
    type = "custom-input",
    name = "cube-open-cubecam",
    key_sequence = "K",
    consuming = "game-only",
    action = "lua",
  },
  {
    type = "custom-input",
    name = "cube-open-cubecam-fullscreen",
    key_sequence = "ALT + K",
    consuming = "game-only",
    action = "lua",
  },
  {
    type = "shortcut",
    name = "cube-open-cubecam",
    order = "a[cube-open-cubecam]",
    action = "lua",
    localised_name = {"controls.cube-open-cubecam"},
    associated_control_input = "cube-open-cubecam",
    unavailable_until_unlocked = false,
    icon = "__Ultracube__/assets/icons/shortcut/cubecam-32.png",
    icon_size = 32,
    small_icon = "__Ultracube__/assets/icons/shortcut/cubecam-24.png",
    small_icon_size = 24
  },
})