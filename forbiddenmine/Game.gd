extends Node2D
const BREAK_ANIMATION = preload("res://BreakAnimation.tscn")
@onready var timer: Timer = $Timer
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
var SAVE_FILE_PATH = "user://"
var tile_coords
var breakable_block
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SAVE_FILE_PATH += GlobalVar.new_world
	pass # Replace with function body.
	
func  _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_global_mouse_position()
		var local_position = tile_map_layer.to_local(mouse_pos)
		tile_coords = tile_map_layer.local_to_map(local_position)
		if (tile_map_layer.get_cell_source_id(Vector2i(tile_coords.x,tile_coords.y)) == -1):
			tile_map_layer.set_cell(Vector2i(tile_coords.x,tile_coords.y),1, Vector2i(7, 1))
			modify_tile_in_binary(tile_coords.x, tile_coords.y, 7, 1)
		elif (tile_map_layer.get_cell_source_id(Vector2i(tile_coords.x,tile_coords.y)) != -1):
			timer.start()
			breakable_block = BREAK_ANIMATION.instantiate()
			var block_position = tile_map_layer.map_to_local(tile_coords)
			breakable_block.global_position = tile_map_layer.to_global(block_position)
			add_child(breakable_block)
			print("Time Start")
	if event is InputEventMouseButton and event.is_released():
		timer.stop()
		if is_instance_valid(breakable_block):
			breakable_block.queue_free()
		print("Time Stopped")
		
func modify_tile_in_binary(x, y, tile_x, tile_y):
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ_WRITE)
	if file:
		var x_offset = x + 5000
		var y_offset = (y + 50) * 8
		var tile_index = (x_offset * 350 * 8) + y_offset
		print("Modifying tile at coordinates: ", x, y)
		print("Calculated tile index: ", tile_index)
		file.seek(tile_index)
		print("Current pointer position after seeking: ", file.get_position())
		file.store_32(tile_x)
		file.store_32(tile_y)
		file.close()
	else:
		print("Failed to open file at path:", SAVE_FILE_PATH)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	if is_instance_valid(breakable_block):
		breakable_block.queue_free()
	tile_map_layer.set_cell(Vector2i(tile_coords.x,tile_coords.y),1, Vector2i(-1, -1))
	modify_tile_in_binary(tile_coords.x, tile_coords.y, -1, -1)
	pass # Replace with function body.
