import json
import os
import copy

#Convert blocks.json into a usable python object
f = open("blocks.json","r")
blocks = json.load(f)
f.close()

blocks_backup = copy.deepcopy(blocks)

path = os.getcwd()

os.mkdir(path + "/dir")
os.mkdir(path + "/no_dir")

os.mkdir(path + "/dir/l0")
os.mkdir(path + "/no_dir/l0")

def generate_states(block):
  global blocks_backup
  state_import = [{}]
  properties = blocks_backup[block]["properties"]
  for prop in properties:
    new_state_import = []
    for base_state in state_import:
      for value in properties[prop]:
        base_state.update({prop:value})
        new_state_import.append(base_state.copy())
    state_import = new_state_import
  final_state_import = []
  for b in state_import:
    final_state_import.append({"properties":b})
  return(final_state_import)

id = 0
file_no = 0

remove_sides = [
  "minecraft:oak_fence",
  "minecraft:spruce_fence",
  "minecraft:birch_fence",
  "minecraft:jungle_fence",
  "minecraft:acacia_fence",
  "minecraft:dark_oak_fence",
  "minecraft:nether_brick_fence",
  "minecraft:warped_fence",
  "minecraft:crimson_fence",
  "minecraft:iron_bars",
  "minecraft:cobblestone_wall",
  "minecraft:mossy_cobblestone_wall",
  "minecraft:stone_brick_wall",
  "minecraft:mossy_stone_brick_wall",
  "minecraft:andesite_wall",
  "minecraft:diorite_wall",
  "minecraft:granite_wall",
  "minecraft:sandstone_wall",
  "minecraft:red_sandstone_wall",
  "minecraft:brick_wall",
  "minecraft:prismarine_wall",
  "minecraft:nether_brick_wall",
  "minecraft:red_nether_brick_wall",
  "minecraft:end_stone_brick_wall",
  "minecraft:blackstone_wall",
  "minecraft:polished_blackstone_wall",
  "minecraft:polished_blackstone_brick_wall",
  "minecraft:glass_pane",
  "minecraft:white_stained_glass_pane",
  "minecraft:orange_stained_glass_pane",
  "minecraft:magenta_stained_glass_pane",
  "minecraft:light_blue_stained_glass_pane",
  "minecraft:yellow_stained_glass_pane",
  "minecraft:lime_stained_glass_pane",
  "minecraft:pink_stained_glass_pane",
  "minecraft:gray_stained_glass_pane",
  "minecraft:light_gray_stained_glass_pane",
  "minecraft:cyan_stained_glass_pane",
  "minecraft:purple_stained_glass_pane",
  "minecraft:blue_stained_glass_pane",
  "minecraft:brown_stained_glass_pane",
  "minecraft:green_stained_glass_pane",
  "minecraft:red_stained_glass_pane",
  "minecraft:black_stained_glass_pane"
]

removed_states = ['powered','triggered','occupied','extended','instrument','power','snowy']
remove_all_states = ['minecraft:fire','minecraft:redstone_wire']

print('Clearing unnecessary blockstates')

for current_block in blocks_backup.keys():
  if 'properties' in blocks_backup[current_block]:
      for prop in blocks_backup[current_block]['properties']:
        if current_block in remove_all_states:
          del(blocks[current_block]['properties'])
          break
        for val in removed_states:
          if prop == val:
            del(blocks[current_block]['properties'][prop])

        if current_block in remove_sides:
          if prop == 'east' or prop == 'west' or prop == 'north' or prop == 'south' or prop == 'up' or prop == 'down':
            del(blocks[current_block]['properties'][prop])

        if prop == 'shape' and "stairs" in current_block:
          del(blocks[current_block]['properties'][prop])

        if prop == 'lit' and current_block == 'minecraft:redstone_torch':
          del(blocks[current_block]['properties'][prop])


blocks_backup = copy.deepcopy(blocks)
blocks = {}

#This process both rearranges the properties into a more usable order, but also filters the directinoal from the non-directional
for current_block in blocks_backup.keys():
  blocks.update({current_block:{}})
  if "properties" in blocks_backup[current_block]:
    blocks[current_block].update({"properties":blocks_backup[current_block]["properties"]})
    blocks[current_block].update({"states":[]})
    blocks[current_block]["states"] = generate_states(current_block)

blocks_backup = copy.deepcopy(blocks)
blocks = {}
blocks_nodir = {}

dir_id_count = 0
nodir_id_count = 0

for current_block in blocks_backup.keys():
  if "north" in str(blocks_backup[current_block]) or "axis" in str(blocks_backup[current_block]) or "rotation" in str(blocks_backup[current_block]):
    blocks.update({current_block:blocks_backup[current_block]})
    dir_id_count += 1
  else:
    blocks_nodir.update({current_block:{}})
    nodir_id_count += 1

file_cache = []
temp_cache = {}

###DIRECTIONAL BLOCKS###

for block_num, x in enumerate(blocks):
  if (id % 2) == 0 and id != dir_id_count - 1:
    file = open("dir/l0/" + str(file_no) + ".json", "w")
    file.write("{\"values\":[\"" + x + "\",")
  if (id % 2) == 1 and id == dir_id_count - 2:
    file.write("\"" + x + "\"," )
  if (id % 2) == 1 and id != dir_id_count - 2 or id == dir_id_count - 1:
    file.write("\"" + x + "\"]}")
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
  os.mkdir(path + "/dir/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0
  tag_no = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("dir/l" + str(lvl) + "/" + str(file_no) + ".json", "w")
      file.write("{\"values\":[\"#msb:dir/l" + str(lvl - 1) + "/" + str(tag_no) + "\",")
    if (even_tracker % 2) == 1 and index == len(file_cache) - 2:
      file.write("\"#msb:dir/l" + str(lvl - 1) + "/" + str(tag_no) + "\",")
    if (even_tracker % 2) == 1 and index != len(file_cache) - 2 or index == len(file_cache) - 1:
      file.write("\"#msb:dir/l" + str(lvl - 1) + "/" + str(tag_no) + "\"]}")
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




###NON-DIRECTIONAL BLOCKS###

id = 0
file_no = 0

file_cache = []
temp_cache = {}

for block_num, x in enumerate(blocks_nodir):
  if (id % 2) == 0 and id != nodir_id_count - 1:
    file = open("no_dir/l0/" + str(file_no) + ".json", "w")
    file.write("{\"values\":[\"" + x + "\",")
  if (id % 2) == 1 and id == nodir_id_count - 2:
    file.write("\"" + x + "\"," )
  if (id % 2) == 1 and id != nodir_id_count - 2 or id == nodir_id_count - 1:
    file.write("\"" + x + "\"]}")
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
  os.mkdir(path + "/no_dir/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0
  tag_no = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("no_dir/l" + str(lvl) + "/" + str(file_no) + ".json", "w")
      file.write("{\"values\":[\"#msb:no_dir/l" + str(lvl - 1) + "/" + str(tag_no) + "\",")
    if (even_tracker % 2) == 1 and index == len(file_cache) - 2:
      file.write("\"#msb:no_dir/l" + str(lvl - 1) + "/" + str(tag_no) + "\",")
    if (even_tracker % 2) == 1 and index != len(file_cache) - 2 or index == len(file_cache) - 1:
      file.write("\"#msb:no_dir/l" + str(lvl - 1) + "/" + str(tag_no) + "\"]}")
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