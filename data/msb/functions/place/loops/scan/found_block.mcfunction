#Callers:
# -msb:place/scan/z

#The block setup may need to be reorganized to support modularity. This will have to suffice for now

#Summon uninitialized armor stand, used to track and display block
summon armor_stand ~ ~ ~ {Tags:["msb.shulker","msb.init","msb.nocopy"],Marker:1b,Invisible:1b}

#Summon area effect cloud to run the paste function
summon area_effect_cloud ~ ~ ~ {Tags:["msb.paste"]}

#Store all structure data into storage for easier access
data modify storage msb:block data set from block ~ ~ ~ Items[{Slot:0b}].tag.msb

#Store rotation of block - DONT FORGET TO PUT THIS INTO THE ARMOR STAND LATER
execute if block ~ ~ ~ minecraft:furnace[facing=north] run scoreboard players set temp msb.rotation 0
execute if block ~ ~ ~ minecraft:furnace[facing=east] run scoreboard players set temp msb.rotation 1
execute if block ~ ~ ~ minecraft:furnace[facing=south] run scoreboard players set temp msb.rotation 2
execute if block ~ ~ ~ minecraft:furnace[facing=west] run scoreboard players set temp msb.rotation 3

scoreboard players set x msb.vol 0
scoreboard players set y msb.vol 0
scoreboard players set z msb.vol 0
