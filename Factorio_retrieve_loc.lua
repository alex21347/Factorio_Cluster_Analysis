 local string = "Index, X, Y"
 for k, spawner in pairs (game.surfaces[1].find_entities_filtered{type = "unit-spawner"})
    do string = string.."\n"..k..", "..spawner.position.x..", "..spawner.position.y
 end 
 game.write_file("positions.csv", string)