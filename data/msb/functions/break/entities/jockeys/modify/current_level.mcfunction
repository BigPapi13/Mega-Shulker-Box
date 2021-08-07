#Callers:
# -msb:break/entities/jockeys/copy_jockey

#Desc: Iterates through the current 'layer' of passengers
#Layers are determined by distance from the root entity

###STEPS###
#2 Sub-loops that need to occur
#First loop:
#-Modify data
#-Append to current level
#-Append all children to next level
#Step into next level

#Set up ID for linking to all children. This is used when reconstructing the data from the modified pieces
#execute store result storage msb:entity current_list[0].parent_id int 1 run scoreboard players get #parent_link msb.id

#Add all children into the next list and link them to their parents
execute store result score #child_len msb.return if data storage msb:entity current_list[0].Passengers[]
execute if score #child_len msb.return matches 0 run data modify storage msb:entity current_list[0].msb_nochildren set value 1b
execute if score #child_len msb.return matches 1.. run function msb:break/entities/jockeys/modify/add_children

#Add a 'separator' of sorts that will be used during reconstruction to distinguish which children belong to which parents
execute if data storage msb:entity next_list[-1] run data modify storage msb:entity next_list[-1].separator set value 1b

scoreboard players add #parent_link msb.id 1

function msb:break/entities/jockeys/modify/apply_modifications

#Cycle list and continue loop
data modify storage msb:entity current_list append from storage msb:entity current_list[0]
data remove storage msb:entity current_list[0]
scoreboard players remove #passenger_len msb.return 1
execute if score #passenger_len msb.return matches 1.. run function msb:break/entities/jockeys/modify/current_level

execute if score #passenger_len msb.return matches 0 run function msb:break/entities/jockeys/modify/step_into_next_level