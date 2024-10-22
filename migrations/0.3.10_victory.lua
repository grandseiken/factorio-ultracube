if storage.cube_victory_state then
  if storage.cube_victory_state == "victorious" then
    game.set_game_state {
      game_finished = false,
      player_won = false,
    }
  end
  storage.cube_victory_state = nil
end