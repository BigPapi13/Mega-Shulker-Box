execute if block ~ ~ ~ minecraft:stone_brick_stairs[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 2254
execute if block ~ ~ ~ minecraft:stone_brick_stairs[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 2255
