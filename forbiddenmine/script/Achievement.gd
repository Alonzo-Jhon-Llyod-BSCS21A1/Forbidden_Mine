extends Node

# Achievement states
var achievements = {
	"acacia_artisan": false,
	"jungle_crafter": false,
	"frosted_masterpiece": false,
	"oak_enthusiast": false,
	"stone_shaper": false,
	"golden_touch": false,
	"iron_forge": false,
	"diamond_crafter": false,
	"emerald_engineer": false,
	"ruby_radiance": false,
	"topaz_treasures": false,
	"magma_master": false
}

# Save method using JSON (similar to the player data saving function)
func save_achievements() -> void:
	var achievements_file_path = "user://achievements.save"
	
	# Save the dictionary to a JSON file
	var file = FileAccess.open(achievements_file_path, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(achievements))
		file.close()
		print("Achievements saved successfully.")
	else:
		print("Failed to save achievements.")

# Load method using JSON (similar to the player data loading function)
func load_achievements() -> void:
	var achievements_file_path = "user://achievements.save"
	
	var file = FileAccess.open(achievements_file_path, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var json_parser = JSON.new()
		var error = json_parser.parse(content)
		if error == OK:
			var data = json_parser.data
			achievements = data
			print("Achievements loaded successfully.")
		else:
			print("Failed to parse achievements.")
		file.close()
	else:
		print("Failed to load achievements.")
