#Callers:
# -msb:break/entities/jockeys/copy_jockey

#Desc: Loops through all 'levels' of the mob stack (level = distance from base), and connects the fragmented pieces back together

#Do a sub-loop through all mobs within the current level
execute store result score #level_mob_count msb.return if data storage msb:entity level_list[0][]
function msb:break/entities/jockeys/reconstruct/current_mob

#Continue loop if there are more levels remaining
scoreboard players remove #level_count msb.return 1
data remove storage msb:entity level_list[0]
execute if score #level_count msb.return matches 2.. run function msb:break/entities/jockeys/reconstruct/current_level