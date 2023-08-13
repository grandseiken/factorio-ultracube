
-- TODO: simhelper should let us run scripts in the menu simulation, but for some reason when using that
-- on_load() modifies the global table (even though it definitely doesn't). Need to try setting it all up
-- again?
if false then
  local main_menu_simulations = {}
  data.raw["utility-constants"]["default"].main_menu_simulations = main_menu_simulations
  main_menu_simulations.cubemenu = {
    checkboard = false,
    save = "__Ultracube__/cubemenu.zip",
    length = 60 * 30,
    init =
    [[
      local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
      game.camera_position = {logo.position.x, logo.position.y+9.75}
      game.camera_zoom = 1
      game.tick_paused = false
      game.surfaces.nauvis.daytime = 0
    ]],
    update =
    [[
      --
    ]]
  }
end