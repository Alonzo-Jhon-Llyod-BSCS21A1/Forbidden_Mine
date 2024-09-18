extends TileMapLayer
@export var noise_height_text : NoiseTexture2D
const  SAVE_FILE_PATH = "user://SavingPrac.save"
var width = 10000
var height = 100
var noise : Noise

var grass = Vector2i(0,0)
var dirt = Vector2i(0,1)
var water = Vector2i(4, 10)
var stone = Vector2i(6, 1)
var deepstone = Vector2i(4,1)
var iron = Vector2i(4,8)
var diamond =  Vector2i(0,14)
var rng : RandomNumberGenerator 

func _ready() -> void:
	noise = noise_height_text.noise
	noise.seed = 1
	rng = RandomNumberGenerator.new()
	rng.seed = 1
	load_gamebinary()
	#load_game1()
	#load_game()
	"grassanddirt()
	stonegen()
	deepgen()
	irongen()
	diamondgen()
	watergen()
	waterfill()
	tree()
	#save_world()
	#save_world1()
	save_worldbinary()"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func grassanddirt():
	for x in range(-width/2, width/2):
		var ground = abs(noise.get_noise_2d(x,0) * 64)
		for y in range(ground, height):
			if y < 50:
				if (get_cell_atlas_coords(Vector2i(x, y-1)) != grass and get_cell_atlas_coords(Vector2i(x, y-1)) != dirt):
					set_cell(Vector2i(x,y),1, grass)
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
				
"func irongen():
	for x in range(-width/2, width/2):
		var ground = abs(noise.get_noise_2d(x,0) * 64) 
		for y in range(28, height):
			var noise_val:float = noise.get_noise_2d(x,y)
			if noise_val > 0:
				if (get_cell_atlas_coords(Vector2i(x-10, y)) != iron):
					if (get_cell_atlas_coords(Vector2i(x, y-10)) != iron):
						if (get_cell_atlas_coords(Vector2i(x-10, y-10)) != iron):
							if (get_cell_atlas_coords(Vector2i(x-5, y)) != iron):
								if (get_cell_atlas_coords(Vector2i(x, y-5)) != iron):
									if (get_cell_atlas_coords(Vector2i(x-5, y-5)) != iron):
										if (get_cell_atlas_coords(Vector2i(x-5, y+5)) != iron):
											set_cell(Vector2i(x,y),1, iron)"

"func irongen():
	for x in range(-width / 2, width / 2):
		var ground = abs(noise.get_noise_2d(x, 0) * 64)
		for y in range(ground+28, height):
			var noise_val: float = noise.get_noise_2d(x, y)
			if noise_val > 0:
				if not is_nearby_iron(x, y):
					set_cell(Vector2i(x, y), 1, iron)
					
func is_nearby_iron(x: int, y: int) -> bool:
	var offsets = [
		Vector2i(-10, 0), Vector2i(0, -10), Vector2i(-10, -10),
		Vector2i(-5, 0), Vector2i(0, -5), Vector2i(-5, -5),
		Vector2i(-5, 5)
	]
	
	for offset in offsets:
		if get_cell_atlas_coords(Vector2i(x, y) + offset) == iron:
			return true       
	return false"
	

func irongen():
	for x in range(-width / 2, width / 2):
		for y in range(36, 100):
			var noise_val: float = noise.get_noise_2d(x, y)
			if y > 36 and rng.randf() < 0.005 or (y > 64 and rng.randf() < 0.0005):
				set_cell(Vector2i(x, y), 1, iron)
				set_cell(Vector2i(x-1, y), 1, iron)
				set_cell(Vector2i(x+1, y), 1, iron)
				set_cell(Vector2i(x, y-1), 1, iron)
				set_cell(Vector2i(x, y+1), 1, iron)
				
func diamondgen():
	for x in range(-width / 2, width / 2):
		for y in range(64, 100):
			var noise_val: float = noise.get_noise_2d(x, y)
			if (y > 90 and rng.randf() < 0.005) or (y > 64 and rng.randf() < 0.0005):
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
				set_cell(Vector2i(x,y-1),1, Vector2i(0, 5))
				set_cell(Vector2i(x,y-2),1, Vector2i(0, 4))
				set_cell(Vector2i(x,y-3),1, Vector2i(0, 3))
				
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
			
@export var world_save: WorldSave

func save_world1():
	var world_save:WorldSave = WorldSave.new()
	var data: Array = []
	for x in range(-width/2, width/2):
		for y in range(-50, height):
			var current_tile = get_cell_atlas_coords(Vector2i(x, y))
			data.append({"x": x, "y": y, "tile_x": current_tile.x, "tile_y": current_tile.y})
	var path = "user://savegame.tres"
	world_save.tiles = data
	var result = ResourceSaver.save(world_save, "user://savegame.tres")
	if result == OK:
		print("World data saved successfully at: ", path)
	else:
		print("Failed to save world data: ", result)
			

func save_worldbinary():
	var data : Array = []
	for x in range(-width/2, width/2):
		for y in range(-50, height):
			var current_tile = get_cell_atlas_coords(Vector2i(x, y))
			data.append({"x": x, "y": y, "tile_x": current_tile.x, "tile_y": current_tile.y})
	var path = "user://savegame.dat"
	var databytes : Array = []
	databytes = var_to_bytes(data)
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_buffer(databytes)

		
func load_game1():
	var path = "user://savegame.tres"
	var world_save = ResourceLoader.load(path) as WorldSave
	if world_save:
		var data = world_save.tiles
		for tile_data in data:
			set_cell(Vector2i(tile_data["x"], tile_data["y"]), 1, Vector2i(tile_data["tile_x"], tile_data["tile_y"]))
		print("World data loaded successfully from: ", path)
	else:
		print("Failed to load world data.")
		
func load_gamebinary():
	var path = "user://savegame.dat"
	var file = FileAccess.open(path, FileAccess.READ)
	var databytes : Array = []
	databytes = file.get_buffer(file.get_length())
	var data : Array = []
	data = bytes_to_var(databytes)
	for tile_data in data:
		set_cell(Vector2i(tile_data["x"], tile_data["y"]), 1, Vector2i(tile_data["tile_x"], tile_data["tile_y"]))



	
	
				
				
					

	
				

			
		
		
