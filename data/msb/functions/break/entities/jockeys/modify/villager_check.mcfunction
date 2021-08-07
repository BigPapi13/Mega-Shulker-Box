#Callers
# -msb:break/entities/jockeys/modify/apply_modifications

#Checks whether a villager's workstation is within the bounding box, and gets the position relative to the shulker (rotated) if it is.

execute store result score rotate.x msb.pos run data get storage msb:entity current_list[0].Brain.memories."minecraft:job_site".value.pos[0]
execute store result score rotate.y msb.pos run data get storage msb:entity current_list[0].Brain.memories."minecraft:job_site".value.pos[1]
execute store result score rotate.z msb.pos run data get storage msb:entity current_list[0].Brain.memories."minecraft:job_site".value.pos[2]

execute if score rotate.x msb.pos >= lower_x msb.pos if score rotate.x msb.pos <= upper_x msb.pos if score rotate.y msb.pos >= lower_y msb.pos if score rotate.y msb.pos <= upper_y msb.pos if score rotate.z msb.pos >= lower_z msb.pos if score rotate.z msb.pos <= upper_z msb.pos run function msb:break/entities/jockeys/modify/villager