execute if block ~ ~ ~ minecraft:jungle_trapdoor[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 2004
execute if block ~ ~ ~ minecraft:jungle_trapdoor[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 2005
