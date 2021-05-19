import json
import os
import copy

#Convert blocks.json into a usable python object
f = open("blocks.json","r")
blocks = json.load(f)
f.close()

blocks_backup = copy.deepcopy(blocks)

path = os.getcwd()

os.mkdir(path + "/south")
os.mkdir(path + "/south/l0")

os.mkdir(path + "/west")
os.mkdir(path + "/west/l0")

os.mkdir(path + "/north")
os.mkdir(path + "/north/l0")

os.mkdir(path + "/east")
os.mkdir(path + "/east/l0")

os.mkdir(path + "/no_dir")
os.mkdir(path + "/no_dir/l0")


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
 

  """
def remove_prop(block, block_prop):
  global blocks_backup
  global blocks
  global state
  global prop_num
  #global index_offset
  first_prop = str(blocks_backup[block]["properties"][block_prop][0])

  #Not working for some reason
  for another_index, blockstate in enumerate(blocks[block]["states"]):
    if blockstate == state:
      if state["properties"][block_prop] == first_prop:
        del blocks[block]["states"][another_index]["properties"][block_prop]
      if state["properties"][block_prop] != first_prop:
        del blocks[block]["states"][another_index]

  #if block_prop in state["properties"] and state["properties"][block_prop] == first_prop:
    #del blocks[block]["states"][prop_num - index_offset]["properties"][block_prop]
  #if block_prop in state["properties"] and state["properties"][block_prop] != first_prop:
    #del blocks[block]["states"][prop_num - index_offset]
  #index_offset += 1
 """
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

#Layer 0 - All the individual block commands
#Loops through all blocktates, grouping them into sets of two.

#####SOUTH######

print('Generating block functions (orientation: south)')

file_cache = []
temp_cache = {}

for block_num, x in enumerate(blocks):
  if ('properties' not in blocks[x]) or (len(blocks[x]["properties"]) == 0):
    if (id % 2) == 0 and id != dir_id_count - 1:
      file = open("south/l0/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":id})
    file.write("execute if score id msb.id matches " + str(id + nodir_id_count) + " run setblock ~ ~ ~ " + x + "\n")

    if (id % 2) == 1 and id != dir_id_count - 2 or id == dir_id_count - 1:
      file.close()
      temp_cache.update({"max":id})
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
    id += 1
  else:
    for y in blocks[x]["states"]:
      if (id % 2) == 0 and id != dir_id_count - 1:
        file = open("south/l0/" + str(file_no) + ".mcfunction", "w")
        temp_cache.update({"min":id})
      file.write("execute if score id msb.id matches " + str(id + nodir_id_count) + " run setblock ~ ~ ~ " + x + "[")
      for index, z in enumerate(y['properties']):
        file.write(str(z) + "=" + str(y['properties'][z]))
        if index != len(y['properties']) - 1:
          file.write(",")
      file.write("]\n")
      if (id % 2) == 1 and id != dir_id_count - 2 or id == dir_id_count - 1:
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
  os.mkdir(path + "/south/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("south/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":i["min"]})
    if file.closed == False:
      file.write("execute if score id msb.id matches " + str(i["min"] + nodir_id_count) + ".." + str(i["max"] + nodir_id_count) + " run function msb:search/block/paste/south/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
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

#####WEST######

id = 0
file_no = 0

print('Generating block functions (orientation: west)')

file_cache = []
temp_cache = {}

for block_num, x in enumerate(blocks):
  if ('properties' not in blocks[x]) or (len(blocks[x]["properties"]) == 0):
    if (id % 2) == 0 and id != dir_id_count - 1:
      file = open("west/l0/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":id})
    file.write("execute if score id msb.id matches " + str(id + nodir_id_count) + " run setblock ~ ~ ~ " + x + "\n")

    if (id % 2) == 1 and id != dir_id_count - 2 or id == dir_id_count - 1:
      file.close()
      temp_cache.update({"max":id})
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
    id += 1
  else:
    for y in blocks[x]["states"]:
      if (id % 2) == 0 and id != dir_id_count - 1:
        file = open("west/l0/" + str(file_no) + ".mcfunction", "w")
        temp_cache.update({"min":id})
      file.write("execute if score id msb.id matches " + str(id + nodir_id_count) + " run setblock ~ ~ ~ " + x + "[")
      for index, z in enumerate(y['properties']):
        file.write(rotate_right(str(z) + "=" + str(y['properties'][z])))
        if index != len(y['properties']) - 1:
          file.write(",")
      file.write("]\n")
      if (id % 2) == 1 and id != dir_id_count - 2 or id == dir_id_count - 1:
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
  os.mkdir(path + "/west/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("west/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":i["min"]})
    if file.closed == False:
      file.write("execute if score id msb.id matches " + str(i["min"] + nodir_id_count) + ".." + str(i["max"] + nodir_id_count) + " run function msb:search/block/paste/west/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
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

#####NORTH######

id = 0
file_no = 0

print('Generating block functions (orientation: north)')

file_cache = []
temp_cache = {}

for block_num, x in enumerate(blocks):
  if ('properties' not in blocks[x]) or (len(blocks[x]["properties"]) == 0):
    if (id % 2) == 0 and id != dir_id_count - 1:
      file = open("north/l0/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":id})
    file.write("execute if score id msb.id matches " + str(id + nodir_id_count) + " run setblock ~ ~ ~ " + x + "\n")

    if (id % 2) == 1 and id != dir_id_count - 2 or id == dir_id_count - 1:
      file.close()
      temp_cache.update({"max":id})
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
    id += 1
  else:
    for y in blocks[x]["states"]:
      if (id % 2) == 0 and id != dir_id_count - 1:
        file = open("north/l0/" + str(file_no) + ".mcfunction", "w")
        temp_cache.update({"min":id})
      file.write("execute if score id msb.id matches " + str(id + nodir_id_count) + " run setblock ~ ~ ~ " + x + "[")
      for index, z in enumerate(y['properties']):
        file.write(rotate_reverse(str(z) + "=" + str(y['properties'][z])))
        if index != len(y['properties']) - 1:
          file.write(",")
      file.write("]\n")
      if (id % 2) == 1 and id != dir_id_count - 2 or id == dir_id_count - 1:
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
  os.mkdir(path + "/north/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("north/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":i["min"]})
    if file.closed == False:
      file.write("execute if score id msb.id matches " + str(i["min"] + nodir_id_count) + ".." + str(i["max"] + nodir_id_count) + " run function msb:search/block/paste/north/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
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

#####EAST######

id = 0
file_no = 0

print('Generating block functions (orientation: east)')

file_cache = []
temp_cache = {}

for block_num, x in enumerate(blocks):
  if ('properties' not in blocks[x]) or (len(blocks[x]["properties"]) == 0):
    if (id % 2) == 0 and id != dir_id_count - 1:
      file = open("east/l0/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":id})
    file.write("execute if score id msb.id matches " + str(id + nodir_id_count) + " run setblock ~ ~ ~ " + x + "\n")

    if (id % 2) == 1 and id != dir_id_count - 2 or id == dir_id_count - 1:
      file.close()
      temp_cache.update({"max":id})
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
    id += 1
  else:
    for y in blocks[x]["states"]:
      if (id % 2) == 0 and id != dir_id_count - 1:
        file = open("east/l0/" + str(file_no) + ".mcfunction", "w")
        temp_cache.update({"min":id})
      file.write("execute if score id msb.id matches " + str(id + nodir_id_count) + " run setblock ~ ~ ~ " + x + "[")
      for index, z in enumerate(y['properties']):
        file.write(rotate_left(str(z) + "=" + str(y['properties'][z])))
        if index != len(y['properties']) - 1:
          file.write(",")
      file.write("]\n")
      if (id % 2) == 1 and id != dir_id_count - 2 or id == dir_id_count - 1:
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
  os.mkdir(path + "/east/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0

  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("east/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":i["min"]})
    if file.closed == False:
      file.write("execute if score id msb.id matches " + str(i["min"] + nodir_id_count) + ".." + str(i["max"] + nodir_id_count) + " run function msb:search/block/paste/east/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
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

###NON-DIRECTIONAL###

id = 0
file_no = 0
 
print('Generating block functions (orientation: none)')
 
file_cache = []
temp_cache = {}
 
for block_num, x in enumerate(blocks_nodir):
  if ('properties' not in blocks_nodir[x]) or (len(blocks_nodir[x]["properties"]) == 0):
    if (id % 2) == 0 and id != nodir_id_count - 1:
      file = open("no_dir/l0/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":id})
    file.write("execute if score id msb.id matches " + str(id) + " run setblock ~ ~ ~ " + x + "\n")
 
    if (id % 2) == 1 and id != nodir_id_count - 2 or id == nodir_id_count - 1:
      file.close()
      temp_cache.update({"max":id})
      temp_cache.update({"file_no":file_no})
      file_cache.append(temp_cache.copy())
      file_no += 1
    id += 1
  else:
    for y in blocks_nodir[x]["states"]:
      if (id % 2) == 0 and id != nodir_id_count - 1:
        file = open("no_dir/l0/" + str(file_no) + ".mcfunction", "w")
        temp_cache.update({"min":id})
      file.write("execute if score id msb.id matches " + str(id) + " run setblock ~ ~ ~ " + x + "[")
      for index, z in enumerate(y['properties']):
        file.write(str(z) + "=" + str(y['properties'][z]))
        if index != len(y['properties']) - 1:
          file.write(",")
      file.write("]\n")
      if (id % 2) == 1 and id != nodir_id_count - 2 or id == nodir_id_count - 1:
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
  os.mkdir(path + "/no_dir/l" + str(lvl))
  file_count = int((file_no + 1)/ 2)
  file_no = 0
  even_tracker = 0
 
  for index, i in enumerate(file_cache):
    if (even_tracker % 2) == 0 and index != len(file_cache) - 1:
      file = open("no_dir/l" + str(lvl) + "/" + str(file_no) + ".mcfunction", "w")
      temp_cache.update({"min":i["min"]})
    if file.closed == False:
      file.write("execute if score id msb.id matches " + str(i["min"]) + ".." + str(i["max"]) + " run function msb:search/block/paste/no_dir/l" + str(lvl-1) + "/" + str(i["file_no"]) + "\n")
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


