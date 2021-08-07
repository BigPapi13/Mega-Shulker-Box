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

path = os.getcwd()

os.mkdir(path + "/l0")

file_cache = []
temp_cache = {}

id = 0
file_no = 0

for entity_num, entity in enumerate(entities):
  if (id % 2) == 0 and id != len(entities) - 1:
    file = open("l0/" + str(file_no) + ".json", "w")
    file.write("{\"values\":[\"" + entity + "\",")
  if (id % 2) == 1 and id == len(entities) - 2:
    file.write("\"" + entity + "\"," )
  if (id % 2) == 1 and id != len(entities) - 2 or id == len(entities) - 1:
    file.write("\"" + entity + "\"]}")
    file.close()
    temp_cache.update({"file_no":file_no})
    file_cache.append(temp_cache.copy())
    file_no += 1
  id += 1

lvl = 1
file_count = int((file_no + 1) / 2)

while file_count > 1:
  file_count = int((file_no + 1) / 2)
  new_cache = []
  os.mkdir(path + "/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0
  tag_no = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("l" + str(lvl) + "/" + str(file_no) + ".json", "w")
      file.write("{\"values\":[\"#msb:l" + str(lvl - 1) + "/" + str(tag_no) + "\",")
    if (even_tracker % 2) == 1 and index == len(file_cache) - 2:
      file.write("\"#msb:l" + str(lvl - 1) + "/" + str(tag_no) + "\",")
    if (even_tracker % 2) == 1 and index != len(file_cache) - 2 or index == len(file_cache) - 1:
      file.write("\"#msb:l" + str(lvl - 1) + "/" + str(tag_no) + "\"]}")
      file.close()
      temp_cache.update({"file_no":file_no})
      new_cache.append(temp_cache.copy())
      file_no += 1
    even_tracker += 1
    tag_no += 1
  lvl += 1
  if lvl > 35:
    file_count = 0
  file_cache = new_cache
