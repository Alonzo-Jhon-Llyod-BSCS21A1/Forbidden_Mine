extends Node

var player_name
var player_health = 100
var player_hunger = 100
var player_thirst = 100

var hunger_interval = 10
var thirst_interval = 5
var health_reduction_interval = 2.0
var health_reduction_amount = 1

# Internal timers
var hunger_timer = 0
var thirst_timer = 0
var health_reduction_timer = 0

var lavaartifact
var waterartifact
var earthartifact
var iceartifact
func reduce_hunger_and_thirst(delta):

	hunger_timer += delta
	thirst_timer += delta

	if hunger_timer >= hunger_interval:
		player_hunger -= 1
		player_hunger = max(player_hunger, 0)
		hunger_timer = 0

	if thirst_timer >= thirst_interval:
		player_thirst -= 1
		player_thirst = max(player_thirst, 0)
		thirst_timer = 0
	check_critical_conditions(delta)

func check_critical_conditions(delta):
	if player_hunger == 0 or player_thirst == 0:
		health_reduction_timer += delta
		if health_reduction_timer >= health_reduction_interval:
			player_health -= health_reduction_amount
			player_health = max(player_health, 0)
			health_reduction_timer = 0

func restore_health(amount: int) -> void:
	player_health += amount
	player_health = min(player_health, 100)
	print("Player health: ", player_health)

func restore_hunger(amount: int) -> void:
	player_hunger += amount
	player_hunger = min(player_hunger, 100)
	print("Player stamina: ", player_hunger)
	
func restore_thrist(amount: int) -> void:
	player_thirst += amount
	player_thirst = min(player_thirst, 100)
	print("Player stamina: ", player_thirst)
	
func save_player_data() -> void:
	var player_data_file_path = "user://PlayerStats"
	if GlobalVar.new_world != null:
		player_data_file_path += GlobalVar.new_world + ".save"
	
	# Convert Vector2i to string for saving
	var player_data = {
		"health": player_health,
		"hunger": player_hunger,
		"thirst": player_thirst,
		"artifacts": {
			"lavaartifact": str(lavaartifact.x) + "," + str(lavaartifact.y),
		}
	}

	# Save the dictionary to a JSON file
	var file = FileAccess.open(player_data_file_path, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(player_data))
		file.close()



func load_player_data() -> void:
	var player_data_file_path = "user://PlayerStats"
	if GlobalVar.new_world != null:
		player_data_file_path += GlobalVar.new_world + ".save"
	
	var file = FileAccess.open(player_data_file_path, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var json_parser = JSON.new()
		var error = json_parser.parse(content)
		if error == OK:
			var data = json_parser.data
			player_health = data.get("health", player_health)
			player_hunger = data.get("hunger", player_hunger)
			player_thirst = data.get("thirst", player_thirst)
			var artifacts = data.get("artifacts", {})
			lavaartifact = string_to_vector2i(artifacts.get("lavaartifact", "0,0"))
		file.close()

# Helper function to convert string "x,y" to Vector2i
func string_to_vector2i(str: String) -> Vector2i:
	var parts = str.split(",")
	if parts.size() == 2:
		return Vector2i(parts[0].to_int(), parts[1].to_int())
	return Vector2i.ZERO  # Return a default value if parsing fails

		
var previous_health = player_health
var previous_hunger = player_hunger
var previous_thirst = player_thirst

func check_and_save_player_data() -> void:
	if player_health != previous_health or player_hunger != previous_hunger or player_thirst != previous_thirst:
		save_player_data()
		previous_health = player_health
		previous_hunger = player_hunger
		previous_thirst = player_thirst
