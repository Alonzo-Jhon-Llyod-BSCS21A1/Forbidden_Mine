extends Node2D
const BREAK_ANIMATION = preload("res://BreakAnimation.tscn")
const enemy = preload("res://EnemyPrototype.tscn")
const itemdrop = preload("res://Inventory.tscn")
const recipe = preload("res://Recipe.tscn")
@onready var timer: Timer = $Timer
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D

var SAVE_FILE_PATH = "user://"
var tile_coords
var breakable_block
var breakblock : Vector2i
var char_coords
var charlocal_position
# Called when the node enters the scene tree for the first time.

var item_to_tile_data = {
	"Stone": Vector2i(1, 0),
	"Ruby": Vector2i(3, 1),
	"Gold": Vector2i(2, 1),
	"Emerald": Vector2i(5, 1)
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
					if GlobalVar.Item_onhold != null and GlobalVar.Item_onhold["type"] == "tiles":
						var item_name = GlobalVar.Item_onhold["name"]
						if item_name in item_to_tile_data:
							var tile_data = item_to_tile_data[item_name]
							tile_map_layer.set_cell(Vector2i(tile_coords.x, tile_coords.y), 1, tile_data)
							modify_tile_in_binary(tile_coords.x, tile_coords.y, tile_data.x, tile_data.y)
							print("Placed block:", item_name, "at", tile_coords)
							GlobalVar.reduce_item_quantity(GlobalVar.Item_onhold)
						else:
							print("No tile data found for item:", item_name)
					else:
						print("No valid tile selected for placement.")

			elif tile_map_layer.get_cell_source_id(Vector2i(tile_coords.x, tile_coords.y)) != -1:
				# Breaking a block
				if min_x and max_x and min_y and max_y:
					timer.wait_time = .1
					timer.start()
					breakable_block = BREAK_ANIMATION.instantiate()
					var block_position = tile_map_layer.map_to_local(tile_coords)
					breakable_block.global_position = tile_map_layer.to_global(block_position)
					add_child(breakable_block)
					breakable_block.animated_sprite_2d.scale = tile_map_layer.scale
					breakable_block.animated_sprite_2d.speed_scale = 1 / timer.wait_time
					breakblock = tile_map_layer.get_cell_atlas_coords(Vector2i(tile_coords.x, tile_coords.y))

		elif event is InputEventMouseButton and event.is_released():
			# Stop breaking
			timer.stop()
			if is_instance_valid(breakable_block):
				breakable_block.queue_free()
				
		if event.is_action_pressed("Craft"):
			var recipe_ins = recipe.instantiate()
			add_child(recipe_ins)
		
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
func _process(delta: float) -> void:
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
	tile_map_layer.set_cell(Vector2i(tile_coords.x,tile_coords.y),1, Vector2i(-1, -1))
	modify_tile_in_binary(tile_coords.x, tile_coords.y, -1, -1)
	var itemdrop = itemdrop.instantiate()
	drop_item(breakblock)
	pass # Replace with function body.

# Function to drop an item based on the tile type
func drop_item(tile_data: Vector2i):
	var tile_to_item_data = {
		Vector2i(1, 0): {"name": "Stone", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/stone.png")},
		Vector2i(3, 1): {"name": "Ruby", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/ruby_ore_drop.png")},
		Vector2i(2, 1): {"name": "Gold", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/gold_ore_drop.png")},
		Vector2i(5, 1): {"name": "Emerald", "type": "tiles", "texture": preload("res://Item assets/stone-ore-blocks/emerald_ore_drop.png")}
	}
	if tile_data in tile_to_item_data:
		# Get the item data for this tile
		var item_data = tile_to_item_data[tile_data]
		var itemdrop = preload("res://Inventory.tscn").instantiate()
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
