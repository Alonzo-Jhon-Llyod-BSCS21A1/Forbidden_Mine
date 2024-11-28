extends CharacterBody2D

@export var SPECTATOR_SPEED = 800.0  # Increased speed for fast movement
var spectator_mode = true  # Set true to enable spectator mode by default

func _physics_process(delta):
	if spectator_mode:
		handle_spectator_movement(delta)

func handle_spectator_movement(delta):
	# Capture movement input for free movement
	var direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()

	# Apply movement with spectator speed
	velocity = direction * SPECTATOR_SPEED

	# Apply the movement directly (no collision)
	global_position += velocity * delta
