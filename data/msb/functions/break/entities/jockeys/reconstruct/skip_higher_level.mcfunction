#Callers:
# -msb:break/entities/jockeys/reconstruct/current_mob

#Desc: Skips over all entities that aren't supposed to have any passengers

function msb:break/entities/jockeys/reconstruct/cycle_higher_level
execute if data storage msb:entity level_list[1][0].msb_nochildren run function msb:break/entities/jockeys/reconstruct/skip_higher_level