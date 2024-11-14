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
var snowgrass = Vector2i(0,3)
var snow = Vector2i(1,3)
var frostedleaf = Vector2i(6, 2)
var frostedoaklog = Vector2i(6,3)
var junglegrass =  Vector2i(0, 4)
var jungledirt = Vector2i(1,4)
var ashgrass = Vector2i(0,5)
var ash = Vector2i(1, 5)
var dirt = Vector2i(1,2)
var water = Vector2i(0, 7)
var sand = Vector2i(0, 0)
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
var rng : RandomNumberGenerator 

func _ready() -> void:
	SAVE_FILE_PATH += GlobalVar.new_world
	if GlobalVar.load == 0:
		load_worldbinary()
	if GlobalVar.load == 1:
		noise = noise_height_text.noise
		rng = RandomNumberGenerator.new()
		rng.seed = 1
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
					if (get_cell_atlas_coords(Vector2i(x, y-1)) != ashgrass and get_cell_atlas_coords(Vector2i(x, y-1)) != dirt):
						set_cell(Vector2i(x,y),1, ashgrass)
						if noise_val > 0:
							set_cell(Vector2i(x,y-1), 1, ash)
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
			var rng = rng.randf()
			if y < 200:
				if rng > .3:
					set_cell(Vector2i(x,y),1, stone)
				elif rng > .2:
					set_cell(Vector2i(x,y),1, hardstone)
				elif rng > .1:
					set_cell(Vector2i(x,y),1, diorite)
				else:
					set_cell(Vector2i(x,y),1, andesite)
			else:
				if rng > .4:
					set_cell(Vector2i(x,y),1, deepstone)
				elif rng > .3:
					set_cell(Vector2i(x,y),1, hardstone)
				elif rng > .2:
					set_cell(Vector2i(x,y),1, diorite)
				else:
					set_cell(Vector2i(x,y),1, andesite)
			if rng <0.7 and noise_val < -.3:
				set_cell(Vector2i(x,y),1, Vector2i(-1, -1))
			if rng < .05:
				set_cell(Vector2i(x, y), 1, iron)		
			if rng < .025 and y > 100:
				set_cell(Vector2i(x, y), 1, gold)
			if rng < .0125 and y > 250:
				set_cell(Vector2i(x, y), 1, diamond)	
			if rng < .00625:
				set_cell(Vector2i(x, y), 1, ruby)
			if rng < .003125:
				set_cell(Vector2i(x, y), 1, topaz)	
			if rng < .0015625:
				set_cell(Vector2i(x, y), 1, emerald)				

func tree():
	for x in range(-width/2, width/2):
		var ground = abs(noise.get_noise_2d(x,0) * 64) 
		for y in range(ground-1, ground+1):
			var noise_val:float = noise.get_noise_2d(x,y)
			if (get_cell_atlas_coords(Vector2i(x, y)) == grass and rng.randf() < 0.2):
				set_cell(Vector2i(x,y-1),1, oaklog)
				set_cell(Vector2i(x,y-2),1, leaf)
				set_cell(Vector2i(x,y-3),1, leaf)
			if (get_cell_atlas_coords(Vector2i(x,y)) == snowgrass and rng.randf() < 0.2):
				set_cell(Vector2i(x,y-1),1, frostedleaf)
				set_cell(Vector2i(x,y-2),1, frostedleaf)
				set_cell(Vector2i(x,y-3),1, frostedleaf)
			
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
	var val1 = rng.randi_range(-700, 800-143)
	var val2 = rng.randi_range(100, 150)
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
	var val1 = rng.randi_range(-2500, -1700-143)
	var val2 = rng.randi_range(100, 150)
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
	var val1 = rng.randi_range(800, 2500-143)
	var val2 = rng.randi_range(100, 150)
	var file = FileAccess.open("res://importantDungeons/lavaDungeon", FileAccess.READ)
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
		
func load_waterDungeon():
	var val1 = rng.randi_range(-1700, -700-143)
	var val2 = rng.randi_range(100, 150)
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


			




	
	
				
				
					

	
				

			
		
		
