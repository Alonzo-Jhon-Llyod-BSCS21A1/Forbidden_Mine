extends Control
@onready var canvas_layer: CanvasLayer = $".."





func _on_continue_pressed() -> void:
	get_tree().paused = false
	canvas_layer.visible = false

	
	



func _on_exit_pressed() -> void:
	GlobalVar.save_inventory()
	PlayerVar.save_player_data()
	get_tree().quit()
	pass # Replace with function body.


func _on_main_menu_pressed() -> void:
	GlobalVar.save_inventory()
	PlayerVar.save_player_data()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scene/control.tscn")
	pass # Replace with function body.
