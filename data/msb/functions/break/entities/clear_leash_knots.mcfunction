#Callers:
# -msb:break/copy

#The fact that this function exists is evidence of the fact that I'm a hopeless perfectionist who will probably never complete this
#Clears out leash knots in the area if there are any, just to make 'er look pretty

#Get own coordinates for comparison
execute store result score self_x msb.pos run data get entity @s Pos[0]
execute store result score self_y msb.pos run data get entity @s Pos[1]
execute store result score self_z msb.pos run data get entity @s Pos[2]

#If the coordinates are within the bounding box, commite sewer slide
execute if score self_x msb.pos >= lower_x msb.pos if score self_x msb.pos <= upper_x msb.pos if score self_y msb.pos >= lower_y msb.pos if score self_y msb.pos <= upper_y msb.pos if score self_z msb.pos >= lower_z msb.pos if score self_z msb.pos <= upper_z msb.pos run kill @s