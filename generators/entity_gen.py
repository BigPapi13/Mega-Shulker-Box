import os

#List of all entities to be included in the search tree -- modify this to add or remove entities
entities = [
    "minecraft:armor_stand",
    "minecraft:arrow",
    "minecraft:bat",
    "minecraft:bee",
    "minecraft:blaze",
    "minecraft:boat",
    "minecraft:cave_spider",
    "minecraft:chest_minecart",
    "minecraft:chicken",
    "minecraft:cod",
    "minecraft:command_block_minecart",
    "minecraft:cow",
    "minecraft:creeper",
    "minecraft:dolphin",
    "minecraft:donkey",
    "minecraft:dragon_fireball",
    "minecraft:drowned",
    "minecraft:elder_guardian",
    "minecraft:end_crystal",
    "minecraft:ender_pearl",
    "minecraft:enderman",
    "minecraft:endermite",
    "minecraft:evoker",
    "minecraft:falling_block",
    "minecraft:fireball",
    "minecraft:fox",
    "minecraft:furnace_minecart",
    "minecraft:ghast",
    "minecraft:giant",
    "minecraft:guardian",
    "minecraft:hoglin",
    "minecraft:hopper_minecart",
    "minecraft:horse",
    "minecraft:husk",
    "minecraft:illusioner",
    "minecraft:iron_golem",
    "minecraft:item_frame",
    "minecraft:llama",
    "minecraft:magma_cube",
    "minecraft:minecart",
    "minecraft:mooshroom",
    "minecraft:mule",
    "minecraft:ocelot",
    "minecraft:painting",
    "minecraft:panda",
    "minecraft:parrot",
    "minecraft:phantom",
    "minecraft:pig",
    "minecraft:piglin",
    "minecraft:piglin_brute",
    "minecraft:pillager",
    "minecraft:polar_bear",
    "minecraft:pufferfish",
    "minecraft:rabbit",
    "minecraft:ravager",
    "minecraft:salmon",
    "minecraft:sheep",
    "minecraft:shulker",
    "minecraft:silverfish",
    "minecraft:skeleton",
    "minecraft:skeleton_horse",
    "minecraft:slime",
    "minecraft:small_fireball",
    "minecraft:snow_golem",
    "minecraft:spawner_minecart",
    "minecraft:spider",
    "minecraft:squid",
    "minecraft:stray",
    "minecraft:strider",
    "minecraft:tnt",
    "minecraft:tnt_minecart",
    "minecraft:trader_llama",
    "minecraft:tropical_fish",
    "minecraft:turtle",
    "minecraft:vex",
    "minecraft:villager",
    "minecraft:vindicator",
    "minecraft:wandering_trader",
    "minecraft:witch",
    "minecraft:wither",
    "minecraft:wither_skeleton",
    "minecraft:wolf",
    "minecraft:zoglin",
    "minecraft:zombie",
    "minecraft:zombie_horse",
    "minecraft:zombie_villager",
    "minecraft:zombified_piglin"
]

special_case = ["minecraft:item_frame","minecraft:painting","minecraft:glow_item_frame"]

path = os.getcwd()
os.mkdir(path + "/copy")
os.mkdir(path + "/copy/l0")

os.mkdir(path + "/paste")
os.mkdir(path + "/paste/l0")

file_cache = []
temp_cache = {}

id = 0
file_no = 0

###COPY###

for entity_num, entity in enumerate(entities):
  if (id % 2) == 0 and id != len(entities) - 1:
    #Opens a new file -- conditions are set to do this in a way that items are grouped into twos, unless there are three items left. In this case, they are grouped into three
    file = open("copy/l0/" + str(file_no) + ".mcfunction", "w")
    temp_cache.update({"min":id})

  file.write("execute if entity @s[type=" + entity + "] run data modify storage msb:block data.entities.ids append value " + str(id) + "\n")

  if (id % 2) == 1 and id != len(entities) - 2 or id == len(entities) - 1:
    #Closes the file -- conditions are set for the same intent as the opening process
    file.close()
    temp_cache.update({"max":id})
    temp_cache.update({"file_no":file_no})
    file_cache.append(temp_cache.copy())
    file_no += 1
  id += 1

lvl = 1

file_count = int((file_no + 1) / 2)

while file_count > 1:
  file_count = int((file_no + 1) / 2)
  new_cache = []
  os.mkdir(path + "/copy/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0
  tag_no = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("copy/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":i["min"]})
    if file.closed == False:
      file.write("execute if entity @s[type=#msb:l" + str(lvl - 1) + "/" + str(tag_no) + "] run function msb:search/entity/copy/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
    if (even_tracker % 2) == 1 and index != len(file_cache) - 2 or index == len(file_cache) - 1:
      file.close()
      temp_cache.update({"max":i["max"]})
      temp_cache.update({"file_no":file_no})
      new_cache.append(temp_cache.copy())
      file_no += 1
    even_tracker += 1
    tag_no += 1
  lvl += 1
  if lvl > 35:
    file_count = 0
  file_cache = new_cache

###PASTE###

file_cache = []
temp_cache = {}

id = 0
file_no = 0

for entity_num, entity in enumerate(entities):
  if (id % 2) == 0 and id != len(entities) - 1:
    #Opens a new file -- conditions are set to do this in a way that items are grouped into twos, unless there are three items left. In this case, they are grouped into three
    file = open("paste/l0/" + str(file_no) + ".mcfunction", "w")
    temp_cache.update({"min":id})

  if entity not in special_case:
    file.write("execute if score entity msb.id matches " + str(id) + " run summon " + entity + " ~ ~ ~ {Tags:[\"msb.search_init\"]}\n")
  if entity == "minecraft:item_frame":
    file.write("execute if score entity msb.id matches " + str(id) + " run function msb:place/entities/modify/item_frame\n")
  if entity == "minecraft:painting":
    file.write("execute if score entity msb.id matches " + str(id) + " run function msb:place/entities/modify/painting\n")
  if entity == "minecraft:villager":
    file.write("execute if score entity msb.id matches " + str(id) + " run function msb:place/entities/modify/villager_check\n")
  if entity == "minecraft:fireball" or entity == "minecraft:small_fireball" or entity == "minecraft:dragon_fireball":
    file.write("execute if score entity msb.id matches " + str(id) + " run function msb:place/entities/modify/fireballs\n")
  if (id % 2) == 1 and id != len(entities) - 2 or id == len(entities) - 1:
    #Closes the file -- conditions are set for the same intent as the opening process
    file.close()
    temp_cache.update({"max":id})
    temp_cache.update({"file_no":file_no})
    file_cache.append(temp_cache.copy())
    file_no += 1
  id += 1

lvl = 1

file_count = int((file_no + 1) / 2)

while file_count > 1:
  file_count = int((file_no + 1) / 2)
  new_cache = []
  os.mkdir(path + "/paste/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("paste/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":i["min"]})
    if file.closed == False:
      file.write("execute if score entity msb.id matches " + str(i["min"]) + ".." + str(i["max"]) + " run function msb:search/entity/paste/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
    if (even_tracker % 2) == 1 and index != len(file_cache) - 2 or index == len(file_cache) - 1:
      file.close()
      temp_cache.update({"max":i["max"]})
      temp_cache.update({"file_no":file_no})
      new_cache.append(temp_cache.copy())
      file_no += 1
    even_tracker += 1
  lvl += 1
  if lvl > 35:
    file_count = 0
  file_cache = new_cache