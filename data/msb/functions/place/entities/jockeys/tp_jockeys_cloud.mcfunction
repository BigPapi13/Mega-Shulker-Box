#Callers
# -msb:place/entities/jockeys/tp_jockeys_schedule

#TPs the area effect cloud that the jockey is riding downwards.
#For some reason this only works on certain mob types, whereas teleporting the entity itself is the only way to teleport others. Both are ran simultaneously to cover all cases, and there doesn't seem to be any collisions

execute store result score jockey_y msb.pos run data get entity @s Pos[1] 100
scoreboard players remove jockey_y msb.pos 300050
execute store result entity @s Pos[1] double 0.01 run scoreboard players operation jockey_y msb.pos -= jockey_y_shift msb.pos
scoreboard players add jockey_y_shift msb.pos 50000
data modify entity @s Air set value 1s
kill @s