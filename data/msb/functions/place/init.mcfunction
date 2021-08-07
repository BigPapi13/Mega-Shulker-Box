#Callers:
# -(advancement) place_shulker

#Locate uninitialized furnace (scan)
#Begin running paste functions at furnace

scoreboard players set x msb.vol 7
scoreboard players set y msb.vol 7
scoreboard players set z msb.vol 7

execute anchored eyes positioned ^ ^ ^3.5 positioned ~-3.5 ~-3.5 ~-3.5 run function msb:place/loops/scan/y

execute as @e[type=area_effect_cloud,tag=msb.paste] at @s run function msb:place/paste_setup_check

execute as @e[type=armor_stand,tag=msb.init] run function msb:place/initialize_stand

advancement revoke @s only msb:place_shulker