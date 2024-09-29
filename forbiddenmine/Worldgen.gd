extends TileMapLayer
@export var noise_height_text : NoiseTexture2D
var SAVE_FILE_PATH = "user://"
var width = 10000
var height = 100
var noise : Noise

var grass = Vector2i(4,0)
var dirt = Vector2i(3,0)
var water = Vector2i(4, 1)
var sand = Vector2i(0, 0)
var stone = Vector2i(1, 0)
var deepstone = Vector2i(2,0)
var iron = Vector2i(2,1)
var diamond =  Vector2i(1,1)
var rng : RandomNumberGenerator 

func _ready() -> void:
	SAVE_FILE_PATH += GlobalVar.new_world
	if GlobalVar.load == 0:
		load_game()
	if GlobalVar.load == 1:
		noise = noise_height_text.noise
		noise.seed = randi()
		rng = RandomNumberGenerator.new()
		rng.seed = 1
		grassanddirtsnow()
		stonegen()
		deepgen()
		irongen()
		diamondgen()
		watergen()
		waterfill()
		sandgen()
		tree()
		save_world()
		pass # Replace with function body.
	if GlobalVar.load == 2:
		load_game()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func grassanddirtsnow():
	for x in range(-width/2, width/2):
		var ground = abs(noise.get_noise_2d(x,0) * 64)
		for y in range(ground, height):
			var noise_val: float = noise.get_noise_2d(x,y)
			if y < 50:
				if (x> ((width/2)-(width/2))):
					if (get_cell_atlas_coords(Vector2i(x, y-1)) != grass and get_cell_atlas_coords(Vector2i(x, y-1)) != dirt):
						set_cell(Vector2i(x,y),1, grass)
					else:
						set_cell(Vector2i(x,y),1, dirt)
				else:
					if (get_cell_atlas_coords(Vector2i(x, y-1)) != Vector2i(5,0) and get_cell_atlas_coords(Vector2i(x, y-1)) != dirt):
						set_cell(Vector2i(x,y),1, Vector2i(5,0))
					else:
						set_cell(Vector2i(x,y),1, dirt)

					
func watergen():
	for x in range(-width/2, width/2):
		for y in range(height):
			var noise_val:float = noise.get_noise_2d(x,y)
			if noise_val >.28 and y > 20 and y < 50: #water
				set_cell(Vector2i(x,y),1,water)

func waterfill():
	for x in range(-width/2, width/2):
		for y in range(height):
			if (get_cell_atlas_coords(Vector2i(x, y)) == water):
				if (get_cell_source_id(Vector2i(x+1,y)) == -1):
					set_cell(Vector2i(x+1,y),1,water)
				if (get_cell_source_id(Vector2i(x-1,y)) == -1):
					for i in range(x, -width/2, -1):
						set_cell(Vector2i(i,y),1,water)
						if (get_cell_source_id(Vector2i(i-1,y)) != -1):
							break	
				if (get_cell_source_id(Vector2i(x,y+1)) == -1):
					set_cell(Vector2i(x,y+1),1,water)
					
func sandgen():
	for x in range(-width/2, width/2):
		for y in range(height):
			if (get_cell_atlas_coords(Vector2i(x, y)) == grass): 
				if (get_cell_atlas_coords(Vector2i(x, y-1)) == water ):
					set_cell(Vector2i(x,y),1,sand)
				
				
	
					
func stonegen():
	for x in range(-width/2, width/2):
		var ground = abs(noise.get_noise_2d(x,0) * 64) 
		for y in range(ground+3, height):
			var noise_val:float = noise.get_noise_2d(x,y)
			if y < 50:
				set_cell(Vector2i(x,y),1, stone)
				
func deepgen():
	for x in range(-width/2, width/2):
		var ground = abs(noise.get_noise_2d(x,0) * 64) 
		for y in range(50, height):
			var noise_val:float = noise.get_noise_2d(x,y)
			if noise_val > -2:
				set_cell(Vector2i(x,y),1, deepstone)

func irongen():
	for x in range(-width / 2, width / 2):
		for y in range(36, 100):
			var noise_val: float = noise.get_noise_2d(x, y)
			if y > 36 and rng.randf() < 0.0028 or (y > 64 and rng.randf() < 0.00028):
				set_cell(Vector2i(x, y), 1, iron)
				set_cell(Vector2i(x-1, y), 1, iron)
				set_cell(Vector2i(x+1, y), 1, iron)
				set_cell(Vector2i(x, y-1), 1, iron)
				set_cell(Vector2i(x, y+1), 1, iron)
				
func diamondgen():
	for x in range(-width / 2, width / 2):
		for y in range(64, 100):
			var noise_val: float = noise.get_noise_2d(x, y)
			if (y > 95 and rng.randf() < 0.0028) or (y > 90 and rng.randf() < 0.00028):
				set_cell(Vector2i(x, y), 1, diamond)
				set_cell(Vector2i(x-1, y), 1, diamond)
				set_cell(Vector2i(x+1, y), 1, diamond)
				set_cell(Vector2i(x, y-1), 1, diamond)
				set_cell(Vector2i(x, y+1), 1, diamond)

func tree():
	for x in range(-width/2, width/2):
		var ground = abs(noise.get_noise_2d(x,0) * 64) 
		for y in range(ground-1, ground+1):
			var noise_val:float = noise.get_noise_2d(x,y)
			if (get_cell_atlas_coords(Vector2i(x, y)) == grass and rng.randf() < 0.2):
				set_cell(Vector2i(x,y-1),1, Vector2i(7, 1))
				set_cell(Vector2i(x,y-2),1, Vector2i(7, 0))
				set_cell(Vector2i(x,y-3),1, Vector2i(7, 0))
				
func save_world():
	var save_data = {"worldgen": []}
	for x in range(-width/2, width/2):
		for y in range(-50, height):
			var current_tile = get_cell_atlas_coords(Vector2i(x, y))
			save_data["worldgen"].append({"x": current_tile.x, "y": current_tile.y})
	var save_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	var json_string = JSON.stringify(save_data)
	save_file.store_string(json_string)

func load_game():
	var count = 0
	var save_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	var json_string = save_file.get_as_text()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	var save_data = json.get_data()
	var worldgen = save_data.get("worldgen", [])
	for xx in range(-width/2, width/2):
		for yy in range(-50, height):
			var tile_data = worldgen[count]
			var x = tile_data.get("x")
			var y = tile_data["y"]
			set_cell(Vector2i(xx,yy),1, Vector2i(tile_data.x, tile_data.y))
			count+=1
			


			




	
	
				
				
					

	
				

			
		
		
