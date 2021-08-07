#Callers:
# -msb:place/entities/paste_loops/<south|west|north|east>

#Initializes entities just spawned from a mega shulker

tag @s remove msb.search_init

#Apply modifications to nbt data if necessary (some of this is done within the search tree to increase efficiency)
execute if data storage msb:block data.entities.nbts[0].rotate_leash run function msb:place/entities/modify/leash
function msb:place/entities/modify/rotate_motion

#Insert nbt data
data modify entity @s {} merge from storage msb:block data.entities.nbts[0]

#Rotate based on shulker's rotation
execute if score temp msb.rotation matches 1 at @s run tp @s ~ ~ ~ ~90 ~
execute if score temp msb.rotation matches 2 at @s run tp @s ~ ~ ~ ~180 ~
execute if score temp msb.rotation matches 3 at @s run tp @s ~ ~ ~ ~-90 ~