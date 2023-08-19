local main_menu_simulations = {}
data.raw["utility-constants"]["default"].main_menu_simulations = main_menu_simulations

main_menu_simulations.cube_a = {
  checkboard = false,
  save = "__Ultracube__/menu_simulations/cube_a.zip",
  length = 60 * 90,
  init =
  [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
    game.camera_position = {logo.position.x, logo.position.y+9.75}
    game.camera_zoom = 1
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5
  ]],
  update =
  [[
    --
  ]]
}

main_menu_simulations.cube_b = {
  checkboard = false,
  save = "__Ultracube__/menu_simulations/cube_b.zip",
  length = 60 * 90,
  init =
  [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
    game.camera_position = {logo.position.x, logo.position.y+9.75}
    game.camera_zoom = 1
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.0
  ]],
  update =
  [[
    --
  ]]
}