#Callers:
# -msb:place/loops/paste/north/left

#This is the lowest level function of the paste loop. Per-block commands are run here.

scoreboard players remove shift_z msb.vol 1
#particle flame ~0.5 ~0.5 ~0.5
function msb:place/loops/paste/get_block
execute unless block ~ ~ ~ minecraft:furnace{Items:[{Slot:0b,id:"minecraft:stick",tag:{msb:{initialized:0b}}}]} run function msb:search/block/paste/north/paste
function msb:place/loops/paste/paste_block_data

execute if score shift_z msb.vol matches 0.. positioned ~ ~ ~-1 run function msb:place/loops/paste/north/forward