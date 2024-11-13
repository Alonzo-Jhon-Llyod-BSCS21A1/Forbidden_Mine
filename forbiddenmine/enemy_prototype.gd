extends CharacterBody2D
const  NAME = "Enemy"
signal enemy_attack
var attackcd = true
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
		if position.distance_to(GlobalVar.charposition) > 2:
			var direction = (GlobalVar.charposition - position).normalized()
			velocity.x = direction.x * SPEED
			$AnimatedSprite2D.flip_h =direction.x < 0
			# Control vertical movement towards the player if needed
			if is_on_wall() and is_on_floor():
				velocity.y = -250
	for body in $Hitbox.get_overlapping_bodies():
		if body.get("NAME")== "Player":
			if attackcd == true:
				knock_back(body)
				attackcd = false
				$Hitbox/AttackCD.start()			
	move_and_slide()
	
func knock_back(Player):
	var knock_back_direction = (velocity - Player.velocity).normalized() * 300
	Player.velocity.x = knock_back_direction.x
	
func _on_attack_cd_timeout() -> void:
	attackcd = true
	pass # Replace with function body.
