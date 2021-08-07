#Callers
# -msb:place/entities/jockeys/tp_jockeys_schedule

execute store result score jockey_y msb.pos run data get entity @s Pos[1] 100
scoreboard players remove jockey_y msb.pos 299948
execute store result entity @s Pos[1] double 0.01 run scoreboard players operation jockey_y msb.pos -= jockey_y_shift msb.pos
scoreboard players add jockey_y_shift msb.pos 50000
tag @s remove msb.jockey_base

#Rotate based on shulker's rotation
execute if entity @s[tag=msb.jockey_west] at @s run tp @s ~ ~ ~ ~90 ~
execute if entity @s[tag=msb.jockey_north] at @s run tp @s ~ ~ ~ ~180 ~
execute if entity @s[tag=msb.jockey_east] at @s run tp @s ~ ~ ~ ~-90 ~

tag @s remove msb.jockey_west
tag @s remove msb.jockey_north
tag @s remove msb.jockey_east