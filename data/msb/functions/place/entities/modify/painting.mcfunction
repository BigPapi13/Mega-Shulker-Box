#Callers:
# -msb:search/entities/paste/l0/<unknown> - Auto-generated function that corresponds to painting in search tree

#Places painting with proper initial Facing value - Trying to modify this after spawning causes it to jump, so this alternative method is necessary

#Get facing value
execute store result score painting msb.rotation run data get storage msb:block data.entities.nbts[0].Facing

#Apply rotation
scoreboard players operation painting msb.rotation += temp msb.rotation
scoreboard players operation painting msb.rotation %= #4 msb.const

#Put painting type into more accessible storage - Painting type can't be altered after summoning, so this must be brute-forced
data modify storage msb:entity painting set from storage msb:block data.entities.nbts[0].Motive

#Brute-forces all the painting types for each rotation
execute if score painting msb.rotation matches 0 run function msb:place/entities/modify/painting_types/south
execute if score painting msb.rotation matches 1 run function msb:place/entities/modify/painting_types/west
execute if score painting msb.rotation matches 2 run function msb:place/entities/modify/painting_types/north
execute if score painting msb.rotation matches 3 run function msb:place/entities/modify/painting_types/east

#I'm just running a makeshift initialization here because these things glitch out if you so much as glance at their nbt
data modify entity @e[type=painting,tag=msb.search_init,limit=1] Tags set from storage msb:block data.entities.nbts[0].Tags
tag @e[type=painting,tag=msb.search_init] remove msb.search_init