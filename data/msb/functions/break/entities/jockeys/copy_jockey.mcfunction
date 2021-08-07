#Callers
# -msb:break/entities/jockeys/position_check

#Input: Mob executing the function - should be the bottom-most entity in a stack
#Output: All mob data (including passengers) and mob id (saved as string) are appended to storage msb:block data.entities.jockeys

#Put all entity data into temporary storage
data modify storage msb:entity data set from entity @s

#Insert mob id into storage with search tree, properly formatted for mob spawner
function msb:search/entity/get_id

#Get relative coordinates, rotated - Also rotates the mob itself
function msb:calc/entity_pos/main

data modify storage msb:block data.entities.jockey_pos.x append from storage msb:entity pos.x
data modify storage msb:block data.entities.jockey_pos.y append from storage msb:entity pos.y
data modify storage msb:block data.entities.jockey_pos.z append from storage msb:entity pos.z

#Use recursion to loop through all mobs in the stack and apply proper modifications, like removing UUID and adjusting villager job site location
execute store result score #passenger_len msb.return if data storage msb:entity data.Passengers[]
data modify storage msb:entity current_list set from storage msb:entity data.Passengers
scoreboard players set #parent_link msb.id 0
data modify storage msb:entity next_list set value []
data modify storage msb:entity level_list set value []
execute if score #passenger_len msb.return matches 1.. run function msb:break/entities/jockeys/modify/current_level

#Second part of previous process - after deconstructing and modifying each piece, but the pieces back together
execute store result score #level_count msb.return if data storage msb:entity level_list[]
execute if score #level_count msb.return matches 2.. run function msb:break/entities/jockeys/reconstruct/current_level
data modify storage msb:entity data.Passengers set from storage msb:entity level_list[0]

#Modify and add data into shulker storage - separated from other entities because jockeys are spawned much differently
data modify storage msb:entity data.Rotation set from entity @s Rotation
data remove storage msb:entity data.Pos
data remove storage msb:entity data.UUID
execute if entity @s[type=villager] run function msb:break/entities/modify/villager_check
scoreboard players set is_leash msb.return 0
execute if data entity @s Leash run function msb:break/entities/modify/leash_check
execute if entity @s[type=item_frame] run function msb:break/entities/modify/item_frame
execute if entity @s[type=painting] run function msb:break/entities/modify/painting
execute if entity @s[type=#msb:fireballs] run function msb:break/entities/modify/fireballs
function msb:break/entities/modify/rotate_motion
data modify storage msb:block data.entities.jockeys append from storage msb:entity data

#Delete entity
tp @s ~ -100 ~
tag @s add msb.delete
