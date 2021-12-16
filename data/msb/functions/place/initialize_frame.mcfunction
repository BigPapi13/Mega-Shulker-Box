#Callers
# -msb:place/init

tag @s remove msb.init
scoreboard players operation @s msb.rotation = temp msb.rotation
execute if score blocked msb.return matches 1 run tag @s add msb.blocked

#eventually put color stuff in here and whatnot