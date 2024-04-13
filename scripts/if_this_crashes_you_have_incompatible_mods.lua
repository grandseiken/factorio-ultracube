return {
  crash = function(message)
    crash_message = "Ultracube error: unexpected state. This is almost certainly because you are using another incompatible mod."
    crash_message = crash_message .. "\nFirst, try disabling other mods and see if the problem goes away. If you report this error, you must include your mod list."
    crash_message = crash_message .. "\nThe internal error was: " .. message
    error(crash_message)
  end
}