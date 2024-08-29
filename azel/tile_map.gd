extends TileMap

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()

var width = 16
var height = 16
# Called when the node enters the scene tree for the first time.
@onready var player = get_parent().get_node("CharacterBody2D")

var loaded_chunks = []

func _ready():
	moisture.seed = randi()
	temperature.seed = randi()
	
	var player_tile_pos = local_to_map(player.position)
	generate_chunk(player_tile_pos)
	
func generate_chunk(pos):
	for x in range(width):
		for y in range(height):
			
			var moist = moisture.get_noise_2d((width/2) + x,(height/2) + x) * 10
			var temp = temperature.get_noise_2d((width/2) + x,(height/2) + x) * 10
			var alt = pos.y - (height/2) + y
			
			if alt > 0:
				set_cell(0, Vector2i(pos.x - (width/2) + x, pos.y - (height/2) + y),0, Vector2(6, 2))
			else:
				set_cell(0, Vector2i(pos.x - (width/2) + x, pos.y - (height/2) + y),0, Vector2(4, 1))
			
			if Vector2(pos.x, pos.y) not in loaded_chunks:
				loaded_chunks.append(Vector2i(pos.x, pos.y))
				

				
			
			
			
