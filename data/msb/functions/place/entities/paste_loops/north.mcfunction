#Callers:
# -msb:place/entities/paste

#Loops through all mobs in the storage and pastes them in the correct spot with the correct data

#Get ID to feed into search tree
execute store result score entity msb.id run data get storage msb:block data.entities.ids[0]

#Get position and move aec to position
execute store result score mob_x msb.pos run data get storage msb:block data.entities.pos.x[0]
execute store result score mob_y msb.pos run data get storage msb:block data.entities.pos.y[0]
execute store result score mob_z msb.pos run data get storage msb:block data.entities.pos.z[0]

#This function rotates the coordinates by 180 degrees
function msb:calc/entity_pos/north

execute store result entity @s Pos[0] double 0.01 run scoreboard players operation mob_x msb.pos += block_x msb.pos
execute store result entity @s Pos[1] double 0.01 run scoreboard players operation mob_y msb.pos += block_y msb.pos
execute store result entity @s Pos[2] double 0.01 run scoreboard players operation mob_z msb.pos += block_z msb.pos

#Paste mob
execute at @s run function msb:search/entity/paste

#Initialize entity
execute as @e[limit=1,tag=msb.search_init] at @s run function msb:place/entities/initialize_entity

#Remove data to move onto next item in list
data remove storage msb:block data.entities.ids[0]
data remove storage msb:block data.entities.nbts[0]
data remove storage msb:block data.entities.pos.x[0]
data remove storage msb:block data.entities.pos.y[0]
data remove storage msb:block data.entities.pos.z[0]

#Repeat process until there are no more entities left
execute if data storage msb:block data.entities.ids[0] run function msb:place/entities/paste_loops/north