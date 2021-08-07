#Callers:
# -msb:place/paste

#Uses storage msb:block data.entities to loop through all entities and paste them

#Set up scoreboard used as "anchor point"
scoreboard players operation block_x msb.pos = shulker_x msb.pos
scoreboard players operation block_y msb.pos = shulker_y msb.pos
scoreboard players operation block_z msb.pos = shulker_z msb.pos

scoreboard players operation block_x msb.pos *= #100 msb.const
scoreboard players operation block_y msb.pos *= #100 msb.const
scoreboard players operation block_z msb.pos *= #100 msb.const

scoreboard players add block_x msb.pos 50
scoreboard players add block_z msb.pos 50

#Paste mobs - area effect cloud is to summon at the specific location because moving the mob after spawning causes a teleport animation
summon area_effect_cloud ~ ~ ~ {Tags:["msb.spawn_entities"]}
execute if score temp msb.rotation matches 0 as @e[type=area_effect_cloud,tag=msb.spawn_entities] run function msb:place/entities/paste_loops/south
execute if score temp msb.rotation matches 1 as @e[type=area_effect_cloud,tag=msb.spawn_entities] run function msb:place/entities/paste_loops/west
execute if score temp msb.rotation matches 2 as @e[type=area_effect_cloud,tag=msb.spawn_entities] run function msb:place/entities/paste_loops/north
execute if score temp msb.rotation matches 3 as @e[type=area_effect_cloud,tag=msb.spawn_entities] run function msb:place/entities/paste_loops/east

kill @e[type=area_effect_cloud,tag=msb.spawn_entities]