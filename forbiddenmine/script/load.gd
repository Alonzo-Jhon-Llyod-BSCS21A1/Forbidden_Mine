extends Control

var file_path = "user://WorldList"
var world_list = []
var button = []
var delete_button = []
@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer
@onready var confirmation_dialog: ConfirmationDialog = $ConfirmationDialog  # Reference to the confirmation dialog node

func _ready() -> void:
	if FileAccess.file_exists(file_path):
		check_worldlist()
		
	v_box_container.custom_minimum_size = Vector2(300, 600)
	
	var custom_font = FontFile.new()
	custom_font.font_data = load("res://Media/upheavtt.ttf")  # Replace with your font path
	custom_font.fixed_size = 24
	
	for i in world_list:
		var label = Label.new()
		var newbutton = Button.new()
		newbutton.text = i
		newbutton.add_theme_font_override("font", custom_font)
		newbutton.set_meta("world_name", i)
		
		# Create a delete button for each world button
		var delete_btn = Button.new()
		delete_btn.text = "Delete"
		delete_btn.set_meta("world_name", i)
		delete_btn.add_theme_font_override("font", custom_font)
		
		# Connect the delete button signal using Callable
		delete_btn.connect("pressed", Callable(self, "_on_delete_pressed").bind(i))
		
		# Apply styles to the buttons (same as you did for the world button)
		newbutton.custom_minimum_size = Vector2(200, 50)
		var normal_style = StyleBoxTexture.new()
		var button_theme = Theme.new()
		
		normal_style.texture = load("res://Media/button-normal.png")
		button_theme.set_stylebox("normal", "Button", normal_style)
		
		var pressed_style = StyleBoxTexture.new()
		pressed_style.texture = load("res://Media/button-clicked.png")
		button_theme.set_stylebox("pressed", "Button", pressed_style)
		
		var hover_style = StyleBoxTexture.new()
		hover_style.texture = load("res://Media/button-normal.png")
		button_theme.set_stylebox("hover", "Button", hover_style)
		
		button_theme.set_color("font_color", "Button", Color.BLACK)  # Normal state
		button_theme.set_color("font_color_hover", "Button", Color.WHITE)  # Hover state
		button_theme.set_color("font_color_pressed", "Button", Color.WHITE)  # Pressed state
		
		newbutton.theme = button_theme
		newbutton.button_down.connect(play)
		
		# Add the world button and delete button to the UI
		button.append(newbutton)
		delete_button.append(delete_btn)
		v_box_container.add_child(label)
		v_box_container.add_child(newbutton)
		v_box_container.add_child(delete_btn)

func play():
	for i in button:
		if i.is_pressed():
			var world_name = i.get_meta("world_name")
			GlobalVar.new_world = world_name
			GlobalVar.load = 0
			get_tree().change_scene_to_file("res://Scene/node_2d.tscn")

func check_worldlist():
	var save_file = FileAccess.open(file_path, FileAccess.READ)
	var json_string = save_file.get_as_text()
	save_file.close()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	var save_data = json.get_data()
	world_list = save_data

func _on_delete_pressed(world_name: String) -> void:
	# Set the world name to delete
	confirmation_dialog.set_meta("world_name", world_name)
	# Show confirmation dialog
	confirmation_dialog.popup_centered()

# This function will be connected to the confirmation dialog's "confirmed" signal
func _on_confirm_delete_pressed() -> void:
	var world_name = confirmation_dialog.get_meta("world_name")
	
	# Remove the world from the list and the file
	world_list.erase(world_name)
	save_worldlist()
	
	# Create a list of buttons to remove after the loop
	var buttons_to_remove = []
	
	for i in range(button.size()):
		var current_button = button[i]
		if current_button.get_meta("world_name") == world_name:
			buttons_to_remove.append(current_button)
			v_box_container.remove_child(current_button)
			current_button.queue_free()
	
	# Remove from the array of buttons after iterating
	for btn in buttons_to_remove:
		button.erase(btn)
	
	# Similarly for delete buttons
	var delete_buttons_to_remove = []
	
	for i in range(delete_button.size()):
		var current_delete_button = delete_button[i]
		if current_delete_button.get_meta("world_name") == world_name:
			delete_buttons_to_remove.append(current_delete_button)
			v_box_container.remove_child(current_delete_button)
			current_delete_button.queue_free()
	
	# Remove from the array of delete buttons after iterating
	for del_btn in delete_buttons_to_remove:
		delete_button.erase(del_btn)

	# Delete the associated world files
	var world_file_path = "user://" + world_name
	var player_stats_file_path = "user://" + "PlayerStats" + world_name + ".Save"
	
	# Check and delete world file
	var dir = DirAccess.open("user://")  # Open the directory
	if dir.file_exists(world_file_path):
		dir.remove(world_file_path)

	# Check and delete player stats file
	if dir.file_exists(player_stats_file_path):
		dir.remove(player_stats_file_path)

func save_worldlist():
	# Save the updated world list back to the file
	var json = JSON.new()
	var json_string = json.stringify(world_list)
	var save_file = FileAccess.open(file_path, FileAccess.WRITE)
	if save_file:
		save_file.store_string(json_string)
		save_file.close()

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/control.tscn")
