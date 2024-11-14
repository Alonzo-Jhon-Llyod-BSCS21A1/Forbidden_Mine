extends CharacterBody2D
#const  NAME = "Enemy"
signal enemy_attack
@onready var character_body_2d: CharacterBody2D = $"."

const SPEED = 200
const GRAVITY = 500  # Adjust this value for gravity strength
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	# Move towards the player's position
	if GlobalVar.charposition != null:
		if position.distance_to(GlobalVar.charposition) > 1:
			var direction = (GlobalVar.charposition - position).normalized()
			#velocity = direction * SPEED
			velocity.x = direction.x * SPEED
			$AnimatedSprite2D.flip_h =direction.x < 0
						
	move_and_slide()
