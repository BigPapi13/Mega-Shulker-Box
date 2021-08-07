#Callers
# -msb:break/entities/copy_mob

#Fixes an item frame glitch where they automatically face downwards for some reason

#Get item frame facing value
execute store result score item_frame msb.rotation run data get storage msb:entity data.Facing

#Adjust score so that the 4 directions follow in a more manageable clockwise pattern
execute if score item_frame msb.rotation matches 3 run scoreboard players set item_frame_corrected msb.rotation 0 
execute if score item_frame msb.rotation matches 4 run scoreboard players set item_frame_corrected msb.rotation 1 
execute if score item_frame msb.rotation matches 2 run scoreboard players set item_frame_corrected msb.rotation 2
execute if score item_frame msb.rotation matches 5 run scoreboard players set item_frame_corrected msb.rotation 3 

#Apply rotation
scoreboard players operation item_frame_corrected msb.rotation -= temp msb.rotation
scoreboard players operation item_frame_corrected msb.rotation %= #4 msb.const

#Re-translate back into item frame Facing values
execute if score item_frame_corrected msb.rotation matches 0 run data modify storage msb:entity data.Facing set value 3b
execute if score item_frame_corrected msb.rotation matches 1 run data modify storage msb:entity data.Facing set value 4b
execute if score item_frame_corrected msb.rotation matches 2 run data modify storage msb:entity data.Facing set value 2b
execute if score item_frame_corrected msb.rotation matches 3 run data modify storage msb:entity data.Facing set value 5b