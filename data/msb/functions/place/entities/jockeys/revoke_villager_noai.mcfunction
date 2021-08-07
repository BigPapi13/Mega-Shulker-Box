#Callers:
# -msb:place/entities/jockeys/revoke_villager_noai_schedule

#Desc: Removes NoAI from villagers and gets rid of their tag marking them to have their NoAI removed. Used for preventing villagers from losing their trades

data modify entity @s NoAI set value 0b
tag @s remove msb.revoke_noai