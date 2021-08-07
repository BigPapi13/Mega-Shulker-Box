#Callers:
# -msb:break/entities/modify/leash_check

#Removes all leash data and drops a lead - Called if the leash knot is outside the shulker's bounding box
data remove storage msb:entity data.Leash
summon item ~ ~ ~ {PickupDelay:10,Item:{id:"minecraft:lead",Count:1b},Motion:[0.0d,0.2d,0.0d]}