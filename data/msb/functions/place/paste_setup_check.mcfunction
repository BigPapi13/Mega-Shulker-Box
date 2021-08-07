#Description:
#Parent function for the paste function; runs scoreboard and position setup, and checks to see if the area is open
#If the area is open, the structure is pasted. Else, deployment is cancelled and failure cues are provided

#IMPORTANT: Please read the comments in the paste function for more detailed info on inputs, outputs, etc.

#Callers:
# -msb:place/init

#Calculates relevant figures like volume and corner, using current position and storage msb:block data
function msb:calc/set_dimensions/main

#Scan to make sure the area the shulker is to place in is open
scoreboard players operation shift_x msb.vol = x msb.vol
scoreboard players operation shift_y msb.vol = y msb.vol
scoreboard players operation shift_z msb.vol = z msb.vol

scoreboard players set blocked msb.return 0
execute if score temp msb.rotation matches 0 at @s run function msb:place/loops/check/south/up
execute if score temp msb.rotation matches 1 at @s run function msb:place/loops/check/west/up
execute if score temp msb.rotation matches 2 at @s run function msb:place/loops/check/north/up
execute if score temp msb.rotation matches 3 at @s run function msb:place/loops/check/east/up

#Runs if area is open -- Places blocks and creates relevant feedback
execute if score blocked msb.return matches 0 run function msb:place/paste

#Runs if there is a block in the way -- Tags armor stand AND block as blocked, provides relevant feedback
execute if score blocked msb.return matches 1 run function msb:place/blocked

#Initialize the block so it isn't targeted by future initialization processes
data modify storage msb:block data.initialized set value 1b

#Reinsert data into block with removed blockstates (maybe move this to parent function?)
data modify block ~ ~ ~ Items[{Slot:0b}].tag.msb set from storage msb:block data