#Callers:
# -msb:break/entities/jockeys/modify/villager_check

#Gets coordinates of workstation relative to the shulker and rotates them according to the shulker's rotation

#Subtract villager's position to get relative position
scoreboard players operation rotate.x msb.pos -= shulker_x msb.pos
scoreboard players operation rotate.y msb.pos -= shulker_y msb.pos
scoreboard players operation rotate.z msb.pos -= shulker_z msb.pos

#Apply rotation
execute if score temp msb.rotation matches 1 run function msb:calc/rotate/west
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/east

#Insert modified data back into storage
execute store result storage msb:entity current_list[0].Brain.memories."minecraft:job_site".value.pos[0] int 1 run scoreboard players get rotate.x msb.pos
execute store result storage msb:entity current_list[0].Brain.memories."minecraft:job_site".value.pos[1] int 1 run scoreboard players get rotate.y msb.pos
execute store result storage msb:entity current_list[0].Brain.memories."minecraft:job_site".value.pos[2] int 1 run scoreboard players get rotate.z msb.pos

#Add tag so pasting function knows to readjust the position of the job site
data modify storage msb:entity current_list[0].Tags append value "msb.rotate_job_site"

#Get the root vehicle's location relative to the shulker, and insert it into the villager's head item and rotate it
scoreboard players operation rotate.x msb.pos = self_x msb.pos
scoreboard players operation rotate.y msb.pos = self_y msb.pos
scoreboard players operation rotate.z msb.pos = self_z msb.pos

scoreboard players operation rotate.x msb.pos -= shulker_x msb.pos
scoreboard players operation rotate.y msb.pos -= shulker_y msb.pos
scoreboard players operation rotate.z msb.pos -= shulker_z msb.pos

#Apply rotation
execute if score temp msb.rotation matches 1 run function msb:calc/rotate/west
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/east

#Insert data into villager's head slot
data modify storage msb:entity temp.HeadItem set from storage msb:entity current_list[0].ArmorItems[3]
data modify storage msb:entity current_list[0].ArmorItems[3] set value {id:"minecraft:stone_button",Count:1b,tag:{msb:{}}}

execute store result storage msb:entity current_list[0].ArmorItems[3].tag.msb.x int 1 run scoreboard players get rotate.x msb.pos
execute store result storage msb:entity current_list[0].ArmorItems[3].tag.msb.y int 1 run scoreboard players get rotate.y msb.pos
execute store result storage msb:entity current_list[0].ArmorItems[3].tag.msb.z int 1 run scoreboard players get rotate.z msb.pos

data modify storage msb:entity current_list[0].ArmorItems[3].tag.msb.HeadItem set from storage msb:entity temp.HeadItem