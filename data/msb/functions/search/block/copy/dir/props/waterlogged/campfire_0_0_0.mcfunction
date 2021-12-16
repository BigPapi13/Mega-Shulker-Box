execute if block ~ ~ ~ minecraft:campfire[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 4094
execute if block ~ ~ ~ minecraft:campfire[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 4095
