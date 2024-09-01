extends TileMap

@export var noise_height_text : NoiseTexture2D
var noise : Noise
var width : int = 5000
var	height : int = 5000
func _ready():
	noise = noise_height_text.noise
	generate_world()
	
func generate_world():
	randomize()
	noise.seed = randi()%10000
	for x in range(width):
		var ground = abs(noise.get_noise_2d(x,0) * 64)
		for y in range(ground, height):
			var noise_val:float = noise.get_noise_2d(x,y)
			if noise_val > -25 and y < 50:
				position = (Vector2i(x, y-1))
				if get_cell_atlas_coords(0, position) != Vector2i(0, 0) and get_cell_atlas_coords(0, position) != Vector2i(0, 1) and get_cell_atlas_coords(0, position) != Vector2i(6, 1):
					set_cell(0,Vector2(x,y),0,Vector2i(0, 0)) 
				else:
					if noise_val > 0.0 and y < 50:
						set_cell(0,Vector2(x,y),0,Vector2i(6, 1))
					else:
						set_cell(0,Vector2(x,y),0,Vector2i(0, 1))
	
	
	
	
	
	
	
	
				#if get_cell_atlas_coords(0, position) != Vector2i(0, 0) and get_cell_atlas_coords(0, position) != Vector2i(0, 1):#Check hindi dirt un tass
						#set_cell(0,Vector2(x,y),0,Vector2i(0, 0))
					#print(Vector2i(0, 0).y) #lalagay grass
				#elif get_cell_atlas_coords(0, position) != Vector2i(0, 0):
					#if get_cell_source_id(0, position) != 0: #check if grass ung taas
						#set_cell(0,Vector2(x,y),0,Vector2i(0, 1)) #lalagay dirt
				#elif get_cell_atlas_coords(0, position) != Vector2i(0, 1): #Check if dirt ung taas
					#set_cell(0,Vector2(x,y),0,Vector2i(0, 1)) #lalagay dirt
				#else:
					#set_cell(0,Vector2(x,y),0,Vector2i(0, 1))
		
				
				
				
	
	
