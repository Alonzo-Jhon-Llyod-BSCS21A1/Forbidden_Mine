extends TileMapLayer
@export var noise_height_text : NoiseTexture2D
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"

var SAVE_FILE_PATH = "user://"
var width = 5000
var height = 300
var noise : Noise
var grass = Vector2i(0,2)
var  leaf = Vector2i(7, 0)
var oaklog = Vector2i(7,1)
var birchlog = Vector2i(7, 3)
var birchleaf = Vector2i(7, 2)
var snowgrass = Vector2i(0,3)
var snow = Vector2i(1,3)
var frostedleaf = Vector2i(6, 2)
var frostedoaklog = Vector2i(6,3)
var junglegrass =  Vector2i(0, 4)
var jungledirt = Vector2i(1,4)
var jungleleaf = Vector2i(6,0)
var jungleoaklog = Vector2i(6,1)
var ashgrass = Vector2i(0,5)
var ash = Vector2i(1, 5)
var dirt = Vector2i(1,2)
var water = Vector2i(0, 7)
var sand = Vector2i(0, 0)
var thincactus = Vector2i(6, 4)
var fatcactus = Vector2i(7, 4)
var stone = Vector2i(1, 0)
var deepstone = Vector2i(2,0)
var hardstone = Vector2i(3,0)
var diorite = Vector2i(4,0)
var andesite = Vector2i(5, 0)
var iron = Vector2i(0,1)
var gold = Vector2i(2, 1)
var diamond =  Vector2i(1,1)
var ruby = Vector2i(3,1)
var topaz = Vector2i(4,1)
var emerald = Vector2i(5,1)
var magma = Vector2i(3, 3)
var lava = Vector2i(1,7)
var rngs : RandomNumberGenerator 

func _ready() -> void:
	SAVE_FILE_PATH += GlobalVar.new_world
	if GlobalVar.load == 0:
		load_worldbinary()
		GlobalVar.load_inventory()
	if GlobalVar.load == 1:
		noise = noise_height_text.noise
		print(GlobalVar.Worldseed)
		if GlobalVar.Worldseed != null:
			noise.seed = GlobalVar.Worldseed
			print(GlobalVar.Worldseed)
			print("Not Null")
		else:
			noise.seed = randi()
			GlobalVar.Worldseed = noise.seed
			print("Null")
		noise = noise_height_text.noise
		if GlobalVar.Worldseed != null:
			rngs = RandomNumberGenerator.new()
			rngs.seed = GlobalVar.Worldseed
		grasses()
		stonegen()
		watergen()
		waterfill()
		sandgen()
		tree()
		load_vanillaDungeon()
		load_winterDungeon()
		load_lavaDungeon()
		load_waterDungeon()
		save_worldbinary()
		PlayerVar.save_player_data()
			
func grasses():
	for x in range(-width/2, width/2):
		var ground = abs(noise.get_noise_2d(x,0) * 64)
		for y in range(ground, 100):
			var noise_val: float = noise.get_noise_2d(x,y)
			if y < 50:
				if (x < -1700):
					if (get_cell_atlas_coords(Vector2i(x, y-1)) != snowgrass and get_cell_atlas_coords(Vector2i(x, y-1)) != dirt):
						set_cell(Vector2i(x,y),1, snowgrass)
						if noise_val > 0:
							set_cell(Vector2i(x,y-1), 1, snow)
					else:
						set_cell(Vector2i(x,y),1, dirt)
				elif (x < -700):
					if (get_cell_atlas_coords(Vector2i(x, y-1)) != junglegrass and get_cell_atlas_coords(Vector2i(x, y-1)) != jungledirt):
						set_cell(Vector2i(x,y),1, junglegrass)
					else:
						set_cell(Vector2i(x,y),1, jungledirt)
						
				elif (x < 800):
					if (get_cell_atlas_coords(Vector2i(x, y-1)) != grass and get_cell_atlas_coords(Vector2i(x, y-1)) != dirt):
						set_cell(Vector2i(x,y),1, grass)
					else:
						set_cell(Vector2i(x,y),1, dirt)
				elif (x < 1800):
					set_cell(Vector2i(x,y),1, sand)
				else:
					if (get_cell_atlas_coords(Vector2i(x, y-1)) != ashgrass and get_cell_atlas_coords(Vector2i(x, y-1)) != ash):
						set_cell(Vector2i(x,y),1, ashgrass)
					else:
						set_cell(Vector2i(x,y),1, ash)
					
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
			if (get_cell_atlas_coords(Vector2i(x, y)) == grass) or (get_cell_atlas_coords(Vector2i(x, y)) == junglegrass) or (get_cell_atlas_coords(Vector2i(x, y)) == snowgrass) or (get_cell_atlas_coords(Vector2i(x, y)) == snow): 
				if (get_cell_atlas_coords(Vector2i(x, y-1)) == water ):
					set_cell(Vector2i(x,y),1,sand)
					
func stonegen():
	var magma = Vector2i(3, 3)
	var lava = Vector2i(1, 7)
	
	for x in range(-width / 2, width / 2):
		# Use the noise function to generate a base ground height
		var ground = abs(noise.get_noise_2d(x, 0) * 64)
		
		for y in range(ground + 3, height):
			var noise_val: float = noise.get_noise_2d(x, y)
			var rng = rngs.randf()

			# Base stone generation
			if y < 200:
				if rng > 0.3:
					set_cell(Vector2i(x, y), 1, stone)
				elif rng > 0.2:
					set_cell(Vector2i(x, y), 1, hardstone)
				elif rng > 0.1:
					set_cell(Vector2i(x, y), 1, diorite)
				else:
					set_cell(Vector2i(x, y), 1, andesite)
			else:
				if rng > 0.4:
					set_cell(Vector2i(x, y), 1, deepstone)
				elif rng > 0.3:
					set_cell(Vector2i(x, y), 1, hardstone)
				elif rng > 0.2:
					set_cell(Vector2i(x, y), 1, diorite)
				else:
					set_cell(Vector2i(x, y), 1, andesite)	
			
			if y > 280 and rng > 0.8:  # Magma pools below a certain depth
				set_cell(Vector2i(x, y), 1, magma)
			elif y > 290 and rng < 0.8:  # Lava pools deeper underground
				set_cell(Vector2i(x, y), 1, lava)
			# Noise-based air pockets
			if rng < 0.7 and noise_val < -0.3:
				set_cell(Vector2i(x, y), 1, Vector2i(-1, -1))
			
			# Ore generation
			if rng < 0.05:
				set_cell(Vector2i(x, y), 1, iron)
			if rng < 0.025 and y > 100:
				set_cell(Vector2i(x, y), 1, gold)
			if rng < 0.0125 and y > 200:
				set_cell(Vector2i(x, y), 1, diamond)
			if rng < 0.00625 and y > 150:
				set_cell(Vector2i(x, y), 1, ruby)
			if rng < 0.003125 and y > 200:
				set_cell(Vector2i(x, y), 1, topaz)
			if rng < 0.0015625 and y > 250:
				set_cell(Vector2i(x, y), 1, emerald)
			
			# Noise-based air pocket refinement
			if rng < 0.9 and noise_val < -0.5:
				set_cell(Vector2i(x, y), 1, Vector2i(-1, -1))

	
func tree():
	for x in range(-width / 2, width / 2):
		var ground = abs(noise.get_noise_2d(x, 0) * 64)
		for y in range(ground - 1, ground + 1):
			var rng_val: float = rngs.randf()
			var is_grass = (get_cell_atlas_coords(Vector2i(x, y)) == grass)
			var is_snowgrass = (get_cell_atlas_coords(Vector2i(x, y)) == snowgrass)
			var is_junglegrass = (get_cell_atlas_coords(Vector2i(x, y)) == junglegrass)
			
			# Grass biome trees (Oak and Birch trees)
			if (is_grass or is_snowgrass) and rng_val < 0.2:
				var tree_height = randi_range(4, 6)
				var leaf_radius = 2
				var tree_noise = noise.get_noise_2d(x * 0.1, y * 0.1)
				if is_grass:
					if tree_noise < 0.0:
						for h in range(tree_height - 2):
							set_cell(Vector2i(x, y - h - 1), 1, birchlog)
						for lx in range(-leaf_radius, leaf_radius + 1):
							for ly in range(-leaf_radius, leaf_radius + 1):
								if lx * lx + ly * ly <= leaf_radius * leaf_radius:
									var leaf_pos = Vector2i(x + lx, y - (tree_height - 1) + ly - 1)
									if get_cell_atlas_coords(leaf_pos) == Vector2i(-1, -1):
										set_cell(leaf_pos, 1, birchleaf)
					else:
						for h in range(tree_height - 2):
							set_cell(Vector2i(x, y - h - 1), 1, oaklog)
						for lx in range(-leaf_radius, leaf_radius + 1):
							for ly in range(-leaf_radius, leaf_radius + 1):
								if lx * lx + ly * ly <= leaf_radius * leaf_radius:
									var leaf_pos = Vector2i(x + lx, y - (tree_height - 1) + ly - 1)
									if get_cell_atlas_coords(leaf_pos) == Vector2i(-1, -1):
										set_cell(leaf_pos, 1, leaf)
				else:
					for h in range(tree_height - 2):
						set_cell(Vector2i(x, y - h - 1), 1, frostedoaklog)
						for lx in range(-leaf_radius, leaf_radius + 1):
							for ly in range(-leaf_radius, leaf_radius + 1):
								if lx * lx + ly * ly <= leaf_radius * leaf_radius:
									var leaf_pos = Vector2i(x + lx, y - (tree_height - 1) + ly - 1)
									if get_cell_atlas_coords(leaf_pos) == Vector2i(-1, -1):
										set_cell(leaf_pos, 1, frostedleaf)

			elif is_junglegrass and rng_val < 0.5:
				var jungle_tree_height = randi_range(5, 10)
				var jungle_leaf_radius = randi_range(2, 4)
				for h in range(jungle_tree_height - 2):
					set_cell(Vector2i(x, y - h - 1), 1, jungleoaklog)  # Jungle oak tree trunk
				for lx in range(-jungle_leaf_radius, jungle_leaf_radius + 1):
					for ly in range(-jungle_leaf_radius, jungle_leaf_radius + 1):
						if lx * lx + ly * ly <= jungle_leaf_radius * jungle_leaf_radius:
							var leaf_pos = Vector2i(x + lx, y - (jungle_tree_height - 1) + ly - 1)
							if get_cell_atlas_coords(leaf_pos) == Vector2i(-1, -1):
								set_cell(leaf_pos, 1, jungleleaf)

			elif get_cell_atlas_coords(Vector2i(x, y)) == sand and rng_val < 0.03  and x > 800 and x < 1800:
				var cactus_height = randi_range(2, 4)
				for h in range(cactus_height):
					set_cell(Vector2i(x, y - h-1), 1, thincactus)
				if rng_val < 0.015:
					set_cell(Vector2i(x, y - cactus_height), 1, fatcactus)

			
func save_worldbinary():
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	for x in range(-width/2, width/2):
		for y in range(-50, height):
			var current_tile = get_cell_atlas_coords(Vector2i(x, y))
			if get_cell_source_id(Vector2i(x, y)) == -1:
				file.store_32(-1)
				file.store_32(-1)
			else:
				file.store_32(current_tile.x)
				file.store_32(current_tile.y)
	file.close()
	
func load_worldbinary():
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	for x in range(-width/2, width/2):
		for y in range(-50, height):
			var tile_x = file.get_32()
			var tile_y = file.get_32()
			if tile_x == -1 and tile_y == -1:
				continue
			else:
				set_cell(Vector2i(x, y), 1, Vector2i(tile_x, tile_y))
	file.close()
		
func load_vanillaDungeon():
	var val1 = rngs.randi_range(-700, 800-143)
	var val2 = rngs.randi_range(100, 150)
	var file = FileAccess.open("res://importantDungeons/vanillaDungeon", FileAccess.READ)
	if file:
		for x in range(val1, val1+143):
			for y in range(val2, val2+80):
				var tile_x = file.get_32()
				var tile_y = file.get_32()
				if tile_x == -1 and tile_y == -1:
					continue
				else:
					set_cell(Vector2i(x, y), 1, Vector2i(tile_x, tile_y))
		file.close()
	else:
		print("Failed to open file at path:", SAVE_FILE_PATH)
		
func load_winterDungeon():
	var val1 = rngs.randi_range(-2500, -1700-143)
	var val2 = rngs.randi_range(100, 150)
	var file = FileAccess.open("res://importantDungeons/winterDungeon", FileAccess.READ)
	if file:
		for x in range(val1, val1+143):
			for y in range(val2, val2+80):
				var tile_x = file.get_32()
				var tile_y = file.get_32()
				if tile_x == -1 and tile_y == -1:
					continue
				else:
					set_cell(Vector2i(x, y), 1, Vector2i(tile_x, tile_y))
		file.close()
	else:
		print("Failed to open file at path:", SAVE_FILE_PATH)
		
func load_lavaDungeon():
	var val1 = rngs.randi_range(800, 2500-143)
	var val2 = rngs.randi_range(100, 150)
	var file = FileAccess.open("res://importantDungeons/lavaDungeon", FileAccess.READ)
	if file:
		for x in range(val1, val1 + 143):
			for y in range(val2, val2 + 80):
				var tile_x = file.get_32()
				var tile_y = file.get_32()
				
				if tile_x == -1 and tile_y == -1:
					continue
				else:
					set_cell(Vector2i(x, y), 1, Vector2i(tile_x, tile_y))
					if tile_x == 4 and tile_y == 5:
						PlayerVar.lavaartifact = Vector2i(x, y)
						
				
		file.close()
	else:
		print("Failed to open file at path:", SAVE_FILE_PATH)
		
func load_waterDungeon():
	var val1 = rngs.randi_range(-1700, -700-143)
	var val2 = rngs.randi_range(100, 150)
	var file = FileAccess.open("res://importantDungeons/waterDungeon", FileAccess.READ)
	if file:
		for x in range(val1, val1+143):
			for y in range(val2, val2+80):
				var tile_x = file.get_32()
				var tile_y = file.get_32()
				if tile_x == -1 and tile_y == -1:
					continue
				else:
					set_cell(Vector2i(x, y), 1, Vector2i(tile_x, tile_y))
		file.close()
	else:
		print("Failed to open file at path:", SAVE_FILE_PATH)


			




	
	
				
				
					

	
				

			
		
		
