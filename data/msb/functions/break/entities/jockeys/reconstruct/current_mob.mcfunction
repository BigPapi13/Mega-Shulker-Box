#Callers:
# -msb:break/entities/jockeys/reconstruct/current_level

#Desc: Loops through all mobs within a given level and inserts its data into the matching parent

#Insert mob into its matching parent in the next higher level
data modify storage msb:entity level_list[1][0].Passengers append from storage msb:entity level_list[0][0]
execute if data storage msb:entity level_list[0][0].separator run function msb:break/entities/jockeys/reconstruct/cycle_higher_level

#If the next mob in the higher level doesn't have any passengers, skip over it
execute if data storage msb:entity level_list[1][0].msb_nochildren run function msb:break/entities/jockeys/reconstruct/skip_higher_level

#Continue loop
scoreboard players remove #level_mob_count msb.return 1
data remove storage msb:entity level_list[0][0]
execute if score #level_mob_count msb.return matches 1.. run function msb:break/entities/jockeys/reconstruct/current_mob