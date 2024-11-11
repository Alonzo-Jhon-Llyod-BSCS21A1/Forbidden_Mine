extends CharacterBody2D
const  NAME = "Enemy"
signal enemy_attack
@onready var character_body_2d: CharacterBody2D = $"."

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
			$AnimatedSprite2D.flip_h =direction.x < 0
			# Control vertical movement towards the player if needed
			if is_on_wall() and is_on_floor():
				velocity.y = -250
	#for body in $HitBox.get_overlapping_bodies():
		#if body.get("NAME")== "Player":
			#emit_signal("enemy_attack")
						
	move_and_slide()
