extends CanvasLayer

func _ready() -> void:
	Achievement.load_achievements()
	if Achievement.achievements["acacia_artisan"] != false:
		$TabContainer/CRAFTING/Label3/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["jungle_crafter"] != false:
		$TabContainer/CRAFTING/Label4/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["frosted_masterpiece"] != false:
		$TabContainer/CRAFTING/Label5/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["oak_enthusiast"] != false:
		$TabContainer/CRAFTING/Label6/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["stone_shaper"] != false:
		$TabContainer/CRAFTING/Label7/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["golden_touch"] != false:
		$TabContainer/CRAFTING/Label8/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["iron_forge"] != false:
		$TabContainer/CRAFTING/Label9/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["diamond_crafter"] != false:
		$TabContainer/CRAFTING/Label10/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["emerald_engineer"] != false:
		$TabContainer/CRAFTING/Label11/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["ruby_radiance"] != false:
		$TabContainer/CRAFTING/Label12/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["topaz_treasures"] != false:
		$TabContainer/CRAFTING/Label13/TextureRect.texture = load("res://Media/QW.png")
	
	if Achievement.achievements["magma_master"] != false:
		$TabContainer/CRAFTING/Label14/TextureRect.texture = load("res://Media/QW.png")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/control.tscn")
	pass # Replace with function body.
