#Callers:
# -msb:break/loops/copy/north/left

#This is the lowest level function of the copy loop. Per-block commands are run here.

scoreboard players remove shift_z msb.vol 1
execute if block ~ ~ ~ #msb:block_entity run function msb:break/loops/copy/get_block_data
function msb:search/block/copy/copy

execute if score shift_z msb.vol matches 0.. positioned ~ ~ ~-1 run function msb:break/loops/copy/north/forward