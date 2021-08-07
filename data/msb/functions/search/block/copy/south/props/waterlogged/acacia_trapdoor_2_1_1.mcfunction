execute if block ~ ~ ~ minecraft:acacia_trapdoor[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 2048
execute if block ~ ~ ~ minecraft:acacia_trapdoor[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 2049
