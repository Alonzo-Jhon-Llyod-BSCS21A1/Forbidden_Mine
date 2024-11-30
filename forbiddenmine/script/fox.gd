extends CharacterBody2D

var attackcd = true
@onready var character_body_2d: CharacterBody2D = $"." 
@onready var animated_sprite = $AnimatedSprite2D
var Health = 100

const SPEED = 100
const GRAVITY = 500  # Adjust this value for gravity strength

func _physics_process(delta: float) -> void:
	# Apply gravity to the enemy's vertical velocity if not on the floor
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0  # Reset vertical velocity when on the floor

	# Handle health and removal
	if Health <= 0:
		self.queue_free()

	# Move towards the player's position
	if GlobalVar.charposition != null:
		if position.distance_to(GlobalVar.charposition) > 2:
			var direction = (GlobalVar.charposition - position).normalized()
			velocity.x = direction.x * SPEED
			animated_sprite.flip_h = direction.x < 0  # Flip sprite based on direction

	# Play run animation while moving
	if velocity.x != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")

	# Check for player collisions and attack if in range
	for body in $Area2D.get_overlapping_bodies():
		if body.get("NAME") == "Player":
			if attackcd == true:
				knock_back(body)
				PlayerVar.player_health -= 3
				attackcd = false
				$Area2D/Timer.start()

	# Apply the calculated velocity (move and slide)
	move_and_slide()

# Knockback function to push the player
func knock_back(Player):
	var knock_back_direction = (velocity - Player.velocity).normalized() * 300
	Player.velocity.x = knock_back_direction.x

# Reset attack cooldown
func _on_attack_cd_timeout() -> void:
	attackcd = true
