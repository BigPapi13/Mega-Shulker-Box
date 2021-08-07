#Callers:
# -msb:place/paste

#Scans a volume to make sure it is an open space for deployment
#Inputs: x, y, and z msb.vol (dimensions)
#Outputs: blocked msb.return - 0 = area is open, 1 = blocks are in the way

scoreboard players remove shift_y msb.vol 1
scoreboard players operation shift_x msb.vol = x msb.vol
function msb:place/loops/check/west/left

execute if score shift_y msb.vol matches 0.. if score blocked msb.return matches 0 positioned ~ ~1 ~ run function msb:place/loops/check/west/up