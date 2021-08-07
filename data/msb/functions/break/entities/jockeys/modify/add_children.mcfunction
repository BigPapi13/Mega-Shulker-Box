#Callers:
# -msb:break/entities/jockeys/modify/current_level

#Desc: Links all children to their parents and adds them to the next list in the iteration

#Add linking id
#execute store result storage msb:entity current_list[0].Passengers[0].child_id int 1 run scoreboard players get #parent_link msb.id

#Append item to next list
data modify storage msb:entity next_list append from storage msb:entity current_list[0].Passengers[0]

#Continue loop until there are no child passengers left
data remove storage msb:entity current_list[0].Passengers[0]
scoreboard players remove #child_len msb.return 1
execute if score #child_len msb.return matches 1.. run function msb:break/entities/jockeys/modify/add_children