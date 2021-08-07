#Callers:
# -msb:place/entities/initialize_entity

#Adjusts an entities leash position to be properly aligned with the position and rotation of the shulker box

#Grab leash coordinates and rotate them
execute store result score rotate.x msb.pos run data get storage msb:block data.entities.nbts[0].Leash.X
execute store result score rotate.y msb.pos run data get storage msb:block data.entities.nbts[0].Leash.Y
execute store result score rotate.z msb.pos run data get storage msb:block data.entities.nbts[0].Leash.Z

execute if score temp msb.rotation matches 1 run function msb:calc/rotate/east
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/west

#Add shulker box's scoreboard back into position (was set as a relative position prior)
scoreboard players operation rotate.x msb.pos += shulker_x msb.pos
scoreboard players operation rotate.y msb.pos += shulker_y msb.pos
scoreboard players operation rotate.z msb.pos += shulker_z msb.pos

#Store new coordinates into storage
execute store result storage msb:block data.entities.nbts[0].Leash.X int 1 run scoreboard players get rotate.x msb.pos
execute store result storage msb:block data.entities.nbts[0].Leash.Y int 1 run scoreboard players get rotate.y msb.pos
execute store result storage msb:block data.entities.nbts[0].Leash.Z int 1 run scoreboard players get rotate.z msb.pos

#This literally does nothing, but it's essentially future-proofing in the rare event that Mojang adds custom entity nbt tags
data remove storage msb:block data.entities.nbts[0].rotate_leash