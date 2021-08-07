#Callers:
# -msb:break/entities/modify/villager
# -msb:place/entities/modify/villager
# -msb:break/entities/modify/leash
# -msb:place/entities/modify/leash
# -msb:break/entities/modify/rotate_motion
# -msb:place/entities/modify/rotate_motion

#Inputs: rotate.x msb.pos, rotate.z msb.pos
#Outputs: rotate.x/z, rotated 180 degrees in the xz plane

scoreboard players operation rotate.x msb.pos *= #-1 msb.const
scoreboard players operation rotate.z msb.pos *= #-1 msb.const