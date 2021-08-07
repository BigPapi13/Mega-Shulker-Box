execute if block ~ ~ ~ minecraft:end_stone_brick_slab[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 901
execute if block ~ ~ ~ minecraft:end_stone_brick_slab[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 902
