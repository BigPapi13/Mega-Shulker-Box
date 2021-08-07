#Callers
# -msb:break/copy

#Gets the coordinates of the negative and positive-most corners of the shulker's bounding box, used for copying mobs
#Based on xyz, whereas set_dimensions functions are based on forwards/left/up

scoreboard players operation lower_x msb.pos = shulker_x msb.pos
scoreboard players operation lower_y msb.pos = shulker_y msb.pos
scoreboard players operation lower_z msb.pos = shulker_z msb.pos

scoreboard players operation upper_x msb.pos = shulker_x msb.pos
scoreboard players operation upper_y msb.pos = shulker_y msb.pos
scoreboard players operation upper_z msb.pos = shulker_z msb.pos

execute if score temp msb.rotation matches 0 run function msb:calc/boundary/south
execute if score temp msb.rotation matches 1 run function msb:calc/boundary/west
execute if score temp msb.rotation matches 2 run function msb:calc/boundary/north
execute if score temp msb.rotation matches 3 run function msb:calc/boundary/east
