#Callers
# -msb:break/entities/copy_mob
# -msb:break/entities/jockeys/copy_jockey

#Takes mob position and shulker_x, y and z to get relative position. Position is rotated based on rotation of shulker box
#Output: msb:entity pos.x/y/z (storage)

#Get mob position with higher precision than the self_ scores
execute store result score mob_x msb.pos run data get storage msb:entity data.Pos[0] 100
execute store result score mob_y msb.pos run data get storage msb:entity data.Pos[1] 100
execute store result score mob_z msb.pos run data get storage msb:entity data.Pos[2] 100

#Get equally scaled-up version of shulker_ scores (block_)
scoreboard players operation block_x msb.pos = shulker_x msb.pos
scoreboard players operation block_y msb.pos = shulker_y msb.pos
scoreboard players operation block_z msb.pos = shulker_z msb.pos

scoreboard players operation block_x msb.pos *= #100 msb.const
scoreboard players operation block_y msb.pos *= #100 msb.const
scoreboard players operation block_z msb.pos *= #100 msb.const

#Move to center of block to apply rotation about correct axis
scoreboard players add block_x msb.pos 50
scoreboard players add block_z msb.pos 50

#Get difference
scoreboard players operation mob_x msb.pos -= block_x msb.pos
scoreboard players operation mob_y msb.pos -= block_y msb.pos
scoreboard players operation mob_z msb.pos -= block_z msb.pos

scoreboard players operation copy_mob_x msb.pos = mob_x msb.pos
scoreboard players operation copy_mob_y msb.pos = mob_y msb.pos
scoreboard players operation copy_mob_z msb.pos = mob_z msb.pos

#Apply rotation (both of position and orientation) based on the shulker box - South is default, so no transformation is necessary
execute if score temp msb.rotation matches 1 run function msb:calc/entity_pos/west
execute if score temp msb.rotation matches 2 run function msb:calc/entity_pos/north
execute if score temp msb.rotation matches 3 run function msb:calc/entity_pos/east

#Put position into storage - Score needs to go in alternate storage to append
execute store result storage msb:entity pos.x int 1 run scoreboard players get mob_x msb.pos
execute store result storage msb:entity pos.y int 1 run scoreboard players get mob_y msb.pos
execute store result storage msb:entity pos.z int 1 run scoreboard players get mob_z msb.pos