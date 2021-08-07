#Callers:
# -msb:search/entity/l0/<unkown> - Auto-generated function

#Rotates the 'power' value of a fireball, which is basically its motion, based on the shulker's rotation

#Get Power
execute store result score rotate.x msb.pos run data get storage msb:block data.entities.nbts[0].power[0] 1000
execute store result score rotate.y msb.pos run data get storage msb:block data.entities.nbts[0].power[1] 1000
execute store result score rotate.z msb.pos run data get storage msb:block data.entities.nbts[0].power[2] 1000

#Rotate based on shulker
execute if score temp msb.rotation matches 1 run function msb:calc/rotate/east
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/west

#Store back into storage
execute store result storage msb:block data.entities.nbts[0].power[0] double 0.001 run scoreboard players get rotate.x msb.pos
execute store result storage msb:block data.entities.nbts[0].power[1] double 0.001 run scoreboard players get rotate.y msb.pos
execute store result storage msb:block data.entities.nbts[0].power[2] double 0.001 run scoreboard players get rotate.z msb.pos