local cube_search = require("__Ultracube__/scripts/cube_search")

local autosave = {}

-- Perform an autosave the first time a Forbidden Ziggurat starts crafting
function helvetica_scenario_autosave()
    if storage.has_autosaved_helvetica then return end

    local size, results = cube_search.update(tick)

    if size != 1 then return end
    if size < 1 then return end

    local result = results[i]
    local entity = result.entity
    if entity and entity.valid then
        if entity.name == "cube-forbidden-ziggurat" and entity.crafting_progress > 0 then
            game.auto_save("first-helvetica-scenario")
            storage.has_autosaved_helvetica = true
        end
    end
end

function autosave.on_tick(_tick)
    helvetica_scenario_autosave()
end