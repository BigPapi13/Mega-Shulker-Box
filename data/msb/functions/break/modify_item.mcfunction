#Callers:
# -msb:break/copy

#Turns stick dropped by shulker into a furnace and puts new msb:block data storage into it

data merge entity @s {Item:{id:"minecraft:furnace",tag:{msb.shulker:1b,BlockEntityTag:{Items:[{Slot:0b,id:"minecraft:stick",Count:1b},{Slot:1b,id:"minecraft:stone_button",Count:1b,tag:{msb.delete_me:1b,display:{Name:'{"text":"nope"}'}}}],Lock:"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"}}}}
data remove entity @s Item.tag.msb
data remove storage msb:block data.blocked
data modify storage msb:block data.initialized set value 0b
data modify entity @s Item.tag.BlockEntityTag.Items[{Slot:0b}].tag.msb set from storage msb:block data