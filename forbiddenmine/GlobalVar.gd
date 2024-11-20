extends Node

var new_world
@warning_ignore("shadowed_global_identifier")
@onready var inventory_slot_scene = preload("res://inventory_slot.tscn")

var Worldseed
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

# Add item to inventory or hotbar
func add_item(item, to_hotbar = false):
	var added_to_hotbar = false
	if to_hotbar:
		added_to_hotbar = add_hotbar_item(item)
		inventory_updated.emit()
	if not added_to_hotbar:
		for i in range(inventory.size()):
			# Check if the item exists in the inventory and matches both type and effect
			if inventory[i] != null and inventory[i]["name"] == item["name"] and inventory[i]["effect"] == item["effect"]:
				inventory[i]["quantity"] += item["quantity"]
				inventory_updated.emit()
				sync_inventory_to_hotbar()
				print("Item added", inventory)
				return true
			elif inventory[i] == null:
				inventory[i] = item
				inventory_updated.emit()
				sync_inventory_to_hotbar()
				print("Item added", inventory)
				return true
		return false

# Remove an item completely from inventory and return it for dropping
func remove_item(item_type, item_effect):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["type"] == item_type and inventory[i]["effect"] == item_effect:
			var removed_item = inventory[i]
			inventory[i] = null
			inventory_updated.emit()
			sync_inventory_to_hotbar()
			return removed_item
	return null

# Increase the size of the inventory
func increase_inventory_size(extra_slots):
	inventory.resize(inventory.size() + extra_slots)
	inventory_updated.emit()

# Set the reference to the player node
func set_player_references(player):
	player_node = player

# Adjust the drop position to avoid overlap
func adjust_drop_position(position):
	var radius = 100
	var nearby_items = get_tree().get_nodes_in_group("Items")
	for item in nearby_items:
		if item.global_position.distance_to(position) < radius:
			var random_offset = Vector2(randf_range(-radius, radius), randf_range(-radius, radius))
			position += random_offset
			break
	return position

# Drop an item in the game world
func drop_item(item_data, drop_position):
	var item_scene = load(item_data["scene_path"])
	var item_instance = item_scene.instantiate()
	item_instance.set_item_data(item_data)
	drop_position = adjust_drop_position(drop_position)
	item_instance.global_position = drop_position
	get_tree().current_scene.add_child(item_instance)

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

# Unassign an item from the hotbar
func unassign_hotbar_item(item_type, item_effect):
	for i in range(hotbar_inventory.size()):
		if hotbar_inventory[i] != null and hotbar_inventory[i]["type"] == item_type and hotbar_inventory[i]["effect"] == item_effect:
			hotbar_inventory[i] = null
			sync_hotbar_to_inventory()  # Sync changes back to the inventory
			inventory_updated.emit()
			return true
	return false

# Check if an item is assigned to the hotbar
func is_item_assigned_to_hotbar(item_to_check):
	return item_to_check in hotbar_inventory

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
	
func reduce_item_quantity(item):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i] == item:
			inventory[i]["quantity"] -= 1
			if inventory[i]["quantity"] <= 0:
				inventory[i] = null
				print("Item removed from inventory.")
			break
	sync_inventory_to_hotbar()
	inventory_updated.emit()



	
