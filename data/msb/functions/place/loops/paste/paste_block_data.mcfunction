#Callers:
# -msb:place/loops/paste/<south|west|north|east>/forward

data modify block ~ ~ ~ {} merge from storage msb:block data.blocks.nbts[0]
data remove storage msb:block data.blocks.nbts[0]