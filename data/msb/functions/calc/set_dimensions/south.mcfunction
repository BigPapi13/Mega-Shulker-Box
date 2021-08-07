#Callers:
# -msb:place/set_dimensions/main

#Gets the negative-most corner of the shulker's bounding box

scoreboard players operation corner_x msb.pos -= minus_x msb.pos
scoreboard players operation corner_y msb.pos -= minus_y msb.pos
scoreboard players operation corner_z msb.pos -= minus_z msb.pos