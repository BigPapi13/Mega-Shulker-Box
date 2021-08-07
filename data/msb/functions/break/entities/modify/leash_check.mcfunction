#Callers:
# -msb:break/entities/copy_mob

#Checks to see if the block an entity is leashed to is within the bounding box. If it is, get relative position and rotate it. If not, remove leash data and drop lead

execute store result score rotate.x msb.pos run data get storage msb:entity data.Leash.X
execute store result score rotate.y msb.pos run data get storage msb:entity data.Leash.Y
execute store result score rotate.z msb.pos run data get storage msb:entity data.Leash.Z

#Upper_x/y/z are pre-calculated, and this compares to see whether the coordinates are in the bounding box or not and runs the appropriate function
execute store success score in_bounding_box msb.return if score rotate.x msb.pos >= lower_x msb.pos if score rotate.x msb.pos <= upper_x msb.pos if score rotate.y msb.pos >= lower_y msb.pos if score rotate.y msb.pos <= upper_y msb.pos if score rotate.z msb.pos >= lower_z msb.pos if score rotate.z msb.pos <= upper_z msb.pos run function msb:break/entities/modify/leash
execute if score in_bounding_box msb.return matches 0 at @s run function msb:break/entities/modify/leash_cancel