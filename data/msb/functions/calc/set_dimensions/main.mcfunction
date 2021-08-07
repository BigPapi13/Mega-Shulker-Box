#Callers:
# -msb:place/paste
# -msb:break/copy

#Inputs:
# -(storage) msb:block data

#Outputs:
# -Negative-most corner and dimensions, stored in corner_x/y/z msb.pos and x/y/z msb.vol

#Uses position and dimensions data to define the bottom-most corner and dimensions of the rectangular prism

#Shulker x, y, and z are used to store the position of the block itself
execute store result score shulker_x msb.pos run data get entity @s Pos[0]
execute store result score shulker_y msb.pos run data get entity @s Pos[1]
execute store result score shulker_z msb.pos run data get entity @s Pos[2]

#Corner x, y, and z are used to store the coordinates of the negative-most corner of the bounding box
scoreboard players operation corner_x msb.pos = shulker_x msb.pos
scoreboard players operation corner_y msb.pos = shulker_y msb.pos
scoreboard players operation corner_z msb.pos = shulker_z msb.pos

#Upper x, y, and z are used to store the coordinates of the positive-most corner of the bounding box - Used only for copying entities
scoreboard players operation upper_x msb.pos = shulker_x msb.pos
scoreboard players operation upper_y msb.pos = shulker_y msb.pos
scoreboard players operation upper_z msb.pos = shulker_z msb.pos

#Get negative-most corner's offset as a scoreboard
execute store result score minus_x msb.pos run data get storage msb:block data.minus[0]
execute store result score minus_y msb.pos run data get storage msb:block data.minus[1]
execute store result score minus_z msb.pos run data get storage msb:block data.minus[2]

#Calculate dimensions according to rotation
execute if score temp msb.rotation matches 0 run function msb:calc/set_dimensions/south
execute if score temp msb.rotation matches 1 run function msb:calc/set_dimensions/west
execute if score temp msb.rotation matches 2 run function msb:calc/set_dimensions/north
execute if score temp msb.rotation matches 3 run function msb:calc/set_dimensions/east

#Calculate actual dimensions. Scoreboards will be 1 less than actual dimensions,
#but it works out because of how the recursion is set up
execute store result score x msb.vol run data get storage msb:block data.plus[0]
execute store result score y msb.vol run data get storage msb:block data.plus[1]
execute store result score z msb.vol run data get storage msb:block data.plus[2]

scoreboard players operation plus_x msb.pos = x msb.vol
scoreboard players operation plus_y msb.pos = y msb.vol
scoreboard players operation plus_z msb.pos = z msb.vol

scoreboard players operation x msb.vol += minus_x msb.pos
scoreboard players operation y msb.vol += minus_y msb.pos
scoreboard players operation z msb.vol += minus_z msb.pos

execute store result entity @s Pos[0] double 1 run scoreboard players get corner_x msb.pos
execute store result entity @s Pos[1] double 1 run scoreboard players get corner_y msb.pos
execute store result entity @s Pos[2] double 1 run scoreboard players get corner_z msb.pos