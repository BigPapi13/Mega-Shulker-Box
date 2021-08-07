#Callers:
# -msb:break/init

#Inputs:
# -(storage) msb:block data - primarily for dimensions and position
# -The structure being copied
# -temp msb.rotation

#Outputs:
# -(storage) msb:block data - modified with all block data stored inside

#Remove this tag so there isn't collisions when executing from child shulkers
tag @s remove msb.break
scoreboard players operation @s msb.rotation = temp msb.rotation

function msb:calc/set_dimensions/main

scoreboard players operation shift_x msb.vol = x msb.vol
scoreboard players operation shift_y msb.vol = y msb.vol
scoreboard players operation shift_z msb.vol = z msb.vol

#Run search tree through entire volume to add block ids to storage, rotated based on direction
execute if score temp msb.rotation matches 0 at @s run function msb:break/loops/copy/south/up
execute if score temp msb.rotation matches 1 at @s run function msb:break/loops/copy/west/up
execute if score temp msb.rotation matches 2 at @s run function msb:break/loops/copy/north/up
execute if score temp msb.rotation matches 3 at @s run function msb:break/loops/copy/east/up

#Copy all jockeys/stacks of mobs - This needs to be done before the rest of the mobs to prevent stacks from separating
function msb:calc/boundary/main
execute at @s as @e[type=#msb:allowed_entities,distance=..35,nbt={Passengers:[{}]},predicate=!msb:is_riding_entity] at @s run function msb:break/entities/jockeys/position_check

#Copy all mobs in the area
execute at @s as @e[type=#msb:allowed_entities,distance=..35,tag=!msb.nocopy,predicate=!msb:is_riding_entity] at @s run function msb:break/entities/position_check

#Clear out all leash_knots in the area if there were any found during the copying process
execute if score is_leash msb.return matches 1 at @s as @e[type=leash_knot,distance=..35] run function msb:break/entities/clear_leash_knots

#Schedule deletion for mobs that have been teleported in the void (for stuff that won't die instantly like withers)
schedule function msb:break/entities/delete_mobs 2t append

#Mark any items that exist prior to the clearing process. The clearing process sometimes leaves accidental drops that need to be cleared
tag @e[type=item] add msb.item_ignore
tag @e[type=experience_orb] add msb.xp_ignore

scoreboard players operation shift_x msb.vol = x msb.vol
scoreboard players operation shift_y msb.vol = y msb.vol
scoreboard players operation shift_z msb.vol = z msb.vol

#Clear out all blocks in the area. This needs to be separated from the copying because some blocks are dependent on others
execute if score temp msb.rotation matches 0 at @s run function msb:break/loops/clear/south/up
execute if score temp msb.rotation matches 1 at @s run function msb:break/loops/clear/west/up
execute if score temp msb.rotation matches 2 at @s run function msb:break/loops/clear/north/up
execute if score temp msb.rotation matches 3 at @s run function msb:break/loops/clear/east/up

#Clear out extra items and xp generated as a byproduct of clearing out blocks
kill @e[type=item,tag=!msb.item_ignore]
kill @e[type=experience_orb,tag=!msb.xp_ignore]

