extends CharacterBody2D

const SPEED = 50
const GRAVITY = 500  # Adjust this value for gravity strength
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	# Apply gravity to the enemy's vertical velocity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Move towards the player's position
	if GlobalVar.charposition != null:
		if position.distance_to(GlobalVar.charposition) > 1:
			var direction = (GlobalVar.charposition - position).normalized()
			velocity.x = direction.x * SPEED
			# Control vertical movement towards the player if needed
			if position.y < GlobalVar.charposition.y or is_on_floor():
				velocity.y = direction.y * SPEED
	
	move_and_slide()
