#Callers:
# -msb:place/init

#Scans through multiple x-z layers, moving along the y-axis

scoreboard players set x msb.vol 7
function msb:place/loops/scan/x
scoreboard players remove y msb.vol 1
execute if score y msb.vol matches 1.. positioned ~ ~1 ~ run function msb:place/loops/scan/y