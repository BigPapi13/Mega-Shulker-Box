#Callers:
# -msb:search/entities/paste/l0/<unknown> - Auto-generated function that corresponds to item frame in search tree

#Places item frame with proper initial Facing value - Trying to modify this after spawning causes it to jump, so this alternative method is necessary

#Get facing value
execute store result score item_frame msb.rotation run data get storage msb:block data.entities.nbts[0].Facing

#Adjust score so that the 4 directions follow in a more manageable clockwise pattern
execute if score item_frame msb.rotation matches 3 run scoreboard players set item_frame_corrected msb.rotation 0 
execute if score item_frame msb.rotation matches 4 run scoreboard players set item_frame_corrected msb.rotation 1 
execute if score item_frame msb.rotation matches 2 run scoreboard players set item_frame_corrected msb.rotation 2
execute if score item_frame msb.rotation matches 5 run scoreboard players set item_frame_corrected msb.rotation 3 

#Apply rotation
scoreboard players operation item_frame_corrected msb.rotation += temp msb.rotation
scoreboard players operation item_frame_corrected msb.rotation %= #4 msb.const

#Turn back into properly formatted value
execute if score item_frame_corrected msb.rotation matches 0 run scoreboard players set item_frame msb.rotation 3
execute if score item_frame_corrected msb.rotation matches 1 run scoreboard players set item_frame msb.rotation 4
execute if score item_frame_corrected msb.rotation matches 2 run scoreboard players set item_frame msb.rotation 2
execute if score item_frame_corrected msb.rotation matches 3 run scoreboard players set item_frame msb.rotation 5

#Fun brute-force method woo hoo
execute if score item_frame msb.rotation matches 0 run summon minecraft:item_frame ~ ~ ~ {Facing:0b,Tags:["msb.search_init"]}
execute if score item_frame msb.rotation matches 1 run summon minecraft:item_frame ~ ~ ~ {Facing:1b,Tags:["msb.search_init"]}
execute if score item_frame msb.rotation matches 2 run summon minecraft:item_frame ~ ~ ~ {Facing:2b,Tags:["msb.search_init"]}
execute if score item_frame msb.rotation matches 3 run summon minecraft:item_frame ~ ~ ~ {Facing:3b,Tags:["msb.search_init"]}
execute if score item_frame msb.rotation matches 4 run summon minecraft:item_frame ~ ~ ~ {Facing:4b,Tags:["msb.search_init"]}
execute if score item_frame msb.rotation matches 5 run summon minecraft:item_frame ~ ~ ~ {Facing:5b,Tags:["msb.search_init"]}

#Remove facing tag from data to be added since we added it ourselves
data remove storage msb:block data.entities.nbts[0].Facing
data remove storage msb:block data.entities.nbts[0].TileX
data remove storage msb:block data.entities.nbts[0].TileY
data remove storage msb:block data.entities.nbts[0].TileZ