local util = require("util")

local function on_init()
  if not remote.interfaces.freeplay then
    return
  end
  game.print("Hypercube init")

  -- Set starting items.
  if remote.interfaces["freeplay"] then
    remote.call("freeplay", "set_disable_crashsite", true)
    remote.call("freeplay", "set_created_items", {})
    remote.call("freeplay", "set_respawn_items", {})
  end
end

script.on_init(on_init)
script.on_configuration_changed(on_init)
