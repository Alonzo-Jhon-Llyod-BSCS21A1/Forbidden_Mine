extends CharacterBody2D

# Constants for movement
const SPEED = 300.0  # Speed for movement
const MOVE_TIME = 2.0  # Time for which the dragon moves in one direction before changing

var time_to_move = MOVE_TIME
var move_direction = Vector2(1, 0)  # Starting direction: right (X-axis)

# Range limits for movement
const X_MIN = 100
const X_MAX = 800
const Y_MIN = 100
const Y_MAX = 400

# Movement state (left-right, up, right-left, down)
var movement_state = 0  # 0 = left to right, 1 = up, 2 = right to left, 3 = down

func _ready() -> void:
	# Set initial velocity based on the starting direction
	velocity = move_direction * SPEED

func _physics_process(delta: float) -> void:
	# Move the dragon
	velocity.x = move_direction.x * SPEED
	velocity.y = move_direction.y * SPEED

	# Flip the sprite if moving right or left
	if move_direction.x > 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("default")
	elif move_direction.x < 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("default")
	# Check if it's time to switch direction
	
	if move_direction.y < 0:
		$AnimatedSprite2D.play("Soar")
	if move_direction.y > 0:
		$AnimatedSprite2D.play("Baba")
	
	time_to_move -= delta
	if time_to_move <= 0:
		switch_direction()
  
	# Keep the dragon within the defined boundaries for X and Y
	position.x = clamp(position.x, X_MIN, X_MAX)
	position.y = clamp(position.y, Y_MIN, Y_MAX)

	# Move and slide the dragon
	move_and_slide()

# Switch movement direction based on the current state
func switch_direction() -> void:
	time_to_move = MOVE_TIME  # Reset the timer

	# Switch to the next movement state
	movement_state += 1
	if movement_state > 3:
		movement_state = 0  # Loop back to left-right movement

	# Set the movement direction based on the current state
	match movement_state:
		0:  # Left to right (X direction)
			move_direction = Vector2(1, 0)
		1:  # Up (Y direction)
			move_direction = Vector2(0, 1)
		2:  # Right to left (X direction)
			move_direction = Vector2(-1, 0)
		3:  # Down (Y direction)
			move_direction = Vector2(0, -1)
