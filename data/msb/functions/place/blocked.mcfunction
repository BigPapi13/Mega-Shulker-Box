#Callers:
# -msb:place/paste_setup_check

#Description:
#Tags the mega shulker box as blocked and gives visual and auditory feedback that the deployment was blocked
#Additional note: The armor stand is tagged from within the 'initialize stand' function so it does no additional target selectors are required

#The storage is eventually inserted into the block, so it's easier to do it this way
data modify storage msb:block data.blocked set value 1b