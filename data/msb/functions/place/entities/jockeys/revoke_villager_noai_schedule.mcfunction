#Callers:
# -msb:place/entities/jockeys/villager_passenger (schedule)

#Desc: Gets rid of the NoAI tag from any villagers that had it forced on them to preserve their trades

execute as @e[type=villager,tag=msb.revoke_noai] run function msb:place/entities/jockeys/revoke_villager_noai