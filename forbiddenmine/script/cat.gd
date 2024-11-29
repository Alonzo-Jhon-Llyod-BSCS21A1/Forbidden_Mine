extends CharacterBody2D

# Speed of movement
@export var SPEED: float = 50.0

# Jump strength when hitting walls and the floor
@export var JUMP_STRENGTH: float = 250.0

# Gravity applied when not on the floor
@export var GRAVITY: float = 500.0  # Customize gravity as needed

# Durations for idle and walk states
@export var idle_duration: float = 3.0
@export var walk_duration: float = 5.0

# Attack cooldown
@export var attack_cd_duration: float = 1.0

# State variables
var attackcd: bool = true   # Controls whether the enemy can attack
var is_walking: bool = true  # Whether the enemy is in the walking state
var time_in_state: float = 0.0  # Tracks the time spent in the current state

var teleport_area_min: Vector2 = Vector2(-100, 0)  # Example min X position
var teleport_area_max: Vector2 = Vector2(100, 0)   # Example max X position

# Called when the node is added to the scene.
func _ready() -> void:
	# Start with idle state duration
	time_in_state = idle_duration  # Start with idle duration

# Handle movement, animation, and attack logic
func _process(delta: float) -> void:
	# Update the time spent in the current state
	time_in_state -= delta
	
	# Switch between idle and walk based on the time spent
	if time_in_state <= 0.0:
		if is_walking:
			# Transition to idle state
			is_walking = false
			$AnimatedSprite2D.play("idle")  # Play the idle animation
			time_in_state = idle_duration  # Set the next idle duration
		else:
			# Transition to walk state
			is_walking = true
			$AnimatedSprite2D.play("walk")  # Play the walk animation
			time_in_state = walk_duration  # Set the next walk duration

	# If the cat is walking, move towards the player
	if is_walking and GlobalVar.charposition != null:
		# Calculate the direction towards the player
		var direction = (GlobalVar.charposition - position).normalized()
		velocity.x = direction.x * SPEED
		$AnimatedSprite2D.flip_h = direction.x < 0  # Flip sprite based on direction

		# Handle jumping if on a wall and the floor
		if is_on_wall() and is_on_floor():
			velocity.y = -JUMP_STRENGTH

	# Gravity: if not on the floor, apply gravity to avoid floating
	if not is_on_floor():
		velocity.y += GRAVITY * delta  # Apply gravity each frame

	# If the cat is on the floor, stop vertical movement
	if is_on_floor():
		velocity.y = 0  # Reset vertical velocity when on the floor

	# Apply movement using the built-in velocity (no argument needed)
	move_and_slide()

	# Handle attack logic when overlapping the player
	for body in $Area2D.get_overlapping_bodies():
		if body.get("NAME") == "Player":
			if attackcd:
				knock_back(body)  # Apply knockback to the player
				PlayerVar.player_health -= 3  # Reduce player's health
				attackcd = false
				$Area2D/Timer.start()  # Start the attack cooldown timer

# Apply knockback to the player
func knock_back(player_body: Node2D) -> void:
	# Apply knockback to the player (customize as needed)
	var knockback_force = 200
	var knockback_dir = (player_body.position - position).normalized()
	if player_body.has_method("apply_knockback"):
		player_body.apply_knockback(knockback_dir * knockback_force)

# Reset the attack cooldown
func _on_AttackCD_timeout() -> void:
	attackcd = true
