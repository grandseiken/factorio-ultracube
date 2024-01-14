local styles = data.raw["gui-style"]["default"]

styles["cube_cubecam_drag_handle"] = {
  type = "empty_widget_style",
  parent = "draggable_space",
  left_margin = 4,
  right_margin = 4,
  height = 24,
  horizontally_stretchable = "on"
}

styles["cube_cubecam_pusher"] = {
  type = "empty_widget_style",
  horizontally_stretchable = "on"
}

styles["cube_cubecam_slider"] = {
  type = "slider_style",
  parent = "notched_slider",
  right_margin = 4,
}

styles["cube_cubecam_fullscreen"] = {
  type = "button_style",
  parent = "frame_action_button",
  right_margin = 4,
}

styles["cube_cubecam_camera"] = {
  type = "camera_style",
  horizontally_stretchable = "on",
  vertically_stretchable = "on",
}

styles["cube_cubecam_minimap"] = {
  type = "minimap_style",
  horizontally_stretchable = "on",
  vertically_stretchable = "on",
}

data:extend({
  {
    type = "sprite",
    name = "cube-fullscreen",
    filename = "__Ultracube__/assets/icons/fullscreen.png",
    size = {32, 32},
    flags = {"no-crop"},
  },
})