extends Control
			
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Create.tscn")
	pass
	

	


func _on_load_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/CreatedWorld.tscn")
	pass # Replace with function body.


func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/game_controls.tscn")
	pass # Replace with function body.


func _on_achievement_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Achievement.tscn")
	pass # Replace with function body.


func _on_final_stage_preview_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Abyss.tscn")
	pass # Replace with function body.
