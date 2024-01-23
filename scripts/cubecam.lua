local cubecam = {}
local cubecam_width = 500
local cubecam_height = 500
local cubecam_v = 1 / 32
local cubecam_lock_ticks = 30
local cubecam_default_zoom = 8
local lock_entity_types = make_set({"car", "tank", "character", "spider-vehicle", "locomotive", "cargo-wagon"})
local vehicle_entity_types = make_set({"car", "tank", "spider-vehicle", "locomotive", "cargo-wagon"})

local function player_state(player)
  local map = global.cubecam_player_state
  if not map then
    map = {}
    global.cubecam_player_state = map
  end
  local state = map[player.index]
  if not state then
    state = {}
    map[player.index] = state
  end
  return state
end

local zoom_map = {
  0.25,
  0.325,
  0.4,
  0.5,
  0.6,
  0.75,
  1,
  1.25,
  1.5,
  2,
  2.5,
  3,
  3.5,
  4,
}

local function cubecam_calculate_size(player, fullscreen)
  if fullscreen then
    local resolution = player.display_resolution
    local scale = player.display_scale
    return {resolution.width / scale, resolution.height / scale}
  else
    local scale_setting = player.mod_settings["cube-cubecam-scale"].value
    local display_scale = player.display_scale
    return {cubecam_width * display_scale * scale_setting, cubecam_height * display_scale * scale_setting}
  end
end

local function cubecam_open(player, fullscreen)
  local state = player_state(player)
  if state.main then
    return
  end

  local main = player.gui.screen.add {
    type = "frame",
    name = "cube-cubecam-frame",
    direction = "vertical",
  }
  local title = main.add {type = "flow"}
  if not fullscreen then
    title.drag_target = main
  end
  title.add {
    type = "label",
    style = "frame_title",
    caption = {"cube-gui.cubecam"},
    ignored_by_interaction = not fullscreen,
  }
  if fullscreen then
    title.add {
      type = "empty-widget",
      style = "cube_cubecam_pusher",
    }
  else
    title.add {
      type = "empty-widget",
      style = "cube_cubecam_drag_handle",
      ignored_by_interaction = true,
    }
  end
  title.add {
    type = "slider",
    name = "cube-cubecam-zoom",
    value = state.zoom or cubecam_default_zoom,
    minimum_value = 1,
    maximum_value = #zoom_map,
    style = "cube_cubecam_slider",
  }
  title.add {
    type = "sprite-button",
    name = "cube-cubecam-fullscreen",
    style = "cube_cubecam_fullscreen",
    toggled = fullscreen,
    sprite = "cube-fullscreen",
    hovered_sprite = "cube-fullscreen",
    clicked_sprite = "cube-fullscreen",
    tooltip = {"cube-gui.cubecam-fullscreen"},
  }
  title.add {
    type = "sprite-button",
    name = "cube-cubecam-close",
    style = "frame_action_button",
    sprite = "utility/close_white",
    hovered_sprite = "utility/close_white",
    clicked_sprite = "utility/close_white",
  }
  local content = main.add {
    type = "frame",
    style = "inside_shallow_frame",
  }
  local camera = content.add {
    type = "camera",
    name = "cube-cubecam-camera",
    style = "cube_cubecam_camera",
    surface_index = 1,
    position = {x = 0, y = 0},
  }

  local size = cubecam_calculate_size(player, fullscreen)

  main.style.size = size
  if fullscreen then
    main.auto_center = true
  else
    local resolution = player.display_resolution
    local display_scale = player.display_scale
    main.location = {resolution.width - size[1] * display_scale, resolution.height - size[2] * display_scale}
  end

  state.main = main
  state.content = content
  state.camera = camera
  state.fullscreen = fullscreen
end

local function cubecam_close(player)
  local state = player_state(player)
  if state.main then
    state.main.destroy()
    state.main = nil
    state.camera = nil
    state.minimap = nil
  end
end

function cubecam.toggle_open(player, fullscreen)
  local state = player_state(player)
  if state.main then
    if fullscreen then
      if state.fullscreen then
        cubecam_close(player)
        cubecam_open(player, false)
      else
        cubecam_close(player)
        cubecam_open(player, true)
      end
    else
      cubecam_close(player)
    end
  else
    cubecam_open(player, fullscreen)
  end
end

function cubecam.remove_player(player_index)
  local map = global.cubecam_player_state
  if map then
    map[player_index] = nil
  end
end

function cubecam.on_click(player, element)
  if element.name == "cube-cubecam-close" then
    cubecam_close(player)
  elseif element.name == "cube-cubecam-fullscreen" then
    local state = player_state(player)
    if state.fullscreen then
      cubecam_close(player)
      cubecam_open(player, false)
    else
      cubecam_close(player)
      cubecam_open(player, true)
    end
  end
end

function cubecam.on_value_changed(player, element)
  if element.name == "cube-cubecam-zoom" then
    local state = player_state(player)
    state.zoom = element.slider_value
  end
end

function cubecam.on_settings_changed(player, setting)
  if setting == "cube-cubecam-scale" or setting == "display-scale" then
    local state = player_state(player)
    if state.main then
      local fullscreen = state.fullscreen
      cubecam_close(player)
      cubecam_open(player, fullscreen)
    end
  end
end

function cubecam.update_position(x, y, z, e)
  global.cubecam_target_x = x
  global.cubecam_target_y = y
  if e and lock_entity_types[e.type] then
    global.cubecam_target_e = e
    if vehicle_entity_types[e.type] then
      z = z / (1 + math.abs(e.speed))
    end
  else
    global.cubecam_target_e = nil
  end
  global.cubecam_target_z = z
end

function cubecam.tick()
  local global = global
  local x = global.cubecam_x or 0
  local y = global.cubecam_y or 0
  local z = global.cubecam_z or 1
  local target_x = global.cubecam_target_x or 0
  local target_y = global.cubecam_target_y or 0
  local target_z = global.cubecam_target_z or 1
  local lock_x = global.cubecam_lock_x
  local lock_y = global.cubecam_lock_y
  local target_e = global.cubecam_target_e
  local target_lock = global.cubecam_target_lock or 0
  local has_target = target_e and target_e.valid

  if has_target then
    if target_lock < cubecam_lock_ticks then
      target_lock = target_lock + 1
    end
  else
    target_lock = 0
    if lock_x and lock_y then
      x = lock_x
      y = lock_y
      global.cubecam_lock_x = nil
      global.cubecam_lock_y = nil
    end
  end
  z = z + cubecam_v * (target_z - z)
  global.cubecam_z = z
  if target_lock < cubecam_lock_ticks then
    x = x + cubecam_v * (target_x - x)
    y = y + cubecam_v * (target_y - y)
    global.cubecam_x = x
    global.cubecam_y = y
  end
  if has_target then
    local position = target_e.position
    local lock_f = target_lock / cubecam_lock_ticks
    x = x + lock_f * (position.x - x)
    y = y + lock_f * (position.y - y)
    global.cubecam_lock_x = x
    global.cubecam_lock_y = y
  end
  global.cubecam_target_lock = target_lock
  local map = global.cubecam_player_state
  if map then
    for _, state in pairs(map) do
      local camera = state.camera
      local minimap = state.minimap
      local zoom = z * zoom_map[state.zoom or cubecam_default_zoom]
      if zoom < 0.35 and camera then
        camera.destroy()
        camera = nil
        minimap = state.content.add {
          type = "minimap",
          name = "cube-cubecam-camera",
          style = "cube_cubecam_minimap",
          surface_index = 1,
          position = {0, 0},
        }
        state.camera = nil
        state.minimap = minimap
      elseif zoom >= 0.35 and minimap then
        minimap.destroy()
        minimap = nil
        camera = state.content.add {
          type = "camera",
          name = "cube-cubecam-camera",
          style = "cube_cubecam_camera",
          surface_index = 1,
          position = {0, 0},
        }
        state.minimap = nil
        state.camera = camera
      end
      if camera then
        camera.position = {x, y}
        camera.zoom = zoom
      elseif minimap then
        minimap.position = {x, y}
        minimap.zoom = zoom * 16
      end
    end
  end
end

return cubecam