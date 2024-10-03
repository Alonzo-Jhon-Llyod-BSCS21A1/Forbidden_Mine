class_name Player
extends CharacterBody2D

var break_animation_scene = preload("res://BreakAnimation.tscn")
@onready var sprite = $Sprite2D
@onready var tilemap = $TileMapLayer
var PlaceableBlockScene = preload("res://placeable.tscn")  
@export var speed = 200
@export var jump = -200
var hold_time_threshold = 0.5  
var holding_time = 0.0
var is_holding = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	GameManager.player = self

func _input(event):
	if event is InputEventMouseButton:
		print("Mouse button pressed")
		if event.pressed:
			is_holding = true
			holding_time = 0.0
		elif event.released:
			print("Mouse button released")
			if is_holding and holding_time >= hold_time_threshold:
				var mouse_pos = get_global_mouse_position()
				var local_position = tilemap.to_local(mouse_pos)
				var tile_coords = tilemap.local_to_map(local_position)

				if tilemap.get_cell_source_id(Vector2i(tile_coords.x, tile_coords.y)) != -1:
					print("Breaking tile at:", tile_coords)
					break_tile(tile_coords)  # Call break_tile function

		reset_holding()  # Reset holding state

func break_tile(tile_coords):
	# Replace the tile with a breakable animation
	var breakable_block = break_animation_scene.instantiate()
	breakable_block.position = tilemap.map_to_world(tile_coords)
	get_tree().current_scene.add_child(breakable_block)
	breakable_block.start_break_animation()  # Call the animation method

	# Remove the tile from the TileMap
	tilemap.set_cell(Vector2i(tile_coords.x, tile_coords.y), -1)  # -1 removes the tile

func reset_holding():
	is_holding = false  # Reset holding state
	holding_time = 0.0  # Reset holding time

func _process(delta):
	if is_holding:
		holding_time += delta
		print("Holding time:", holding_time)

func get_breakable_block_at(tile_coords):
	var block_pos = tilemap.map_to_world(tile_coords)
	for block in get_tree().get_nodes_in_group("breakable"):
		if block.position == block_pos:
			return block
	return null

func _physics_process(delta):
	# Gravity handling
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump handling
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump

	# Movement handling
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

	# Check for player death condition
	if position.y >= 600:
		die()

func die():
	GameManager.respawn_player()
