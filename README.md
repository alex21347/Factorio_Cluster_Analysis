# Factorio_Cluster_Analysis
A spacial point process analysis of the enemy spawners in Factorio. <br/>
Whilst playing factorio, I realised that it might be possible to apply the topological data analysis I was currently studying. <br/>
<br/>
Below is a screenshot of the Factorio map, displaying hundreds of enemy bases (in red). <br/>

<img src="factorio_screenshot.png" alt="Factorio Screenshot" width="500"/>
<br/>
And then by using the programming language Lua, you can extract features from the game server in the in-game console. <br/> 
So using the code below I was able to write all of the enemy base co-ordinates to the user data directory :) <br/>

<br/>

```
 local string = "Index, X, Y"
 for k, spawner in pairs (game.surfaces[1].find_entities_filtered{type = "unit-spawner"})
    do string = string.."\n"..k..", "..spawner.position.x..", "..spawner.position.y
 end 
 game.write_file("positions.csv", string)
```
<br/>
The extracted co-ordinates can be seen in the below figure
 <br/>
 <br/>
<img src="factorio_data_plot.png" alt="Factorio Screenshot" width="450"/>







