#Callers:
# -msb:search/entities/paste/l0/<unknown> - Auto-generated function that corresponds to villager in search tree

#Checks to see if the villager's job site needs to be adjusted with the shulker box. If so, run the function to modify it
execute if data storage msb:block data.entities.nbts[0].rotate_job_site run function msb:place/entities/modify/villager