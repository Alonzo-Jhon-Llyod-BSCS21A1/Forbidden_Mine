extends Node2D
const BREAK_ANIMATION = preload("res://Scene/BreakAnimation.tscn")
const enemy = preload("res://Scene/EnemyPrototype.tscn")
const itemdrops = preload("res://Scene/Inventory.tscn")
const recipe = preload("res://Scene/Recipe.tscn")
var recipe_instance = null
const  inventory = preload("res://Scene/Inventorty_UI.tscn")
var inventory_instance = null
@onready var timer: Timer = $Timer
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D



var SAVE_FILE_PATH = "user://"
var tile_coords
var breakable_block
var breakblock : Vector2i
var char_coords
var charlocal_position
# Called when the node enters the scene tree for the first time.

var item_to_tile_data = {
	"Stone": {"tile": Vector2i(1, 0), "durability": 50},
	"Ruby": {"tile": Vector2i(3, 1), "durability": 80},
	"Gold": {"tile": Vector2i(2, 1), "durability": 60},
	"Emerald": {"tile": Vector2i(5, 1), "durability": 85},
	"DeepStone": {"tile": Vector2i(2, 0), "durability": 70},
	"HardStone": {"tile": Vector2i(3, 0), "durability": 75},
	"Deorite": {"tile": Vector2i(4, 0), "durability": 65},
	"Andesite": {"tile": Vector2i(5, 0), "durability": 60},
	"JungleLeafBlock": {"tile": Vector2i(6, 0), "durability": 20},
	"Leaf Block": {"tile": Vector2i(7, 0), "durability": 15},
	"Jungle Log": {"tile": Vector2i(6, 1), "durability": 40},
	"Oak Log": {"tile": Vector2i(7, 1), "durability": 45},
	"Grass Block": {"tile": Vector2i(0, 2), "durability": 10},
	"Dirt": {"tile": Vector2i(1, 2), "durability": 10},
	"Frosted Leaf Block": {"tile": Vector2i(6, 2), "durability": 15},
	"Acacia Leaf Block": {"tile": Vector2i(7, 2), "durability": 20},
	"Snow Grass Block": {"tile": Vector2i(0, 3), "durability": 12},
	"Snow Block": {"tile": Vector2i(1, 3), "durability": 12},
	"Ice Block": {"tile": Vector2i(2, 3), "durability": 5},
	"Magma Block": {"tile": Vector2i(3, 3), "durability": 80},
	"Frosted Oak Log": {"tile": Vector2i(6, 3), "durability": 50},
	"Acacia Log": {"tile": Vector2i(7, 3), "durability": 45},
	"Jungle Grass Block": {"tile": Vector2i(0, 4), "durability": 10},
	"Jungle Dirt Block": {"tile": Vector2i(1, 4), "durability": 10},
	"Big Cactus Block": {"tile": Vector2i(6, 4), "durability": 5},
	"Small Cactus Block": {"tile": Vector2i(7, 4), "durability": 3},
	"Ash Grass Block": {"tile": Vector2i(0, 5), "durability": 15},
	"Ash Dirt Block": {"tile": Vector2i(1, 5), "durability": 10},
	"Emerald Block": {"tile": Vector2i(2, 5), "durability": 85},
	"Topaz Block": {"tile": Vector2i(3, 5), "durability": 75},
	"Ruby Block": {"tile": Vector2i(4, 5), "durability": 90},
	"Iron Block": {"tile": Vector2i(5, 5), "durability": 100},
	"Diamond Block": {"tile": Vector2i(6, 5), "durability": 120},
	"Gold Block": {"tile": Vector2i(7, 5), "durability": 80},
	"Obsidian Block": {"tile": Vector2i(1, 6), "durability": 200},
	"Andesite Block": {"tile": Vector2i(2, 6), "durability": 65},
	"Acacia Plank": {"tile": Vector2i(3, 6), "durability": 30},
	"Oak Block": {"tile": Vector2i(4, 6), "durability": 40},
	"Moss Stone Block": {"tile": Vector2i(5, 6), "durability": 60},
	"Sand Stone Block": {"tile": Vector2i(6, 6), "durability": 50},
	"Brick Block": {"tile": Vector2i(7, 6), "durability": 70},
	"Diorite Block": {"tile": Vector2i(2, 7), "durability": 65},
	"Frosted Oak Planks": {"tile": Vector2i(3, 7), "durability": 35},
	"Jungle Planks": {"tile": Vector2i(4, 7), "durability": 25},
	"Snowbrick": {"tile": Vector2i(5, 7), "durability": 50},
	"Deepstone Brick Block": {"tile": Vector2i(6, 7), "durability": 70},
	"Stone Brickblock": {"tile": Vector2i(7, 7), "durability": 75},
}


func _ready() -> void:
	SAVE_FILE_PATH += GlobalVar.new_world
	pass # Replace with function body.
	
func _input(event: InputEvent) -> void:
	if GlobalVar.characterlocation != null:
		if event is InputEventMouseButton and event.pressed:
			var mouse_pos = get_global_mouse_position()
			var local_position = tile_map_layer.to_local(mouse_pos)
			tile_coords = tile_map_layer.local_to_map(local_position)

			var min_x = GlobalVar.characterlocation.x - GlobalVar.action_distance <= tile_coords.x
			var max_x = GlobalVar.characterlocation.x + GlobalVar.action_distance >= tile_coords.x
			var min_y = GlobalVar.characterlocation.y - GlobalVar.action_distance <= tile_coords.y
			var max_y = GlobalVar.characterlocation.y + GlobalVar.action_distance >= tile_coords.y
			var touch_self = tile_coords.x == GlobalVar.characterlocation.x and tile_coords.y == GlobalVar.characterlocation.y

			if tile_map_layer.get_cell_source_id(Vector2i(tile_coords.x, tile_coords.y)) == -1 or \
			   tile_map_layer.get_cell_atlas_coords(Vector2i(tile_coords.x, tile_coords.y)) == Vector2i(0, 7):
				# Placing a block
				if min_x and max_x and min_y and max_y and not touch_self:
					if GlobalVar.Item_onhold != null:
						var item_hold = GlobalVar.inventory[GlobalVar.Item_onhold]
						if item_hold.has("type") and item_hold["type"] == "tiles":
							var item_name = item_hold["name"]
							if item_name in item_to_tile_data:
								var tile_data = item_to_tile_data[item_name]
								tile_map_layer.set_cell(Vector2i(tile_coords.x, tile_coords.y), 1, tile_data)
								modify_tile_in_binary(tile_coords.x, tile_coords.y, tile_data.x, tile_data.y)
								print("Placed block:", item_name, "at", tile_coords)
								GlobalVar.reduce_item_quantity(GlobalVar.Item_onhold)
							else:
								print("No tile data found for item:", item_name)
						else:
								print("Item is not of type 'tiles'.")
					else:
						print("No valid tile selected for placement.")

			elif tile_map_layer.get_cell_source_id(Vector2i(tile_coords.x, tile_coords.y)) != -1:
				# Breaking a block
				if min_x and max_x and min_y and max_y:
					timer.wait_time = 2
					timer.start()
					breakable_block = BREAK_ANIMATION.instantiate()
					var block_position = tile_map_layer.map_to_local(tile_coords)
					breakable_block.global_position = tile_map_layer.to_global(block_position)
					add_child(breakable_block)
					breakable_block.animated_sprite_2d.scale = tile_map_layer.scale
					breakable_block.animated_sprite_2d.speed_scale = 1 / timer.wait_time
					breakblock = tile_map_layer.get_cell_atlas_coords(Vector2i(tile_coords.x, tile_coords.y))
					audio_stream_player_2d.play()

		elif event is InputEventMouseButton and event.is_released():
			# Stop breaking
			timer.stop()
			if is_instance_valid(breakable_block):
				breakable_block.queue_free()
				
		if event.is_action_pressed("Craft"):
			if recipe_instance and is_instance_valid(recipe_instance):
				recipe_instance.queue_free()
				recipe_instance = null
			else :
				recipe_instance = recipe.instantiate()
				add_child(recipe_instance)
			
		if event.is_action_pressed("UI_Inventory"):
			if inventory_instance and is_instance_valid(inventory_instance):
				# Inventory is open, so close it
				inventory_instance.queue_free()
				inventory_instance = null
				print("Inventory closed.")
			else:
				# Inventory is closed, so open it
				inventory_instance = inventory.instantiate()
				add_child(inventory_instance)
				print("Inventory opened.")

			
		
func modify_tile_in_binary(x, y, tile_x, tile_y):
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ_WRITE)
	if file:
		var x_offset = x + 2500
		var y_offset = (y + 50) * 8
		var tile_index = (x_offset * 350 * 8) + y_offset
		file.seek(tile_index)
		file.store_32(tile_x)
		file.store_32(tile_y)
		file.close()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	GlobalVar.charposition = character_body_2d.global_position
	charlocal_position = to_local(GlobalVar.charposition) / tile_map_layer.scale
	GlobalVar.characterlocation = tile_map_layer.local_to_map(charlocal_position)
	
	for x in range(GlobalVar.characterlocation.x - 16, GlobalVar.characterlocation.x + 16):
		for y in range(GlobalVar.characterlocation.y - 16, GlobalVar.characterlocation.y+ 16):
			if (tile_map_layer.get_cell_atlas_coords(Vector2i(x,y)) ==  Vector2i(0,7)):
				if tile_map_layer.get_cell_source_id(Vector2i(x-1, y)) == -1:
					tile_map_layer.set_cell(Vector2i(x-1, y), 1, Vector2i(0,7))
					modify_tile_in_binary(x-1, y, 0, 7)
				if tile_map_layer.get_cell_source_id(Vector2i(x+1, y)) == -1:
					tile_map_layer.set_cell(Vector2i(x+1, y), 1, Vector2i(0,7))
					modify_tile_in_binary(x+1, y, 0, 7)
				if tile_map_layer.get_cell_source_id(Vector2i(x, y+1)) == -1:
					tile_map_layer.set_cell(Vector2i(x, y+1), 1, Vector2i(0,7))
					modify_tile_in_binary(x, y+1, 0, 7)
	pass

func _on_timer_timeout() -> void:
	if is_instance_valid(breakable_block):
		breakable_block.queue_free()
	if audio_stream_player_2d.playing:
		audio_stream_player_2d.stop()
	tile_map_layer.set_cell(Vector2i(tile_coords.x,tile_coords.y),1, Vector2i(-1, -1))
	modify_tile_in_binary(tile_coords.x, tile_coords.y, -1, -1)
	drop_item(breakblock)
	pass # Replace with function body.

# Function to drop an item based on the tile type
func drop_item(tile_data: Vector2i):
	var tile_to_item_data = {
		Vector2i(1, 0): {"name": "Stone", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/stone.png"), "effect": "restore_health", "value" : 50},
		
		Vector2i(3, 1): {"name": "Ruby", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/ruby_ore_drop.png")},
		
		Vector2i(2, 1): {"name": "Gold", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/gold_ore_drop.png")},
		
		Vector2i(5, 1): {"name": "Emerald", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(2, 0): {"name": "DeepStone", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/deepstone.png")},
		
		Vector2i(3, 0): {"name": "HardStone", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/hardstone.png")},
		
		Vector2i(4, 0): {"name": "Deorite", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/diorite_block.png")},
		
		Vector2i(5, 0): {"name": "Andesite", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/andesite_block.png")},
		
		Vector2i(6, 0): {"name": "JungleLeafBlock", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(7, 0): {"name": "Leaf Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(0, 1): {"name": "Iron Ore", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/iron_ore_drop.png")},
		
		Vector2i(1, 1): {"name": "Diamond Ore", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/diamond_ore_drop.png")},
		
		Vector2i(4, 1): {"name": "Topaz Ore", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/topaz_ore_drop.png")},
		
		Vector2i(6, 1): {"name": "Jungle Log", "type": "tiles", "texture": preload("res://Item assets/wood-tree-blocks/jungle_logs.png")},
		
		Vector2i(7, 1): {"name": "Oak Log", "type": "tiles", "texture": preload("res://Item assets/wood-tree-blocks/oak_logs.png")},
		
		Vector2i(0, 2): {"name": "Grass Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(1, 2): {"name": "Dirt", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(6, 2): {"name": "Frosted Leaf Block", "type": "tiles", "texture": preload("res://Item assets/wood-tree-blocks/frosted_oak_leaf.png")},
		
		Vector2i(7, 2): {"name": "Acacia Leaf Block", "type": "tiles", "texture": preload("res://Item assets/wood-tree-blocks/accacia_leaf.png")},
		
		Vector2i(0, 3): {"name": "Snow Grass Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(1, 3): {"name": "Snow Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(2, 3): {"name": "Ice Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(3, 3): {"name": "Magma Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/magma_block.png")},
		
		Vector2i(6, 3): {"name": "Frosted Oak Log", "type": "tiles", "texture": preload("res://Item assets/wood-tree-blocks/frosted_oak_logs.png")},
		
		Vector2i(7, 3): {"name": "Acacia Log", "type": "tiles", "texture": preload("res://Item assets/wood-tree-blocks/acacia_logs.png")},
		
		Vector2i(0, 4): {"name": "Jungle Grass Block", "type": "tiles", "texture": preload("res://Item assets/wood-tree-blocks/jungle_leaf.png")},
		
		Vector2i(1, 4): {"name": "Jungle Dirt Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(6, 4): {"name": "Big Cactus Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(7, 4): {"name": "Small Cactus Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(0, 5): {"name": "Ash Grass Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(1, 5): {"name": "Ash Dirt Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(2, 5): {"name": "Emerald Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_block.png")},
		
		Vector2i(3, 5): {"name": "Topaz Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/topaz_block.png")},
		
		Vector2i(4, 5): {"name": "Ruby Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/ruby_block.png")},
		
		Vector2i(5, 5): {"name": "Iron Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/iron_block.png")},
		
		Vector2i(6, 5): {"name": "Diamond Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/diamond_block.png")},
		
		Vector2i(7, 5): {"name": "Gold Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/gold_block.png")},
		
		Vector2i(1, 6): {"name": "Obsidian Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(2, 6): {"name": "Andesite Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},
		
		Vector2i(3, 6): {"name": "Acacia Plank", "type": "tiles", "texture": preload("res://Item assets/wood-tree-blocks/acacia_planks.png")},  
		
		Vector2i(4, 6): {"name": "Oak Block", "type": "tiles", "texture": preload("res://Item assets/brick-blocks/brickblock.png")},  
		
		Vector2i(5, 6): {"name": "Moss Stone Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},  
		
		Vector2i(6, 6): {"name": "Sand Stone Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},  
		
		Vector2i(7, 6): {"name": "Brick Block", "type": "tiles", "texture": preload("res://Item assets/brick-blocks/brickblock.png")},  
		
		Vector2i(2, 7): {"name": "Diorite Block", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")},  
		
		Vector2i(3, 7): {"name": "Frosted Oak Planks", "type": "tiles", "texture": preload("res://Item assets/wood-tree-blocks/frosted_oak_planks.png")},  
		
		Vector2i(4, 7): {"name": "Jungle Planks", "type": "tiles", "texture": preload("res://Item assets/wood-tree-blocks/jungle_planks.png")},  
		
		Vector2i(5, 7): {"name": "Snowbrick", "type": "tiles", "texture": preload("res://Item assets/brick-blocks/snowbrickblock.png")},  
		
		Vector2i(6, 7): {"name": "Deepstone Brick Block", "type": "tiles", "texture": preload("res://Item assets/brick-blocks/deepstonebrick.png")}, 
		 
		Vector2i(7, 7): {"name": "Stone Brickblock", "type": "tiles", "texture": preload("res://Item assets/brick-blocks/stonebrick.png")},  

	}
	if tile_data in tile_to_item_data:
		# Get the item data for this tile
		var item_data = tile_to_item_data[tile_data]
		var itemdrop = preload("res://Scene/Inventory.tscn").instantiate()
		itemdrop.item_name = item_data["name"]
		itemdrop.item_type = item_data["type"]
		itemdrop.item_texture = item_data["texture"]
		var block_position = tile_map_layer.map_to_local(tile_coords)
		itemdrop.global_position = tile_map_layer.to_global(block_position)
		add_child(itemdrop)
	else:
		print("wala boi", breakable_block)
		

func _on_spawn_timer_timeout() -> void:
	var enemytry = enemy.instantiate()
	enemytry.scale = Vector2(2, 2)
	add_child(enemytry)
	pass # Replace with function body.
	
	
