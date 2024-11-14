extends Control
@onready var line_edit: LineEdit = $LineEdit

var world_list = []
var file_path = "user://WorldList"

func _on_button_pressed() -> void:
	GlobalVar.new_world = line_edit.text.strip_edges()
	if GlobalVar.new_world.is_empty():
		print("aba")
	else:
		if FileAccess.file_exists(file_path):
			check_worldlist()
			if GlobalVar.new_world in world_list:
				print("meron na po")
			else:
				GlobalVar.load = 1
				save_world()
				PlayerVar.player_health = 100
				get_tree().change_scene_to_file("res://node_2d.tscn")
		else:
			GlobalVar.load = 1
			save_world()
			PlayerVar.player_health = 100
			get_tree().change_scene_to_file("res://node_2d.tscn")
	pass

func check_worldlist():
	var save_file = FileAccess.open(file_path, FileAccess.READ)
	var json_string = save_file.get_as_text()
	save_file.close()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	var save_data = json.get_data()
	world_list = save_data
	
func save_world():
	world_list.append(GlobalVar.new_world)
	var save_file = FileAccess.open(file_path, FileAccess.WRITE)
	var json_string = JSON.stringify(world_list)
	save_file.store_string(json_string)
	save_file.close()
	
