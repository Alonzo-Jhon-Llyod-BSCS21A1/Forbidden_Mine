extends Control

@onready var icon = $InnerBorder/Item_Icon
@onready var quantity_label = $InnerBorder/Item_Quantity
@onready var details_panel = $DetailPanel
@onready var item_name = $DetailPanel/ItemName
@onready var item_type = $DetailPanel/ItemType
@onready var item_effect = $DetailPanel/ItemEffect
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
		
func _input(event: InputEvent) -> void:
	if event is InputEvent and event.is_pressed():
		if Input.is_action_pressed("Drop"):
			if item != null:
				var drop_position = GlobalVar.player_node.global_position
				var drop_offset = Vector2(0, 50)
				drop_offset = drop_offset.rotated(GlobalVar.player_node.rotation)
				GlobalVar.drop_item(item, drop_position + drop_offset)
				GlobalVar.remove_item(item["type"], item["effect"])
				
		if Input.is_action_pressed("Use"):
			if GlobalVar.Item_onhold != null:
				var itemhold = GlobalVar.inventory[GlobalVar.Item_onhold]
				if itemhold != null and itemhold.get("effect", "") != "":
					if GlobalVar.player_node:
						GlobalVar.player_node.apply_item_effect(itemhold)
						GlobalVar.reduce_item_quantity(GlobalVar.Item_onhold)
						print("Item used successfully")
					else:
						print("Player could not be found")
				else:
					print("No valid item selected")

		
func _on_item_button_gui_input(event: InputEvent):
	if event is InputEventMouseButton or event is InputEventKey:
		# Mouse button input
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				if item != null:
					GlobalVar.Item_onhold = slot_index
			elif event.button_index == MOUSE_BUTTON_RIGHT:
				if event.pressed:
					outer_border.modulate = Color(1, 1, 0)
					drag_start.emit(self)
				else:
					outer_border.modulate = Color(1, 1, 1)
					drag_end.emit()
