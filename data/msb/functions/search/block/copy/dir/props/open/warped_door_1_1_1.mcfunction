execute if block ~ ~ ~ minecraft:warped_door[open=true] run data modify storage msb:block data.blocks.ids append value 4380
execute if block ~ ~ ~ minecraft:warped_door[open=false] run data modify storage msb:block data.blocks.ids append value 4381
