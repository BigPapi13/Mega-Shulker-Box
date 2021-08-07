#Callers:
# -msb:calc/boundary/main

scoreboard players operation lower_x msb.pos -= minus_z msb.pos
scoreboard players operation lower_y msb.pos -= minus_y msb.pos
scoreboard players operation lower_z msb.pos -= minus_x msb.pos

scoreboard players operation upper_x msb.pos += plus_z msb.pos
scoreboard players operation upper_y msb.pos += plus_y msb.pos
scoreboard players operation upper_z msb.pos += plus_x msb.pos
