#Callers:
# -msb:entities/jockeys/reconstruct/current_mob
# -msb:entities/jockeys/reconstruct/skip_higher_level

#Desc: Cycles the next highest level in the level list

data modify storage msb:entity level_list[1] append from storage msb:entity level_list[1][0]
data remove storage msb:entity level_list[1][0]