execute if block ~ ~ ~ minecraft:spruce_slab[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 500
execute if block ~ ~ ~ minecraft:spruce_slab[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 501
