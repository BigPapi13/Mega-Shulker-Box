#Callers:
# -msb:break/copy

#Inputs: lower_x, y, and z msb.pos, upper_x, y, and z msb.pos, entity executing

#Parent to the jockey copying function - Checks to make sure the bottom-most entity executing is within the bounding box of the mega shulker (based on feet)

#Get own coordinates for comparison
execute store result score self_x msb.pos run data get entity @s Pos[0]
execute store result score self_y msb.pos run data get entity @s Pos[1]
execute store result score self_z msb.pos run data get entity @s Pos[2]

#If the coordinates are within the bounding box, copy the mob
execute if score self_x msb.pos >= lower_x msb.pos if score self_x msb.pos <= upper_x msb.pos if score self_y msb.pos >= lower_y msb.pos if score self_y msb.pos <= upper_y msb.pos if score self_z msb.pos >= lower_z msb.pos if score self_z msb.pos <= upper_z msb.pos run function msb:break/entities/jockeys/copy_jockey