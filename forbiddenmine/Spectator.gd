extends CharacterBody2D

const SPEED = 3000.0

func _physics_process(delta: float) -> void:
	# Remove gravity effect (no gravity handling).
	velocity.y = 0  # Ensure no vertical movement caused by gravity.

	# Get the input for horizontal and vertical movement.
	var direction_x := Input.get_axis("ui_left", "ui_right")  # Horizontal movement (left, right)
	var direction_y := Input.get_axis("ui_up", "ui_down")    # Vertical movement (up, down)

	# Set the horizontal and vertical velocity based on input.
	velocity.x = direction_x * SPEED  # Move left/right.
	velocity.y = direction_y * SPEED  # Move up/down.

	# Apply movement without sliding (no gravity)
	move_and_slide()
