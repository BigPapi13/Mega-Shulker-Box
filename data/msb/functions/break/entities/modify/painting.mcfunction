#Callers
# -msb:break/entities/copy_mob

#Fixes a painting glitch where Facing doesn't apply properly

#Get painting facing value
execute store result score painting msb.rotation run data get storage msb:entity data.Facing

#Apply rotation
scoreboard players operation painting msb.rotation -= temp msb.rotation
scoreboard players operation painting msb.rotation %= #4 msb.const

#Store back into storage
execute store result storage msb:entity data.Facing byte 1 run scoreboard players get painting msb.rotation