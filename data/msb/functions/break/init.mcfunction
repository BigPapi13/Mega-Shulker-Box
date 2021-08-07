#Callers
# -msb:main

#Clear out excess items dropped by shulker
kill @e[type=item,nbt={Item:{id:"minecraft:stone_button",tag:{msb.delete_me:1b}},Age:0s}]
kill @e[type=item,nbt={Item:{id:"minecraft:furnace"},PickupDelay:10s},limit=1,sort=nearest,distance=..2]

#Store rotation into fake player
scoreboard players operation temp msb.rotation = @s msb.rotation

summon area_effect_cloud ~ ~ ~ {Tags:["msb.break"]}

#Get current block data into storage
data modify storage msb:block data set from entity @e[type=item,nbt={Item:{id:"minecraft:stick",tag:{msb:{shulker:1b}}},Age:0s},limit=1,sort=nearest,distance=..2] Item.tag.msb

#Master for all the copying-related processes
execute unless entity @s[tag=msb.blocked] as @e[type=area_effect_cloud,tag=msb.break] at @s run function msb:break/copy

execute as @e[type=item,nbt={Item:{id:"minecraft:stick",tag:{msb:{shulker:1b}}},Age:0s},limit=1,sort=nearest,distance=..2] run function msb:break/modify_item

kill @s

#data merge entity @e[type=item,nbt={Item:{id:"minecraft:stick",tag:{msb:{shulker:1b}}}},limit=1,sort=nearest,distance=..2] {Item:{id:"minecraft:furnace",tag:{msb.shulker:1b,BlockEntityTag:{Items:[{Slot:0b,id:"minecraft:stick",Count:1b,tag:{msb:{shulker:1b,initialized:0b}}},{Slot:1b,id:"minecraft:stone_button",Count:1b,tag:{msb.delete_me:1b,display:{Name:'{"text":"nope"}'}}}],Lock:"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"}}},PickupDelay:10s}