#Callers:
# -msb:place/loops/paste/south/left

#This is the lowest level function of the paste loop. Per-block commands are run here.

scoreboard players remove shift_z msb.vol 1
function msb:place/loops/paste/get_block
execute unless block ~ ~ ~ minecraft:furnace{Items:[{Slot:0b,id:"minecraft:stick",tag:{msb:{initialized:0b}}}]} run function msb:place/loops/paste/paste_block_north

execute if score shift_z msb.vol matches 0.. positioned ~1 ~ ~ run function msb:place/loops/paste/east/north/forward