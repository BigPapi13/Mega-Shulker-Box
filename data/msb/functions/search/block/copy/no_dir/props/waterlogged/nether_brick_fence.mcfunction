execute if block ~ ~ ~ minecraft:nether_brick_fence[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 380
execute if block ~ ~ ~ minecraft:nether_brick_fence[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 381
