say Loaded!

#Scoreboards

#Used to limit dimensions for ongoing 3d recursive processes
scoreboard objectives add msb.vol dummy

#Rotation scoreboard - used for rotating block upon placement
scoreboard objectives add msb.rotation dummy

#Used for coords
scoreboard objectives add msb.pos dummy

#Used for block and entity ids, stored in the shulker
scoreboard objectives add msb.id dummy

#Used when a command needs to return a value
scoreboard objectives add msb.return dummy

#Important constants for calculations
scoreboard objectives add msb.const dummy
scoreboard players set #-1 msb.const -1
scoreboard players set #4 msb.const 4
scoreboard players set #100 msb.const 100
scoreboard players set #500 msb.const 500