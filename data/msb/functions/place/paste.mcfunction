#Inputs:
# -msb:block data (storage) - Contains all info for dimensions, blocks, settings
# -temp msb.rotation (score) - Rotation of the structure. Affects individual blockstates and how dimensions are implemented

#Outputs:
# -Generates structure at current location if successful
# -New msb:block data (storage), with emptied block and entity data upon success, unchanged upon failure

#Other: Should be executed by an area effect cloud with tag "msb.paste". No scoreboards attached to the
#       cloud should be necessary, but it should be aligned to the coordinate grid

#Callers:
# -msb:place/paste_setup_check

#Actually paste blocks

scoreboard players operation shift_x msb.vol = x msb.vol
scoreboard players operation shift_y msb.vol = y msb.vol
scoreboard players operation shift_z msb.vol = z msb.vol

execute if score temp msb.rotation matches 0 at @s run function msb:place/loops/paste/south/up
execute if score temp msb.rotation matches 1 at @s run function msb:place/loops/paste/west/up
execute if score temp msb.rotation matches 2 at @s run function msb:place/loops/paste/north/up
execute if score temp msb.rotation matches 3 at @s run function msb:place/loops/paste/east/up

#Paste mobs, if there are any
execute if data storage msb:block data.entities.ids[0] run function msb:place/entities/paste

#Paste jockeys, if there are any - These are done separately because jockeys can not be dynamically altered by traditional means, so a separate approach must be used
execute if data storage msb:block data.entities.jockeys[0] run function msb:place/entities/jockeys/paste