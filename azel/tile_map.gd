extends TileMap

@export var noise_height_text : NoiseTexture2D
var noise : Noise
var width : int = 100
var	height : int = 100
var noise_values = []

func _ready():
	noise = noise_height_text.noise
	generate_world()
	willitlag()
	
func generate_world():
	#noise.seed = randi()%10000
	for x in range(width):
		var ground = abs(noise.get_noise_2d(x,0) * 64)
		for y in range(ground, height):
			var noise_val:float = noise.get_noise_2d(x,y)
			if noise_val > -25 and y < 50:
				var positionGrass = (Vector2i(x, y-1))
				noise_values.append(noise_val)
				if noise_val > .2 and y > 16: #water
					set_cell(0,Vector2(x,y),0,Vector2i(4, 10))
					
				elif  get_cell_atlas_coords(0, positionGrass) != Vector2i(0, 0) and\
					get_cell_atlas_coords(0, positionGrass) != Vector2i(0, 1) and\
					get_cell_atlas_coords(0, positionGrass) != Vector2i(6, 1):
					set_cell(0,Vector2(x,y),0,Vector2i(0, 0))
				
					#set_cell(0,Vector2(x,y),0,Vector2i(0, 0)) 
				elif noise_val > .1 and y > 32:
					set_cell(0,Vector2(x,y),0,Vector2i(4, 2))
				
				else:
					position = (Vector2i(x, y-3))
					if get_cell_atlas_coords(0, position) == Vector2i(0, 0) or get_cell_source_id(0, position) == -1:
						set_cell(0,Vector2(x,y),0,Vector2i(0, 1))
					else:
						set_cell(0,Vector2(x,y),0,Vector2i(6, 1))
			else:
				set_cell(0,Vector2(x,y),0,Vector2i(1, 14))
						
func willitlag():
	for x in range(width):	
		for y in range(16, 32):
			position = (Vector2i(x, y))
			var positionyplus = (Vector2i(x, y+1))
			var positionxminus = (Vector2i(x-1, y))
			var positionxplus = (Vector2i(x+1, y))
			if get_cell_atlas_coords(0, position) == Vector2i(4, 10):
				if get_cell_source_id(0, positionyplus) == -1:
					set_cell(0, Vector2(positionyplus), 0, Vector2i(4, 10))
				if get_cell_source_id(0, positionxminus) == -1:
					set_cell(0, Vector2(positionxminus), 0, Vector2i(4, 10))
				if get_cell_source_id(0, positionxplus) == -1:
					set_cell(0, Vector2(positionxplus), 0, Vector2i(4, 10))
			
			
				

										

	
	
	
	
	
	
	
	
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
		
				
				
				
	
	
