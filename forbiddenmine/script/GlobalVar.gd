extends Node

var new_world
@warning_ignore("shadowed_global_identifier")
@onready var inventory_slot_scene = preload("res://Scene/inventory_slot.tscn")
var Worldseed
@warning_ignore("shadowed_global_identifier")
var load = 0
var action_distance = 4
var characterlocation
var charposition
var hotbar_size = 5
var hotbar_inventory = []
var Item_onhold = null
var inventory = []
signal inventory_updated

var player_node: Node = null

func _ready():
	inventory.resize(36)
	hotbar_inventory.resize(hotbar_size)
	sync_inventory_to_hotbar()

func add_item(item, to_hotbar = false):
	var added_to_hotbar = false
	var stack_limit = 64

	# Set stack limit based on item type
	if item["type"] == "weapon":
		stack_limit = 1
	elif item["type"] == "tile":
		stack_limit = 64

	# Add to hotbar if requested
	if to_hotbar:
		added_to_hotbar = add_hotbar_item(item)
		inventory_updated.emit()
		
	# Try to stack the item if possible
	if not added_to_hotbar:
		for i in range(inventory.size()):
			if inventory[i] != null and inventory[i]["name"] == item["name"]:
				if inventory[i].has("effect") and item.has("effect") and inventory[i]["effect"] == item["effect"]:
					if inventory[i]["quantity"] < stack_limit:
						inventory[i]["quantity"] += item["quantity"]
						inventory_updated.emit()
						sync_inventory_to_hotbar()
						print("Item added:", inventory)
						return true
					else:
						print("Stack limit reached for", item["name"])
				elif !inventory[i].has("effect") and !item.has("effect"):
					if inventory[i]["quantity"] < stack_limit:
						inventory[i]["quantity"] += item["quantity"]
						inventory_updated.emit()
						sync_inventory_to_hotbar()
						print("Item added:", inventory)
						return true
					else:
						print("Stack limit reached for", item["name"])

	# Add to the first available empty slot
	for i in range(inventory.size()):
		if inventory[i] == null:
			inventory[i] = item
			inventory_updated.emit()
			sync_inventory_to_hotbar()
			print("Item added:", inventory)
			return true

	# Add a new slot if space is still available
	if inventory.size() < 36:
		inventory.append(item)
		inventory_updated.emit()
		sync_inventory_to_hotbar()
		print("Item added:", inventory)
		return true

	print("Inventory is full. Cannot add item:", item["name"])
	return false

# Increase the size of the inventory
func increase_inventory_size(extra_slots):
	inventory.resize(inventory.size() + extra_slots)
	inventory_updated.emit()

# Set the reference to the player node
func set_player_references(player):
	player_node = player
			
func drop_item():
	if Item_onhold != null and Item_onhold >= 0 and Item_onhold < inventory.size():
		var item = inventory[Item_onhold]
		if item != null:
			var item_scene = load(item["scene_path"])
			var item_instance = item_scene.instantiate()
			item_instance.set_item_data(item)
			item_instance.global_position = charposition
			get_tree().current_scene.add_child(item_instance)
			inventory_updated.emit()
			sync_inventory_to_hotbar()
			reduce_item_quantity(Item_onhold)
			print("Item dropped:", item["name"])
			
		else:
			print("No valid item on hold.")
	else:
		print("No item on hold to drop.")


# Add an item to the hotbar
func add_hotbar_item(item):
	for i in range(hotbar_size):
		if hotbar_inventory[i] == null:
			hotbar_inventory[i] = item
			sync_hotbar_to_inventory()  # Sync changes back to the inventory
			return true
	return false

# Remove an item from the hotbar
func remove_hotbar_item(item_type, item_effect):
	for i in range(hotbar_inventory.size()):
		if hotbar_inventory[i] != null and hotbar_inventory[i]["type"] == item_type and hotbar_inventory[i]["effect"] == item_effect:
			hotbar_inventory[i] = null
			sync_hotbar_to_inventory()  # Sync changes back to the inventory
			inventory_updated.emit()
			return true
	return false

# Swap two items in the inventory
func swap_inventory_items(index1, index2):
	if index1 < 0 or index1 >= inventory.size() or index2 < 0 or index2 >= inventory.size():
		return false
	var temp = inventory[index1]
	inventory[index1] = inventory[index2]
	inventory[index2] = temp
	inventory_updated.emit()
	sync_inventory_to_hotbar()
	return true

# Swap two items in the hotbar
func swap_hotbar_items(index1, index2):
	if index1 < 0 or index1 >= hotbar_inventory.size() or index2 < 0 or index2 >= hotbar_inventory.size():
		return false
	var temp = hotbar_inventory[index1]
	hotbar_inventory[index1] = hotbar_inventory[index2]
	hotbar_inventory[index2] = temp
	inventory_updated.emit()
	sync_hotbar_to_inventory()
	return true

# Sync the inventory to the hotbar
func sync_inventory_to_hotbar():
	for i in range(hotbar_size):
		if i < inventory.size():
			hotbar_inventory[i] = inventory[i]
		else:
			hotbar_inventory[i] = null
	inventory_updated.emit()

# Sync the hotbar back to the inventory
func sync_hotbar_to_inventory():
	for i in range(hotbar_size):
		if i < inventory.size():
			inventory[i] = hotbar_inventory[i]
	inventory_updated.emit()
	
func reduce_item_quantity(index):
	if index >= 0 and index < inventory.size() and inventory[index] != null:
		var item = inventory[index]
		item["quantity"] -= 1
		if item["quantity"] <= 0:
			inventory[index] = null
			print("Item removed from inventory.")
			# If this item is currently on hold, clear it
			if GlobalVar.Item_onhold == index:
				GlobalVar.Item_onhold = null
				print("Item_onhold cleared as item is depleted.")
		sync_inventory_to_hotbar()  # Sync changes to the hotbar
		inventory_updated.emit()
		print("Item added", inventory)
		return true
	return false
# Save the inventory data to a .save file
func save_inventory():
	var inventory_file_path = "user://Inventory"
	if new_world != null:
		inventory_file_path += new_world + ".save"
	var file = FileAccess.open(inventory_file_path, FileAccess.WRITE)
	if file:
		var inventory_data = {
			"inventory": inventory.map(func(item):
			if item != null:
				var duplicate_item = item.duplicate()
				if duplicate_item.has("texture") and duplicate_item["texture"] != null:
					duplicate_item["texture"] = duplicate_item["texture"].resource_path
				return duplicate_item
			else:
				return null
			)
		}
		var json_string = JSON.stringify(inventory_data)
		file.store_string(json_string)
		file.close()
		print("Inventory saved successfully to", inventory_file_path)
	else:
		print("Error: Could not open the file for saving.")

# Load the inventory data from a .save file
func load_inventory():
	var inventory_file_path = "user://Inventory"
	if new_world != null:
		inventory_file_path += new_world + ".save"
	if not FileAccess.file_exists(inventory_file_path):
		print("Error: Save file does not exist.")
		return

	var file = FileAccess.open(inventory_file_path, FileAccess.READ)
	if file:
		var json_data = file.get_as_text()
		file.close()

		var json_instance = JSON.new()
		var parse_result = json_instance.parse(json_data)

		if parse_result == OK:
			var loaded_data = json_instance.get_data()
			if loaded_data.has("inventory") and loaded_data["inventory"] is Array:
				inventory = loaded_data["inventory"].map(func(item):
					if item != null:
						if item.has("texture") and item["texture"] != null:
							item["texture"] = ResourceLoader.load(item["texture"])
					return item
				)
				sync_inventory_to_hotbar()
				print("Inventory loaded successfully from", inventory_file_path)
			else:
				print("Error: Loaded data is invalid or corrupted.")
		else:
			print("Error: Failed to parse the inventory data. Error code:", parse_result)
	else:
		print("Error: Failed to open the save file.")
		
func has_space_for_item(item: Dictionary) -> bool:
	var stack_limit = 64
	if item["type"] == "weapon":
		stack_limit = 1
	elif item["type"] == "tile":
		stack_limit = 64

	# Check for stackable space or empty slots
	for inv_item in inventory:
		if inv_item == null:
			return true
		if inv_item["name"] == item["name"] and inv_item["quantity"] < stack_limit:
			if !inv_item.has("effect") or (item.has("effect") and inv_item["effect"] == item["effect"]):
				return true

	# No empty slot or stackable space
	return false
















	
