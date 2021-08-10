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
os.mkdir(path + "/dir/l0")
os.mkdir(path + "/dir/props")


os.mkdir(path + "/nodir")
os.mkdir(path + "/nodir/l0")
os.mkdir(path + "/nodir/props")

def rotate_right(command):
  command = command.replace("south","sssss").replace("west","wwwww").replace("north","nnnnn").replace("east","eeeee").replace("sssss","west").replace("wwwww","north").replace("nnnnn","east").replace("eeeee","south")
  command = command.replace("rotation=","jimmy_john").replace("jimmy_john10","rotation=14").replace("jimmy_john11","rotation=15").replace("jimmy_john12","rotation=0").replace("jimmy_john13","rotation=1").replace("jimmy_john14","rotation=2").replace("jimmy_john15","rotation=3").replace("jimmy_john0","rotation=4").replace("jimmy_john1","rotation=5").replace("jimmy_john2","rotation=6").replace("jimmy_john3","rotation=7").replace("jimmy_john4","rotation=8").replace("jimmy_john5","rotation=9").replace("jimmy_john6","rotation=10").replace("jimmy_john7","rotation=11").replace("jimmy_john8","rotation=12").replace("jimmy_john9","rotation=13")
  command = command.replace("axis=x","axisx").replace("axis=z","axisz").replace("axisx","axis=z").replace("axisz","axis=x")
  return(command)

def rotate_reverse(command):
  command = command.replace("south","sssss").replace("west","wwwww").replace("north","nnnnn").replace("east","eeeee").replace("sssss","north").replace("wwwww","east").replace("nnnnn","south").replace("eeeee","west")
  command = command.replace("rotation=","jimmy_john").replace("jimmy_john10","rotation=2").replace("jimmy_john11","rotation=3").replace("jimmy_john12","rotation=4").replace("jimmy_john13","rotation=5").replace("jimmy_john14","rotation=6").replace("jimmy_john15","rotation=7").replace("jimmy_john0","rotation=8").replace("jimmy_john1","rotation=9").replace("jimmy_john2","rotation=10").replace("jimmy_john3","rotation=11").replace("jimmy_john4","rotation=12").replace("jimmy_john5","rotation=13").replace("jimmy_john6","rotation=14").replace("jimmy_john7","rotation=15").replace("jimmy_john8","rotation=0").replace("jimmy_john9","rotation=1")
  return(command)

def rotate_left(command):
  command = command.replace("south","sssss").replace("west","wwwww").replace("north","nnnnn").replace("east","eeeee").replace("sssss","east").replace("wwwww","south").replace("nnnnn","west").replace("eeeee","north")
  command = command.replace("rotation=","jimmy_john").replace("jimmy_john10","rotation=6").replace("jimmy_john11","rotation=7").replace("jimmy_john12","rotation=8").replace("jimmy_john13","rotation=9").replace("jimmy_john14","rotation=10").replace("jimmy_john15","rotation=11").replace("jimmy_john0","rotation=12").replace("jimmy_john1","rotation=13").replace("jimmy_john2","rotation=14").replace("jimmy_john3","rotation=15").replace("jimmy_john4","rotation=0").replace("jimmy_john5","rotation=1").replace("jimmy_john6","rotation=2").replace("jimmy_john7","rotation=3").replace("jimmy_john8","rotation=4").replace("jimmy_john9","rotation=5")
  command = command.replace("axis=x","axisx").replace("axis=z","axisz").replace("axisx","axis=z").replace("axisz","axis=x")
  return(command)

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

def write_props(properties, block_name, direction):
  global id
  global x
  global blocks
  global nodir_id_count
  properties = sorted(properties.keys(), reverse = False)
  block_name = block_name.replace("minecraft:", "")

  file.write("execute if block ~ ~ ~ minecraft:" + block_name + " run function msb:search/block/copy/" + direction + "/props/" + properties[0] + "/" + block_name + "\n")
  suffixes = []
  final_prop = properties.pop(-1)
  if len(properties) == 0:
    suffixes = [""]
  #Setup for first layer
  if len(properties) != 0:
    if os.path.isdir(path + "/" + direction + "/props/" + properties[0]) == False:
      os.mkdir(path + "/" + direction + "/props/" + properties[0])
    prop_file = open(direction + "/props/" + properties[0] + "/" + block_name + ".mcfunction", "w")
    for suf_num, value in enumerate(blocks[x]["properties"][properties[0]]):
      text_first_half = "execute if block ~ ~ ~ minecraft:" + block_name + "[" + properties[0] + "=" + str(value)
      if direction == "west":
        text_first_half = rotate_right(text_first_half)
      if direction == "north":
        text_first_half = rotate_reverse(text_first_half)
      if direction == "east":
        text_first_half = rotate_left(text_first_half)
      if len(properties) > 1:
        prop_file.write(text_first_half + "] run function msb:search/block/copy/" + direction + "/props/" + properties[1] + "/" + block_name + "_" + str(suf_num) + "\n")            
      else:
        prop_file.write(text_first_half + "] run function msb:search/block/copy/" + direction + "/props/" + final_prop + "/" + block_name + "_" + str(suf_num) + "\n")
      suffixes.append("_" + str(suf_num))
    properties.pop(0)
    prop_file.close()

  new_suffixes = suffixes

  #Any layers before last
  if len(properties) != 0:
    for ind, prop in enumerate(properties):
      #print(new_suffixes)
      suffixes = new_suffixes
      new_suffixes = []
      for suffix in suffixes:
        if os.path.isdir(path + "/" + direction + "/props/" + prop) == False:
          os.mkdir(path + "/" + direction + "/props/" + prop)
        prop_file = open(direction + "/props/" + prop + "/" + block_name + suffix + ".mcfunction", "w")
        for num, value in enumerate(blocks[x]["properties"][prop]):
          text_first_half = "execute if block ~ ~ ~ minecraft:" + block_name + "[" + prop + "=" + str(value)
          if direction == "west":
            text_first_half = rotate_right(text_first_half)
          if direction == "north":
            text_first_half = rotate_reverse(text_first_half)
          if direction == "east":
            text_first_half = rotate_left(text_first_half)
          if ind != len(properties) - 1:
            prop_file.write(text_first_half + "] run function msb:search/block/copy/" + direction + "/props/" + properties[ind + 1] + "/" + block_name + suffix + "_" + str(num) + "\n")            
          else:
            prop_file.write(text_first_half + "] run function msb:search/block/copy/" + direction + "/props/" + final_prop + "/" + block_name + suffix + "_" + str(num)  + "\n")

          new_suffixes.append(suffix + "_" + str(num))
        prop_file.close()
  
  #if len(properties) == 0:
   #new_suffixes = [""]

  if os.path.isdir(path + "/" + direction + "/props/" + final_prop) == False:
    os.mkdir(path + "/" + direction + "/props/" + final_prop)
  #Final layer
  suffixes = new_suffixes
  for suffix in suffixes:
    prop_file = open(direction + "/props/" + final_prop + "/" + block_name + suffix + ".mcfunction", "w")
    for value in blocks[x]["properties"][final_prop]:
      text_first_half = "execute if block ~ ~ ~ minecraft:" + block_name + "[" + final_prop + "=" + str(value)
      if direction == "west":
        text_first_half = rotate_right(text_first_half)
      if direction == "north":
        text_first_half = rotate_reverse(text_first_half)
      if direction == "east":
        text_first_half = rotate_left(text_first_half)
      if direction == "dir":
        prop_file.write(text_first_half + "] run data modify storage msb:block data.blocks.ids append value " + str(id + nodir_id_count) + "\n")
      if direction == "nodir":
        prop_file.write(text_first_half + "] run data modify storage msb:block data.blocks.ids append value " + str(id) + "\n")
      id += 1
    

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

removed_states = ['powered','triggered','occupied','extended','instrument','power','snowy','distance']
remove_all_states = ['minecraft:fire','minecraft:redstone_wire']
  
#Modify blocks storage to get rid of unnecesary blockstates (Powered, directions on fences, etc.)

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
    dir_id_count += len(blocks_backup[current_block]["states"])
  else:
    if "properties" in blocks_backup[current_block]:
      blocks_nodir.update({current_block:blocks_backup[current_block]})
      nodir_id_count += len(blocks_backup[current_block]["states"])
    else:
      blocks_nodir.update({current_block:{}})
      nodir_id_count += 1

#####SOUTH#####

file_cache = []
temp_cache = {}
even_tracker = 0

for block_num, x in enumerate(blocks):
  #print(x)
  if ('properties' not in blocks[x]) or (len(blocks[x]["properties"]) == 0):
    if (even_tracker % 2) == 0 and block_num != len(blocks) - 1:
      file = open("dir/l0/" + str(file_no) + ".mcfunction", "w")
    file.write("execute if block ~ ~ ~ " + x + " run data modify storage msb:block data.blocks.ids append value " + str(id + nodir_id_count) + "\n")

    if (even_tracker % 2) == 1 and block_num != len(blocks) - 2 or block_num == len(blocks) - 1:
      file.close()
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
    id += 1
  else:
    if (even_tracker % 2) == 0 and block_num != len(blocks) - 1:
      file = open("dir/l0/" + str(file_no) + ".mcfunction", "w")

    #file.write("execute if block ~ ~ ~ " + x + " run function msb:search/block/copy/south/props/" + )
    write_props(blocks[x]["properties"], x, "dir")

    if (even_tracker % 2) == 1 and block_num != len(blocks) - 2 or block_num == len(blocks) - 1:
      file.close()
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
  even_tracker += 1


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
      file = open("dir/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
    if file.closed == False:
      file.write("execute if block ~ ~ ~ #msb:dir/l" + str(lvl - 1) + "/" + str(tag_no) + " run function msb:search/block/copy/dir/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
    if (even_tracker % 2) == 1 and index != len(file_cache) - 2 or index == len(file_cache) - 1:
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

###NON-DIRECTIONAL###

blocks = copy.deepcopy(blocks_nodir)

file_cache = []
temp_cache = {}
even_tracker = 0

id = 0
file_no = 0

for block_num, x in enumerate(blocks):
  #print(x)
  if ('properties' not in blocks[x]) or (len(blocks[x]["properties"]) == 0):
    if (even_tracker % 2) == 0 and block_num != len(blocks) - 1:
      file = open("nodir/l0/" + str(file_no) + ".mcfunction", "w")
    if file.closed == False:
      file.write("execute if block ~ ~ ~ " + x + " run data modify storage msb:block data.blocks.ids append value " + str(id) + "\n")

    if (even_tracker % 2) == 1 and block_num != len(blocks) - 2 or block_num == len(blocks) - 1:
      file.close()
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
    id += 1
  else:
    if (even_tracker % 2) == 0 and block_num != len(blocks) - 1:
      file = open("nodir/l0/" + str(file_no) + ".mcfunction", "w")

    #file.write("execute if block ~ ~ ~ " + x + " run function msb:search/block/copy/south/props/" + )
    write_props(blocks[x]["properties"], x, "nodir")

    if (even_tracker % 2) == 1 and block_num != len(blocks) - 2 or block_num == len(blocks) - 1:
      file.close()
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
  even_tracker += 1


lvl = 1

file_count = int((file_no + 1) / 2)

while file_count > 1:
  file_count = int((file_no + 1) / 2)
  new_cache = []
  os.mkdir(path + "/nodir/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0
  tag_no = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("nodir/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
    if file.closed == False:
      file.write("execute if block ~ ~ ~ #msb:no_dir/l" + str(lvl - 1) + "/" + str(tag_no) + " run function msb:search/block/copy/nodir/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
    if (even_tracker % 2) == 1 and index != len(file_cache) - 2 or index == len(file_cache) - 1:
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

'''
#####WEST#####

file_cache = []
temp_cache = {}
even_tracker = 0

id = 0
file_no = 0

for block_num, x in enumerate(blocks):
  #print(x)
  if ('properties' not in blocks[x]) or (len(blocks[x]["properties"]) == 0):
    if (even_tracker % 2) == 0 and block_num != len(blocks) - 1:
      file = open("west/l0/" + str(file_no) + ".mcfunction", "w")
    file.write("execute if block ~ ~ ~ " + x + " run data modify storage msb:block data.blocks.ids append value " + str(id) + "\n")

    if (even_tracker % 2) == 1 and block_num != len(blocks) - 2 or block_num == len(blocks) - 1:
      file.close()
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
    id += 1
  else:
    if (even_tracker % 2) == 0 and block_num != len(blocks) - 1:
      file = open("west/l0/" + str(file_no) + ".mcfunction", "w")

    #file.write("execute if block ~ ~ ~ " + x + " run function msb:search/block/copy/west/props/" + )
    write_props(blocks[x]["properties"], x, "west")

    if (even_tracker % 2) == 1 and block_num != len(blocks) - 2 or block_num == len(blocks) - 1:
      file.close()
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
  even_tracker += 1


lvl = 1

file_count = int((file_no + 1) / 2)

while file_count > 1:
  file_count = int((file_no + 1) / 2)
  new_cache = []
  os.mkdir(path + "/west/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0
  tag_no = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("west/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
    file.write("execute if block ~ ~ ~ #msb:l" + str(lvl - 1) + "/" + str(tag_no) + " run function msb:search/block/copy/west/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
    if (even_tracker % 2) == 1 and index != len(file_cache) - 2 or index == len(file_cache) - 1:
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

#####NORTH#####

file_cache = []
temp_cache = {}
even_tracker = 0

id = 0
file_no = 0

for block_num, x in enumerate(blocks):
  #print(x)
  if ('properties' not in blocks[x]) or (len(blocks[x]["properties"]) == 0):
    if (even_tracker % 2) == 0 and block_num != len(blocks) - 1:
      file = open("north/l0/" + str(file_no) + ".mcfunction", "w")
    file.write("execute if block ~ ~ ~ " + x + " run data modify storage msb:block data.blocks.ids append value " + str(id) + "\n")

    if (even_tracker % 2) == 1 and block_num != len(blocks) - 2 or block_num == len(blocks) - 1:
      file.close()
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
    id += 1
  else:
    if (even_tracker % 2) == 0 and block_num != len(blocks) - 1:
      file = open("north/l0/" + str(file_no) + ".mcfunction", "w")

    #file.write("execute if block ~ ~ ~ " + x + " run function msb:search/block/copy/north/props/" + )
    write_props(blocks[x]["properties"], x, "north")

    if (even_tracker % 2) == 1 and block_num != len(blocks) - 2 or block_num == len(blocks) - 1:
      file.close()
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
  even_tracker += 1


lvl = 1

file_count = int((file_no + 1) / 2)

while file_count > 1:
  file_count = int((file_no + 1) / 2)
  new_cache = []
  os.mkdir(path + "/north/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0
  tag_no = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("north/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
    file.write("execute if block ~ ~ ~ #msb:l" + str(lvl - 1) + "/" + str(tag_no) + " run function msb:search/block/copy/north/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
    if (even_tracker % 2) == 1 and index != len(file_cache) - 2 or index == len(file_cache) - 1:
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

#####EAST#####

file_cache = []
temp_cache = {}
even_tracker = 0

id = 0
file_no = 0

for block_num, x in enumerate(blocks):
  #print(x)
  if ('properties' not in blocks[x]) or (len(blocks[x]["properties"]) == 0):
    if (even_tracker % 2) == 0 and block_num != len(blocks) - 1:
      file = open("east/l0/" + str(file_no) + ".mcfunction", "w")
    file.write("execute if block ~ ~ ~ " + x + " run data modify storage msb:block data.blocks.ids append value " + str(id) + "\n")

    if (even_tracker % 2) == 1 and block_num != len(blocks) - 2 or block_num == len(blocks) - 1:
      file.close()
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
    id += 1
  else:
    if (even_tracker % 2) == 0 and block_num != len(blocks) - 1:
      file = open("east/l0/" + str(file_no) + ".mcfunction", "w")

    #file.write("execute if block ~ ~ ~ " + x + " run function msb:search/block/copy/east/props/" + )
    write_props(blocks[x]["properties"], x, "east")

    if (even_tracker % 2) == 1 and block_num != len(blocks) - 2 or block_num == len(blocks) - 1:
      file.close()
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
  even_tracker += 1


lvl = 1

file_count = int((file_no + 1) / 2)

while file_count > 1:
  file_count = int((file_no + 1) / 2)
  new_cache = []
  os.mkdir(path + "/east/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0
  tag_no = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("east/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
    file.write("execute if block ~ ~ ~ #msb:l" + str(lvl - 1) + "/" + str(tag_no) + " run function msb:search/block/copy/east/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
    if (even_tracker % 2) == 1 and index != len(file_cache) - 2 or index == len(file_cache) - 1:
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

'''