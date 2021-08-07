#Callers:
# -msb:place/entities/modify/villager_check

#Adjusts and rotates a villager's job site upon placement. This is to prevent villagers who haven't been traded with from losing their jobs (and therefore trades) for no reason.

#Grab worksite coordinates and rotate them
execute store result score rotate.x msb.pos run data get storage msb:block data.entities.nbts[0].Brain.memories."minecraft:job_site".value.pos[0]
execute store result score rotate.y msb.pos run data get storage msb:block data.entities.nbts[0].Brain.memories."minecraft:job_site".value.pos[1]
execute store result score rotate.z msb.pos run data get storage msb:block data.entities.nbts[0].Brain.memories."minecraft:job_site".value.pos[2]

execute if score temp msb.rotation matches 1 run function msb:calc/rotate/east
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/west

#Add shulker box's scoreboard back into position (was set as a relative position prior)
scoreboard players operation rotate.x msb.pos += shulker_x msb.pos
scoreboard players operation rotate.y msb.pos += shulker_y msb.pos
scoreboard players operation rotate.z msb.pos += shulker_z msb.pos

#Store new coordinates into storage
execute store result storage msb:block data.entities.nbts[0].Brain.memories."minecraft:job_site".value.pos[0] int 1 run scoreboard players get rotate.x msb.pos
execute store result storage msb:block data.entities.nbts[0].Brain.memories."minecraft:job_site".value.pos[1] int 1 run scoreboard players get rotate.y msb.pos
execute store result storage msb:block data.entities.nbts[0].Brain.memories."minecraft:job_site".value.pos[2] int 1 run scoreboard players get rotate.z msb.pos

#This literally does nothing, but it's essentially future-proofing in the rare event that Mojang adds custom entity nbt tags
data remove storage msb:block data.entities.nbts[0].rotate_job_site