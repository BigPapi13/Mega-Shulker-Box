#Callers:
# -msb:place/loops/scan/y

#Scans through multiple z-axis rows, moving along the x-axis

scoreboard players set z msb.vol 7
function msb:place/loops/scan/z
scoreboard players remove x msb.vol 1
execute if score x msb.vol matches 1.. positioned ~1 ~ ~ run function msb:place/loops/scan/x