#Callers:
# -msb:place/entities/jockeys/paste_loops/<south|west|north|east>

#Aligns the spawner minecart based off of the scoreboards already calculated, and sets up data values

#Insert entity data into spawner - It rides an area effect cloud so no spawning limitations are applied (i.e. mooshrooms need mycelium to spawn)
data modify entity @s SpawnData set value {id:"minecraft:area_effect_cloud",Tags:["msb.jockey_positioner"],Pos:[]}
data modify entity @s SpawnData.Passengers append from storage msb:block data.entities.jockeys[0]

#Get position data into the spawner
execute store result storage msb:entity jockey_pos.x double 0.01 run scoreboard players operation mob_x msb.pos += block_x msb.pos
execute store result storage msb:entity jockey_pos.y double 0.01 run scoreboard players operation mob_y msb.pos += block_y msb.pos
execute store result storage msb:entity jockey_pos.z double 0.01 run scoreboard players operation mob_z msb.pos += block_z msb.pos

data modify entity @s SpawnData.Pos append from storage msb:entity jockey_pos.x
data modify entity @s SpawnData.Pos append from storage msb:entity jockey_pos.y
data modify entity @s SpawnData.Pos append from storage msb:entity jockey_pos.z

#Jockey base tag is for targeting the mob to teleport downwards the next tick - This is necessary for certain mob types like boats, but most can only be moved by teleporting the base area effect cloud
data modify entity @s SpawnData.Passengers[0].Tags append value "msb.jockey_base"
data remove entity @s SpawnData.Passengers[0].Passengers[0].UUID
execute if score temp msb.rotation matches 1 run data modify entity @s SpawnData.Passengers[0].Tags append value "msb.jockey_west"
execute if score temp msb.rotation matches 2 run data modify entity @s SpawnData.Passengers[0].Tags append value "msb.jockey_north"
execute if score temp msb.rotation matches 3 run data modify entity @s SpawnData.Passengers[0].Tags append value "msb.jockey_east"

tag @s remove msb.current