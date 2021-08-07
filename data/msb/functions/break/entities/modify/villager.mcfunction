#Callers:
# -msb:break/entities/modify/villager_check

#Gets coordinates of workstation relative to the shulker and rotates them according to the shulker's rotation

#Subtract shulker's position to get relative position
scoreboard players operation rotate.x msb.pos -= shulker_x msb.pos
scoreboard players operation rotate.y msb.pos -= shulker_y msb.pos
scoreboard players operation rotate.z msb.pos -= shulker_z msb.pos

#Apply rotation
execute if score temp msb.rotation matches 1 run function msb:calc/rotate/west
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/east

#Insert modified data back into storage
execute store result storage msb:entity data.Brain.memories."minecraft:job_site".value.pos[0] int 1 run scoreboard players get rotate.x msb.pos
execute store result storage msb:entity data.Brain.memories."minecraft:job_site".value.pos[1] int 1 run scoreboard players get rotate.y msb.pos
execute store result storage msb:entity data.Brain.memories."minecraft:job_site".value.pos[2] int 1 run scoreboard players get rotate.z msb.pos

#Add tag so pasting function knows to readjust the position of the job site
data modify storage msb:entity data.rotate_job_site set value 1b