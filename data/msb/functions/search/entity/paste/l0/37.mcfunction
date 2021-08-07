execute if score entity msb.id matches 74 run summon minecraft:vex ~ ~ ~ {Tags:["msb.search_init"]}
execute if score entity msb.id matches 75 run summon minecraft:villager ~ ~ ~ {Tags:["msb.search_init"]}
execute if score entity msb.id matches 75 run function msb:place/entities/modify/villager_check
