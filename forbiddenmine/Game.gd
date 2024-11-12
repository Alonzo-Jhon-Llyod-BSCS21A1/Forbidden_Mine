extends Node2D
const BREAK_ANIMATION = preload("res://BreakAnimation.tscn")
const enemy = preload("res://EnemyPrototype.tscn")
@onready var timer: Timer = $Timer
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D

var SAVE_FILE_PATH = "user://"
var tile_coords
var breakable_block
var char_coords
var charlocal_position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemytry = enemy.instantiate()
	add_child(enemytry)
	SAVE_FILE_PATH += GlobalVar.new_world
	pass # Replace with function body.
	
func  _input(event: InputEvent) -> void:
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
			if tile_map_layer.get_cell_source_id(Vector2i(tile_coords.x, tile_coords.y)) == -1:
				if min_x and max_x and min_y and max_y and not touch_self:
					print(min_x, max_x, GlobalVar.characterlocation, tile_coords.x, tile_coords.y)
					tile_map_layer.set_cell(Vector2i(tile_coords.x, tile_coords.y), 1, Vector2i(6, 5))
					modify_tile_in_binary(tile_coords.x, tile_coords.y, 6, 5)
			elif (tile_map_layer.get_cell_source_id(Vector2i(tile_coords.x,tile_coords.y)) != -1):
				if min_x and max_x and min_y and max_y:
					timer.wait_time = .1
					timer.start()
					breakable_block = BREAK_ANIMATION.instantiate()
					var block_position = tile_map_layer.map_to_local(tile_coords)
					breakable_block.global_position = tile_map_layer.to_global(block_position)
					add_child(breakable_block)
					breakable_block.animated_sprite_2d.scale = tile_map_layer.scale
					breakable_block.animated_sprite_2d.speed_scale = 1/timer.wait_time
		if event is InputEventMouseButton and event.is_released():
			timer.stop()
			if is_instance_valid(breakable_block):
				breakable_block.queue_free()
		
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
	pass

func _on_timer_timeout() -> void:
	if is_instance_valid(breakable_block):
		breakable_block.queue_free()
	tile_map_layer.set_cell(Vector2i(tile_coords.x,tile_coords.y),1, Vector2i(-1, -1))
	modify_tile_in_binary(tile_coords.x, tile_coords.y, -1, -1)
	pass # Replace with function body.
