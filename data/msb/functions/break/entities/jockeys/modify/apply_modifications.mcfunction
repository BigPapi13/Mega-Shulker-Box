#Callers:
# -msb:break/entities/jockeys/modify/current_level

#Desc: All modifications applied to each individual mob within a mob stack

#Get rid of hardcoded UUID so duplicates can be freely made
data remove storage msb:entity current_list[0].UUID

#Get rotation to be relative to shulker rather than absolute
execute store result score #passenger msb.rotation run data get entity @s Rotation[0] 512
execute if score temp msb.rotation matches 1 run scoreboard players remove #passenger msb.rotation 46080
execute if score temp msb.rotation matches 2 run scoreboard players remove #passenger msb.rotation 92160
execute if score temp msb.rotation matches 3 run scoreboard players add #passenger msb.rotation 46080
execute store result storage msb:entity current_list[0].Rotation float 0.00195312 run scoreboard players get #passenger msb.rotation
data modify storage msb:entity current_list[0].Tags append value "msb.jockey_passenger"

#If the entity is a villager, modify their job site location
data modify storage msb:entity temp.id set from storage msb:entity current_list[0].id
execute if data storage msb:entity {temp:{id:"minecraft:villager"}} run function msb:break/entities/jockeys/modify/villager_check