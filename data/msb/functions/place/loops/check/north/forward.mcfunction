#Callers:
# -msb:place/loop/check/north/left

#This is the lowest level function of the check loop. Per-block commands are run here.

scoreboard players remove shift_z msb.vol 1
execute store success score blocked msb.return unless block ~ ~ ~ #msb:open unless block ~ ~ ~ minecraft:furnace{Items:[{Slot:0b,tag:{msb:{initialized:0b}}}]}

execute if score shift_z msb.vol matches 0.. if score blocked msb.return matches 0 positioned ~ ~ ~-1 run function msb:place/loops/check/north/forward