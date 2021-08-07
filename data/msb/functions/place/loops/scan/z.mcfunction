#Callers:
# -msb:place/loops/scan/x

#Scans through individual blocks in the z-axis to find an uninitialized shulker

execute if block ~ ~ ~ minecraft:furnace{Items:[{Slot:0b,tag:{msb:{shulker:1b,initialized:0b}},id:"minecraft:stick"}]} align xyz positioned ~0.5 ~0.5 ~0.5 run function msb:place/loops/scan/found_block
scoreboard players remove z msb.vol 1
execute if score z msb.vol matches 1.. positioned ~ ~ ~1 run function msb:place/loops/scan/z