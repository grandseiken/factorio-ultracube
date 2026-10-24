-- If a ziggurat exists in the game world already, and has already finished crafting at least one recipe,
-- the player's cube is already either softlocked to be broken, or they've managed to successfully recover
-- it, so there's no need to autosave in worlds which meet this condition

ziggurat = game.surfaces[1].find_entities_filtered{name = "cube-forbidden-ziggurat"}[1]

if ziggurat and ziggurat.valid and ziggurat.products_finished >= 1 then
    storage.has_autosaved_helvetica = true
end