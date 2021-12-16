#Callers:
# -msb:place/paste

#Desc: Selects how the individual blockstates of the structure will be rotated, based on the current and previous rotation
#The reason it is done like this instead of just handling the previous rotation during the copy process is to cut down on file count

execute if score adjusted msb.rotation matches 0 run function msb:place/loops/paste/east/south/up
execute if score adjusted msb.rotation matches 1 run function msb:place/loops/paste/east/west/up
execute if score adjusted msb.rotation matches 2 run function msb:place/loops/paste/east/north/up
execute if score adjusted msb.rotation matches 3 run function msb:place/loops/paste/east/east/up