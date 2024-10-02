class_name Player
extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var tilemap = $TileMapLayer  # Ensure this points to your TileMap node
var PlaceableBlockScene = preload("res://placeable.tscn")  # Ensure this is the correct path
@export var speed = 200
@export var jump = -200

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	GameManager.player = self

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		# Check if the mouse is close enough to the player
		var mouse_pos = get_global_mouse_position()
		if position.distance_to(mouse_pos) <= 100:  # Distance check
			var block_instance = PlaceableBlockScene.instantiate()
			var grid_size = 32
			
			# Calculate the block position directly based on the mouse position
			var block_position = Vector2(
				floor(mouse_pos.x / grid_size) * grid_size,
				floor(mouse_pos.y / grid_size) * grid_size
			)

			# Set the block's position to the snapped grid position
			block_instance.position = block_position
			
			# Add the block to the scene
			get_tree().current_scene.add_child(block_instance)


func get_block_at(tile_coords):
	for block in get_tree().current_scene.get_children():
		if block.is_in_group("breakable") and block.position == tilemap.map_to_world(tile_coords):
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
