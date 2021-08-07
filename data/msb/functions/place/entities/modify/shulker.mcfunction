#Callers:
# -msb:search/entity/l0/<unkown> - Auto-generated function

#Desc: Modifies the shulker's "approximate position" to ensure that it doesn't teleport away as soon as it spawns

scoreboard players operation apx msb.pos = mob_x msb.pos
scoreboard players operation apy msb.pos = mob_y msb.pos
scoreboard players operation apz msb.pos = mob_z msb.pos

execute if score apx msb.pos matches ..-1 run scoreboard players remove apx msb.pos 100
execute if score apy msb.pos matches ..-1 run scoreboard players remove apy msb.pos 100
execute if score apz msb.pos matches ..-1 run scoreboard players remove apz msb.pos 100

execute store result storage msb:block data.entities.nbts[0].APX int 0.01 run scoreboard players get apx msb.pos
execute store result storage msb:block data.entities.nbts[0].APY int 0.01 run scoreboard players get apy msb.pos
execute store result storage msb:block data.entities.nbts[0].APZ int 0.01 run scoreboard players get apz msb.pos