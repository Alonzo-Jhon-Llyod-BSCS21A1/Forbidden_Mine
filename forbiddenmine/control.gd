extends Control
@onready var v_box_container: VBoxContainer = $TabContainer/CREATE/VBoxContainer
var file_path = "user://WorldList"
var world_list = []
func _ready() -> void:
	check_worldlist()
	for i in world_list:
		var label = Label.new()
		label.text = i
		v_box_container.add_child(label)
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Create.tscn")
	pass
	
func check_worldlist():
	var save_file = FileAccess.open(file_path, FileAccess.READ)
	var json_string = save_file.get_as_text()
	save_file.close()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	var save_data = json.get_data()
	world_list = save_data
