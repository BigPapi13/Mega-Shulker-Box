#Callers:
# -msb:place/entities/jockeys/tp_jockeys_schedule

#Desc: Updates the rotations of all passenger entities that were just spawned

execute store result score #passenger msb.rotation run data get entity @s Rotation[0] 512
execute if score temp msb.rotation matches 1 run scoreboard players add #passenger msb.rotation 46080
execute if score temp msb.rotation matches 2 run scoreboard players add #passenger msb.rotation 92160
execute if score temp msb.rotation matches 3 run scoreboard players remove #passenger msb.rotation 46080
execute store result entity @s Rotation[0] float 0.00195312 run scoreboard players get #passenger msb.rotation

execute as @s[tag=msb.rotate_job_site] run function msb:place/entities/jockeys/villager_passenger

tag @s remove msb.jockey_passenger