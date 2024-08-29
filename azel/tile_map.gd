extends TileMap

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()

var width = 100
var height = 100
@onready var player = get_parent().get_node("CharacterBody2D")

var loaded_chunks = []

func _ready():
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()
	
	altitude.frequency = 0.01
	var player_tile_pos = local_to_map(player.position)
	generate_chunk(player_tile_pos)
	
func generate_chunk(pos):
	var half_width = width / 2
	var half_height = height / 2
	
	for x in range(width):
		for y in range(height):
			var nx = pos.x - half_width + x
			var ny = pos.y - half_height + y
			
			var moist = moisture.get_noise_2d(nx, ny) * 10
			var temp = temperature.get_noise_2d(nx, ny) * 10
			var alt = altitude.get_noise_2d(nx, ny) * 10
			
			var tile_pos = Vector2i(nx, ny)
			
			if alt < 0:
				set_cell(0, tile_pos, 0, Vector2(6, round(2 * (temp + 10) / 20)))
			else:
				set_cell(0, tile_pos, 0, Vector2(round(6 * (moist + 10) / 20), round(2 * (temp + 10) / 20)))
			
			if Vector2(pos.x, pos.y) not in loaded_chunks:
				loaded_chunks.append(Vector2i(pos.x, pos.y))
	
				
			
			
			
