#Callers:
# -msb:place/paste

#Set up scoreboard used as "anchor point"
scoreboard players operation block_x msb.pos = shulker_x msb.pos
scoreboard players operation block_y msb.pos = shulker_y msb.pos
scoreboard players operation block_z msb.pos = shulker_z msb.pos

scoreboard players operation block_x msb.pos *= #100 msb.const
scoreboard players operation block_y msb.pos *= #100 msb.const
scoreboard players operation block_z msb.pos *= #100 msb.const

scoreboard players add block_x msb.pos 50
scoreboard players add block_z msb.pos 50

#Paste jockeys
execute if score temp msb.rotation matches 0 run function msb:place/entities/jockeys/paste_loops/south
execute if score temp msb.rotation matches 1 run function msb:place/entities/jockeys/paste_loops/west
execute if score temp msb.rotation matches 2 run function msb:place/entities/jockeys/paste_loops/north
execute if score temp msb.rotation matches 3 run function msb:place/entities/jockeys/paste_loops/east

#All jockeys are spawned 3000 blocks above where they're supposed to spawn to prevent spawn blocking - this function tps them back down the next tick
schedule function msb:place/entities/jockeys/tp_jockeys_schedule 2t append

#All jockeys summoned have to be vertically separated. This function helps to manage the offset and keep it restricted to a per-tick basis
schedule function msb:place/entities/jockeys/refresh_y_shift 1t append