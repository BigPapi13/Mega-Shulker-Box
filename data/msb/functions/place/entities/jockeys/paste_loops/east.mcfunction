#Callers:
# -msb:place/entities/jockeys/paste

#Loops through all mobs in the storage and pastes them in the correct spot with the correct data

#Minecart spawner is used to summon jockey (This is literally the only way to dynamically spawn stacks of mobs, Mojang why)
summon spawner_minecart ~ -100 ~ {Tags:["msb.jockey_spawn","msb.current"],SpawnCount:1,SpawnRange:0,Delay:0,MinSpawnDelay:0,MaxNearbyEntities:10,RequiredPlayerRange:3000000}

#Get position and move aec to position
execute store result score mob_x msb.pos run data get storage msb:block data.entities.jockey_pos.x[0]
execute store result score mob_y msb.pos run data get storage msb:block data.entities.jockey_pos.y[0]
execute store result score mob_z msb.pos run data get storage msb:block data.entities.jockey_pos.z[0]

#Shift the mob 3000 blocks above to ensure that the spawn isn't blocked
scoreboard players add mob_y msb.pos 300000

#This shifts each subsequent jockey 500 more blocks upwards. Entities that have a collider (boats, shulkers) block the spawner minecarts from spawning; if one of these entities is in the stack the whole stack is considered a collider and blocks spawns, so they must be vertically separated to prevent spawn blockage.
scoreboard players operation mob_y msb.pos += jockey_y_shift msb.pos
scoreboard players add jockey_y_shift msb.pos 50000

scoreboard players operation copy_mob_x msb.pos = mob_x msb.pos
scoreboard players operation copy_mob_z msb.pos = mob_z msb.pos

#The reason I use 'west' in the 'east' function is because east was originally intended for copying, and this is the opposite transformation.
#This function rotates the coordinates by 90 degrees counterclockwise
function msb:calc/entity_pos/west

execute as @e[type=spawner_minecart,limit=1,tag=msb.current] run function msb:place/entities/jockeys/spawner_setup

#Initialize entity
execute as @e[limit=1,tag=msb.search_init] at @s run function msb:place/entities/initialize_entity

#Remove data to move onto next item in list
data remove storage msb:block data.entities.jockeys[0]
data remove storage msb:block data.entities.jockey_pos.x[0]
data remove storage msb:block data.entities.jockey_pos.y[0]
data remove storage msb:block data.entities.jockey_pos.z[0]

#Repeat process until there are no more jockeys left
execute if data storage msb:block data.entities.jockeys[0] run function msb:place/entities/jockeys/paste_loops/east