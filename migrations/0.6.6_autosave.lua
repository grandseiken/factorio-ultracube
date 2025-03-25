ziggurat = game.surfaces[1].find_entities_filtered{name = "cube-forbidden-ziggurat"}[1]

if ziggurat and ziggurat.valid and ziggurat.products_finished >= 1 then
    storage.has_autosaved_helvetica = true
end