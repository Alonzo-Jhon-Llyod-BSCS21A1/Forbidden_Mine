extends Control
@onready var v_box_container: VBoxContainer = $TabContainer/CREATE/VBoxContainer/ScrollContainer/VBoxContainer
var file_path = "user://WorldList"
var world_list = []
var button = []
func _ready() -> void:
	if FileAccess.file_exists(file_path):
		check_worldlist()
		for i in world_list:
			var label = Label.new()
			label.text = i
			var newbutton = Button.new()
			newbutton.text = "PLAY"
			newbutton.set_meta("world_name", i)
			button.append(newbutton)  
			newbutton.button_down.connect(play)
			v_box_container.add_child(label)
			v_box_container.add_child(newbutton)
			

func play():
	for i in button:
		if i.is_pressed():
			var world_name = i.get_meta("world_name")
			GlobalVar.new_world = world_name
			GlobalVar.load = 0
			get_tree().change_scene_to_file("res://node_2d.tscn")
			
			
			
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
