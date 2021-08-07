execute if block ~ ~ ~ minecraft:brown_stained_glass_pane[waterlogged=true] run data modify storage msb:block data.blocks.ids append value 500
execute if block ~ ~ ~ minecraft:brown_stained_glass_pane[waterlogged=false] run data modify storage msb:block data.blocks.ids append value 501
