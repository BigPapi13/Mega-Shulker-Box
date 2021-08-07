#Callers:
# -msb:place/entities/jockeys/update_passengers

#Desc: Rotates the job site of a villager that was just spawned and is riding an entity so he doesn't lose his trades
#WHy does this exist why can't things just work without me micromanaging every little detail

data modify storage msb:entity data set from entity @s

#Get shulker box's position using stored relative data
execute store result score rotate.x msb.pos run data get storage msb:entity data.ArmorItems[3].tag.msb.x
execute store result score rotate.y msb.pos run data get storage msb:entity data.ArmorItems[3].tag.msb.y
execute store result score rotate.z msb.pos run data get storage msb:entity data.ArmorItems[3].tag.msb.z

execute if score temp msb.rotation matches 1 run function msb:calc/rotate/east
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/west

execute store result score shulker_x msb.pos run data get storage msb:entity data.Pos[0]
execute store result score shulker_y msb.pos run data get storage msb:entity data.Pos[1]
execute store result score shulker_z msb.pos run data get storage msb:entity data.Pos[2]

scoreboard players operation shulker_x msb.pos -= rotate.x msb.pos
scoreboard players operation shulker_y msb.pos -= rotate.y msb.pos
scoreboard players operation shulker_z msb.pos -= rotate.z msb.pos

#Account for vertical adjustments
scoreboard players operation shulker_y msb.pos %= #500 msb.const

data modify entity @s ArmorItems[3] set from storage msb:entity data.ArmorItems[3].tag.msb.HeadItem

#Grab worksite coordinates and rotate them
execute store result score rotate.x msb.pos run data get storage msb:entity data.Brain.memories."minecraft:job_site".value.pos[0]
execute store result score rotate.y msb.pos run data get storage msb:entity data.Brain.memories."minecraft:job_site".value.pos[1]
execute store result score rotate.z msb.pos run data get storage msb:entity data.Brain.memories."minecraft:job_site".value.pos[2]

execute if score temp msb.rotation matches 1 run function msb:calc/rotate/east
execute if score temp msb.rotation matches 2 run function msb:calc/rotate/north
execute if score temp msb.rotation matches 3 run function msb:calc/rotate/west

#Add shulker box's scoreboard back into position (was set as a relative position prior)
scoreboard players operation rotate.x msb.pos += shulker_x msb.pos
scoreboard players operation rotate.y msb.pos += shulker_y msb.pos
scoreboard players operation rotate.z msb.pos += shulker_z msb.pos

#Store new coordinates into storage
execute store result storage msb:entity data.Brain.memories."minecraft:job_site".value.pos[0] int 1 run scoreboard players get rotate.x msb.pos
execute store result storage msb:entity data.Brain.memories."minecraft:job_site".value.pos[1] int 1 run scoreboard players get rotate.y msb.pos
execute store result storage msb:entity data.Brain.memories."minecraft:job_site".value.pos[2] int 1 run scoreboard players get rotate.z msb.pos

data modify entity @s Brain.memories."minecraft:job_site".value.pos set from storage msb:entity data.Brain.memories."minecraft:job_site".value.pos

execute unless data entity @s {NoAI:1b} run tag @s add msb.revoke_noai
data modify entity @s NoAI set value 1b

tag @s remove msb.update_job_site
schedule function msb:place/entities/jockeys/revoke_villager_noai_schedule 1t append