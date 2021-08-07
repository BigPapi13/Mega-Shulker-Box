#Callers
# -msb:place/entities/jockeys/paste (schedule, 1t)

#This is to prevent a rare edge case in which shulker boxes are placed right next to each other in subsequent ticks and both have jockeys with boats whose hitboxes happen to overlap. I wish I was joking.

scoreboard players set jockey_y_shift msb.pos 0