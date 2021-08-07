execute if block ~ ~ ~ minecraft:stone_stairs[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 4006
execute if block ~ ~ ~ minecraft:stone_stairs[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 4007
