local init_script =
[[
  local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
  game.simulation.camera_position = {logo.position.x, logo.position.y + 9.75}
  game.simulation.camera_zoom = 1
  game.tick_paused = false
  game.surfaces.nauvis.daytime = 0.5
]]
local empty_script = [[
  --
]]

local cube_0 = {
  checkboard = false,
  mods = {"Ultracube"},
  save = "__Ultracube__/menu_simulations/cube_0.zip",
  length = 60 * 108,
  init = init_script,
  update = empty_script,
}

local cube_a = {
  checkboard = false,
  mods = {"Ultracube"},
  save = "__Ultracube__/menu_simulations/cube_a.zip",
  length = 60 * 90,
  init = init_script,
  update = empty_script,
}

local cube_b = {
  checkboard = false,
  mods = {"Ultracube"},
  save = "__Ultracube__/menu_simulations/cube_b.zip",
  length = 60 * 90,
  init = init_script,
  update = empty_script,
}

local cube_c = {
  checkboard = false,
  mods = {"Ultracube"},
  save = "__Ultracube__/menu_simulations/cube_c.zip",
  length = 60 * 90,
  init = init_script,
  update = empty_script,
}

local cube_d = {
  checkboard = false,
  mods = {"Ultracube"},
  save = "__Ultracube__/menu_simulations/cube_d.zip",
  length = 60 * 90,
  init = init_script,
  update = empty_script,
}

data.raw["utility-constants"]["default"].main_menu_simulations = {
  cube_0 = cube_0,
  cube_a = cube_a,
  cube_b = cube_b,
  cube_c = cube_c,
  cube_d = cube_d,
}