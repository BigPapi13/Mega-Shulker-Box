#Callers:
# -msb:break/entities/modify/leash_check

#Gets coordinates of workstation relative to the shulker and rotates them according to the shulker's rotation

#Boolean to track whether leashes are present in the shulker's bounding box. When it is 1, a function is ran to clear out all leashes. This is purely cosmetic and prevents leashes from lingering around 
scoreboard players set is_leash msb.return 1

#Subtract shulker's position to get relative position
scoreboard players operation rotate.x msb.pos -= shulker_x msb.pos
scoreboard players operation rotate.y msb.pos -= shulker_y msb.pos
scoreboard players operation rotate.z msb.pos -= shulker_z msb.pos

#Apply rotation
execute if score temp msb.rotation matches 1 run function msb:calc/rotate/west
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/east

#Insert modified data back into storage
execute store result storage msb:entity data.Leash.X int 1 run scoreboard players get rotate.x msb.pos
execute store result storage msb:entity data.Leash.Y int 1 run scoreboard players get rotate.y msb.pos
execute store result storage msb:entity data.Leash.Z int 1 run scoreboard players get rotate.z msb.pos

#Add tag so pasting function knows to readjust the position of the job site
data modify storage msb:entity data.rotate_leash set value 1b