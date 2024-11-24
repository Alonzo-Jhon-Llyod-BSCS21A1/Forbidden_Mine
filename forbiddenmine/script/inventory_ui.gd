extends Control

@onready var grid_container = $GridContainer
# Called when the node enters the scene tree for the first time.
var dragged_slot = null

func _ready() -> void:
	GlobalVar.inventory_updated.connect(_on_inventory_update)
	_on_inventory_update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_inventory_update():
	clear_grid_container()
	for item in GlobalVar.inventory:
		var slot = GlobalVar.inventory_slot_scene.instantiate()
		slot.drag_start.connect(_on_drag_start)
		slot.drag_end.connect(_on_drag_end)
		grid_container.add_child(slot)
		if item != null:
			slot.set_item(item)
		else:
			slot.set_empty()

func clear_grid_container():
	while grid_container.get_child_count() > 0:
		var child = grid_container.get_child(0)
		grid_container.remove_child(child)
		child.queue_free()
		
func _on_drag_start(slot_control: Control):
	dragged_slot = slot_control
	print("Drag started for slot:", slot_control)

# Drops slot at new location
func _on_drag_end():
	var target_slot = get_slot_under_mouse()
	if target_slot and dragged_slot != target_slot:
		drop_slot(dragged_slot, target_slot)
	dragged_slot = null

# Get the current mouse position in the grid_container's coordinate system
func get_slot_under_mouse() -> Control:
	var mouse_position = get_global_mouse_position()
	for slot in grid_container.get_children():
		var slot_rect = Rect2(slot.global_position, slot.size)
		if slot_rect.has_point(mouse_position):
			return slot
	return null

# Find the index of a slot
func get_slot_index(slot: Control) -> int:
	for i in range(grid_container.get_child_count()):
		if grid_container.get_child(i) == slot:
			# Valid slot
			return i
	# Invalid slot
	return -1 

# Drop slots
func drop_slot(slot1: Control, slot2: Control):
	var slot1_index = get_slot_index(slot1)
	var slot2_index = get_slot_index(slot2)
	if slot1_index == -1 or slot2_index == -1:
		return  
	else:
		if GlobalVar.swap_inventory_items(slot1_index, slot2_index):
			_on_inventory_update()
			print("Dropping slots:", slot1_index, slot2_index)
