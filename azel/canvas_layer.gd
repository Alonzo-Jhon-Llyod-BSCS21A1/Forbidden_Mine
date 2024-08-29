extends CanvasLayer

@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"
@onready var tile_map: TileMap = $"../TileMap"

func _ready() -> void:
	if not character_body_2d:
		print("CharacterBody2D node not found")
	if not tile_map:
		print("TileMap node not found")

func _process(delta: float) -> void:
	if character_body_2d and tile_map:
		# Get the global position of the character
		var global_position = character_body_2d.global_position
		
		# Convert global position to TileMap local position
		var local_position = tile_map.to_local(global_position)
		
		# Convert local position to tile-based coordinates using local_to_map
		var tile_coords = tile_map.local_to_map(local_position)
		
		# Update the label with the tile-based coordinates
		$Label.text = "Coordinate: " + str(tile_coords.x) + ", " + str(tile_coords.y)
