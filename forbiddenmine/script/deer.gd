extends CharacterBody2D

@export var speed: float = 25.0  # Movement speed
@export var teleport_time: float = 3.0  # Time before teleporting (seconds)
@export var teleport_area_min: Vector2 = Vector2(100, 100)  # Min area for teleport
@export var teleport_area_max: Vector2 = Vector2(700, 500)  # Max area for teleport
@export var gravity: float = 500.0  # Gravity strength

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var teleport_timer: Timer = $Timer  # Timer node
@onready var teleport_area: Area2D = $Area2D  # Area2D for collision detection

var is_teleporting: bool = false  # To check if the deer is in the teleport state

func _ready() -> void:
	# Start the walking animation
	sprite.play("walk")
	
	# Set up the timer
	teleport_timer.wait_time = teleport_time  # Set the teleport time
	teleport_timer.one_shot = true  # Ensure the timer triggers only once per teleport
	teleport_timer.connect("timeout", Callable(self, "_on_teleport_timeout"))  # Connect the signal correctly
	
	# Start the teleport timer
	teleport_timer.start()

func _process(delta: float) -> void:
	# If the deer is not teleporting, move it
	if not is_teleporting:
		# Move to the right normally
		_move_normal(delta)
		
		# Apply gravity to the velocity (the internal velocity of CharacterBody2D)
		velocity.y += gravity * delta  # Increase the vertical velocity by gravity each frame
		
		# Move the character using move_and_slide, without passing arguments
		move_and_slide()  # This uses the velocity property internally

# Function to move normally (without following the player)
func _move_normal(delta: float) -> void:
	velocity.x = speed  # Move right at the specified speed

# This function will be called when the teleport timer times out
func _on_teleport_timeout() -> void:
	_teleport()  # Teleport the deer

# Teleport function
func _teleport() -> void:
	# Stop the walking animation before teleporting
	sprite.stop()
	
	# Set the teleporting state to true
	is_teleporting = true
	
	# Generate a random position within the teleport area (X value)
	var new_x = randf_range(teleport_area_min.x, teleport_area_max.x)
	
	# Position the Area2D at the new X position
	teleport_area.position = Vector2(new_x, teleport_area.position.y)
	
	# Set the Y position to -1
	position = Vector2(new_x, -1)  # Y position is set to -1
	
	# Play a teleport effect or sound here (optional)
	print("Deer teleported to position: ", position)
	
	# After teleporting, restart the walking animation
	sprite.play("walk")
	
	# Set the teleporting state back to false
	is_teleporting = false
	
	# Restart the teleport timer
	teleport_timer.start()  # Start the timer again to wait for the next teleport
