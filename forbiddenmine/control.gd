extends Control
			
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Create.tscn")
	pass
	

	


func _on_load_button_pressed() -> void:
	get_tree().change_scene_to_file("res://CreatedWorld.tscn")
	pass # Replace with function body.
