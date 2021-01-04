# Factorio_Cluster_Analysis
A spacial point process analysis of the enemy spawners in Factorio. <br/>
Whilst playing factorio, I realised that it might be possible to apply the topological data analysis I was currently studying. <br/>
<br/>
Below is a screenshot of the Factorio map, displaying hundreds of enemy bases. <br/>

<img src="factorio_screenshot.png" alt="Factorio Screenshot" width="600"/>
<br/>
And then by using the programming language Lua, you can extract features from the game server in the in-game console. <br/>

```
 local string = "Index, X, Y" for k, spawner in pairs (game.surfaces[1].find_entities_filtered{type = "unit-spawner"})
    do string = string.."\n"..k..", "..spawner.position.x..", "..spawner.position.y
    end 
game.write_file("positions.csv", string)
```
