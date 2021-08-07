#Callers:
# -msb:break/loops/clear/west/left

#This is the lowest level function of the copy loop. Per-block commands are run here.

scoreboard players remove shift_z msb.vol 1
setblock ~ ~ ~ air

execute if score shift_z msb.vol matches 0.. positioned ~-1 ~ ~ run function msb:break/loops/clear/west/forward