#Callers:
# -msb:break/entities/copy_mob

#Rotates the power value of a fireball based on the rotation of the shulker

#Get power
execute store result score rotate.x msb.pos run data get storage msb:entity data.power[0] 1000
execute store result score rotate.z msb.pos run data get storage msb:entity data.power[2] 1000

#Apply rotation
execute if score temp msb.rotation matches 1 run function msb:calc/rotate/west
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/east

#Store back into data
execute store result storage msb:entity data.power[0] double 0.001 run scoreboard players get rotate.x msb.pos
execute store result storage msb:entity data.power[2] double 0.001 run scoreboard players get rotate.z msb.pos