#Callers:
# -msb:break/loops/copy/<south|west|north|east>/forward

#PATCH THIS UP LATER SO DATA COMMANDS DONT NEED TO BE RUN IF THERE ISNT A BLOCK ENTITY
execute store success score is_block_entity msb.return run data modify storage msb:block data.blocks.nbts append from block ~ ~ ~
execute if score is_block_entity msb.return matches 0 run data modify storage msb:block data.blocks.nbts append value {}