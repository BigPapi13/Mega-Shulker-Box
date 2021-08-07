#Callers:
# -msb:place/loops/paste/east/up

#Checks in a square composed of the forward and left dimensions

scoreboard players remove shift_x msb.vol 1
scoreboard players operation shift_z msb.vol = z msb.vol
function msb:place/loops/paste/east/forward
execute if score shift_x msb.vol matches 0.. positioned ~ ~ ~-1 run function msb:place/loops/paste/east/left