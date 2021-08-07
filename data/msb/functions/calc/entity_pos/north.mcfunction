#Callers:
# -msb:calc/entity_pos/main

#Rotates relative coordinates and orientation of entities

scoreboard players operation mob_x msb.pos *= #-1 msb.const
scoreboard players operation mob_z msb.pos *= #-1 msb.const

tp @s ~ ~ ~ ~180 ~