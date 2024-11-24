extends Control

@onready var icon = $InnerBorder/Item_Icon
@onready var quantity_label = $InnerBorder/Item_Quantity
@onready var details_panel = $DetailPanel
@onready var item_name = $DetailPanel/ItemName
@onready var item_type = $DetailPanel/ItemType
@onready var item_effect = $DetailPanel/ItemEffect
@onready var usage_panel = $UsagePanel
@onready var assign_button = $UsagePanel/AssignButton
@onready var outer_border = $OuterBorder

signal drag_start(slot) 
signal drag_end()  

var item = null
var slot_index = -1
var is_assigned = false

func set_slot_index(new_index):
	slot_index = new_index

func _on_item_button_mouse_entered():
	if item != null:
		usage_panel.visible = false
		details_panel.visible = true

func _on_item_button_mouse_exited():
	details_panel.visible = false
	
func set_empty():
	icon.texture = null
	quantity_label.text = ""

func set_item(new_item):
	item = new_item
	icon.texture = item["texture"] 
	quantity_label.text = str(item["quantity"])
	item_name.text = str(item["name"])
	item_type.text = str(item["type"])
	if item["effect"] != "":
		item_effect.text = str("+ ", item["effect"])
	else: 
		item_effect.text = ""
	update_assignment_status()
		
func _on_drop_pressed():
	if item != null:
		var drop_position = GlobalVar.player_node.global_position
		var drop_offset = Vector2(0, 50)
		drop_offset = drop_offset.rotated(GlobalVar.player_node.rotation)
		GlobalVar.drop_item(item, drop_position + drop_offset)
		GlobalVar.remove_item(item["type"], item["effect"])
		usage_panel.visible = false
		
func _on_use_button_pressed() -> void:
	usage_panel.visible = false
	if item != null and item["effect"] != "":
		if GlobalVar.player_node:
			GlobalVar.player_node.apply_item_effect(item)
			GlobalVar.remove_item(item["type"], item["effect"])
			GlobalVar.remove_hotbar_item(item["type"], item["effect"])
		else:
			print("player could not be found")
			
func update_assignment_status():
	is_assigned = GlobalVar.is_item_assigned_to_hotbar(item)
	if is_assigned:
		assign_button.text = "Unassign"
	else:
		assign_button.text = "Assign"

func _on_assign_button_pressed():
	if item != null:
		if is_assigned:
			GlobalVar.remove_hotbar_item(item["type"], item["effect"])
			is_assigned = false
		else:
			GlobalVar.add_item(item, true)
			is_assigned = true
		update_assignment_status()


func _on_item_button_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			if item != null:
				usage_panel.visible = !usage_panel.visible
		# Handle right mouse button for drag
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				outer_border.modulate = Color(1, 1, 0)
				drag_start.emit(self)
			else:
				outer_border.modulate = Color(1, 1, 1)
				drag_end.emit()
