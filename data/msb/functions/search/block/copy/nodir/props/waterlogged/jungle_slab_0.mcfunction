execute if block ~ ~ ~ minecraft:jungle_slab[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 512
execute if block ~ ~ ~ minecraft:jungle_slab[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 513
