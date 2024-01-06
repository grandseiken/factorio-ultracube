local activation = require("__Ultracube__/scripts/activation")
local cube_search = require("__Ultracube__/scripts/cube_search")
local entity_cache = require("__Ultracube__/scripts/entity_cache")
local entity_combine = require("__Ultracube__/scripts/entity_combine")

activation.on_load()
entity_cache.on_load()
cube_search.on_load()

for _, surface in pairs(game.surfaces) do
  local positions = {}
  local reactors = surface.find_entities_filtered {
    name = {"cube-nuclear-reactor", "cube-nuclear-reactor-online"}
  }
  for _, reactor in ipairs(reactors) do
    local position = reactor.position
    local force = reactor.force
    local items = surface.find_entities_filtered {
      area = reactor.bounding_box,
      type = "item-entity",
    }
    for _, item in ipairs(items) do
      if item.stack.name == "cube-nuclear-reactor" then
        item.destroy()
      end
    end
    entity_cache.remove(reactor)
    cube_search.remove_entity(reactor)
    activation.remove_entity(reactor)
    reactor.destroy()
    local p_key = position.x .. "_" .. position.y
    if not positions[p_key] then
      local new_entity = surface.create_entity {
        name = "cube-nuclear-reactor",
        position = position,
        force = force,
        create_build_effect_smoke = false,
      }
      if new_entity then
        entity_cache.add(new_entity)
        entity_combine.created(new_entity)
      end
      positions[p_key] = true
    end
  end
end