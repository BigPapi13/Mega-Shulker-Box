#Callers:
# -msb:break/entities/jockeys/modify/current_level

#Desc: If there are any items in the next level, step into it and act upon them
#Also, add current level into list of levels

#Prepend current level into list of levels (used for reconstruction)
execute if data storage msb:entity current_list[] run data modify storage msb:entity level_list prepend from storage msb:entity current_list

#Set up context
data modify storage msb:entity current_list set from storage msb:entity next_list 
scoreboard players set #parent_link msb.id 0
data modify storage msb:entity next_list set value []
execute store result score #passenger_len msb.return if data storage msb:entity current_list[]

execute if score #passenger_len msb.return matches 1.. run function msb:break/entities/jockeys/modify/current_level