execute if block ~ ~ ~ minecraft:brick_stairs[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 2250
execute if block ~ ~ ~ minecraft:brick_stairs[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 2251
