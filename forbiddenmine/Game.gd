extends Node2D
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
var SAVE_FILE_PATH = "user://"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SAVE_FILE_PATH += GlobalVar.new_world
	pass # Replace with function body.
	
func  _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_global_mouse_position()
		var local_position = tile_map_layer.to_local(mouse_pos)
		var tile_coords = tile_map_layer.local_to_map(local_position)
		if (tile_map_layer.get_cell_source_id(Vector2i(tile_coords.x,tile_coords.y)) == -1):
			tile_map_layer.set_cell(Vector2i(tile_coords.x,tile_coords.y),1, Vector2i(7, 1))
			modify_tile_in_binary(tile_coords.x, tile_coords.y, 7, 1)

func modify_tile_in_binary(x, y, tile_x, tile_y):
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ_WRITE)
	if file:
		var x_offset = x + 5000
		var y_offset = (y + 50) * 8
		var tile_index = (x_offset * 150 * 8) + y_offset
		print("Modifying tile at coordinates: ", x, y)
		print("Calculated tile index: ", tile_index)
		file.seek(tile_index)
		print("Current pointer position after seeking: ", file.get_position())
		file.store_32(tile_x)
		file.store_32(tile_y)
		file.seek(tile_index)
		var check_x = file.get_32()
		var check_y = file.get_32()
		print("Stored values: ", check_x, ", ", check_y)
		
		file.close()
	else:
		print("Failed to open file at path:", SAVE_FILE_PATH)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
