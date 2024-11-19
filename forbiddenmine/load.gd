extends Control
var file_path = "user://WorldList"
var world_list = []
var button = []
@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer


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
			var normal_style = StyleBoxTexture.new()
			
			var button_theme = Theme.new()
			
			newbutton.custom_minimum_size = Vector2(200, 50)
			
			normal_style.texture = load("res://Media/button-normal.png")
			button_theme.set_stylebox("normal", "Button", normal_style)
			
			var pressed_style = StyleBoxTexture.new()
			pressed_style.texture = load("res://Media/button-clicked.png")
			button_theme.set_stylebox("pressed", "Button", pressed_style)
			
			var hover_style = StyleBoxTexture.new()
			hover_style.texture = load("res://Media/button-normal.png")  # Custom hover texture
			button_theme.set_stylebox("hover", "Button", hover_style)
			
			button_theme.set_color("font_color", "Button", Color.BLACK)  # Normal state
			button_theme.set_color("font_color_hover", "Button", Color.WHITE)  # Hover state
			button_theme.set_color("font_color_pressed", "Button", Color.WHITE)  # Pressed state
			
			newbutton.theme = button_theme
			
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
			
func check_worldlist():
	var save_file = FileAccess.open(file_path, FileAccess.READ)
	var json_string = save_file.get_as_text()
	save_file.close()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	var save_data = json.get_data()
	world_list = save_data
