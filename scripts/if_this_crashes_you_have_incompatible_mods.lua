return {
  crash = function(message)
    game.print("Ultracube error: unexpected state. This is almost certainly because you are using another incompatible mod.")
    game.print("First, try disabling other mods and see if the problem goes away. If you report this error, you must include your mod list.")
    game.print("The internal error was: " .. message)
    local intentional_crash = nil
    intentional_crash[0] = 0
  end
}