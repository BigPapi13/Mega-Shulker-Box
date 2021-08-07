#Callers
# -msb:break/entities/position_check

#Input: The mob executing the function
#Output: Numerical mob id and entity data into storage msb:block data, mob is deleted and relative position is stored

#Put data into storage to reduce target selectors and for ease of access
data modify storage msb:entity data set from entity @s

#Uses search tree to turn mob type into numerical ID
function msb:search/entity/copy

#Get relative position to shulker box and put in storage
function msb:calc/entity_pos/main

data modify storage msb:block data.entities.pos.x append from storage msb:entity pos.x
data modify storage msb:block data.entities.pos.y append from storage msb:entity pos.y
data modify storage msb:block data.entities.pos.z append from storage msb:entity pos.z

#Modify data
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
data modify storage msb:block data.entities.nbts append from storage msb:entity data

#Delete entity (shhhh don't tell anyone about this, your mobs are safely stored away and definitely not sent to the void only to be replaced by an identical clone)
tp @s ~ -100 ~
tag @s add msb.delete