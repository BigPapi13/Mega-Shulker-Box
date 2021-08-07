#Callers:
# -msb:place/entities/initialize_entity

#Rotates the motion of an entity based on what direction the shulker is facing

#Get Motion
execute store result score rotate.x msb.pos run data get storage msb:block data.entities.nbts[0].Motion[0] 1000
execute store result score rotate.y msb.pos run data get storage msb:block data.entities.nbts[0].Motion[1] 1000
execute store result score rotate.z msb.pos run data get storage msb:block data.entities.nbts[0].Motion[2] 1000

#Rotate based on shulker
execute if score temp msb.rotation matches 1 run function msb:calc/rotate/east
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/west


#Store back into storage
execute store result storage msb:block data.entities.nbts[0].Motion[0] double 0.001 run scoreboard players get rotate.x msb.pos
execute store result storage msb:block data.entities.nbts[0].Motion[1] double 0.001 run scoreboard players get rotate.y msb.pos
execute store result storage msb:block data.entities.nbts[0].Motion[2] double 0.001 run scoreboard players get rotate.z msb.pos
