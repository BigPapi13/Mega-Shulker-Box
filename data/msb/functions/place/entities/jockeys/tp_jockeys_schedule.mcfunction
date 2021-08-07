#Callers:
# -msb:place/entities/jockeys/paste (schedule, 1t)

#Wrapper function for the tp_jockeys and tp_jockeys_cloud functions

#Resets the counter for the forced vertical separation. This separation is used to prevent boats from blocking minecart spawns
scoreboard players set jockey_y_shift msb.pos 0

#TPs the jockeys downwards. Some entity types rely on the cloud they are riding to be tp'd while others require the mob itself
execute as @e[type=area_effect_cloud,tag=msb.jockey_positioner,sort=arbitrary] at @s run function msb:place/entities/jockeys/tp_jockeys_cloud
scoreboard players set jockey_y_shift msb.pos 0
execute as @e[tag=msb.jockey_base,sort=arbitrary] at @s run function msb:place/entities/jockeys/tp_jockeys

#Update the rotations of the passenger entities
execute as @e[tag=msb.jockey_passenger,sort=arbitrary] run function msb:place/entities/jockeys/update_passengers

#Need to reset again because there aren't any ticking functions between now and the next possible placement, which is tied to advancements (order is tick > schedule > cmd blocks > advancements)
scoreboard players set jockey_y_shift msb.pos 0