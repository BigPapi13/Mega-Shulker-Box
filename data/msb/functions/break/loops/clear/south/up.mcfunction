#Callers:
# -msb:break/copy

#Executes in a cube (rectangular prism if you think you really care that much) making up the bounding box of the shulker
#Clears all the blocks if the shulker is facing south

scoreboard players remove shift_y msb.vol 1
scoreboard players operation shift_x msb.vol = x msb.vol
function msb:break/loops/clear/south/left
execute if score shift_y msb.vol matches 0.. positioned ~ ~1 ~ run function msb:break/loops/clear/south/up