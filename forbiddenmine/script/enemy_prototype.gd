extends CharacterBody2D

const NAME = "Enemy"
const TRUENAME = "Gago"

var attackcd = true
@onready var character_body_2d: CharacterBody2D = $"." 
var Health = 100

const SPEED = 50
const GRAVITY = 500  # Adjust this value for gravity strength
const JUMP_VELOCITY = -400.0
const MAX_DISTANCE_FROM_PLAYER = 2400.0  # Maximum distance before self-destruction

func _physics_process(delta: float) -> void:
	# Apply gravity to the enemy's vertical velocity
	if Health <= 0:
		self.queue_free()
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	# Check the distance to the player and free the enemy if too far
	if GlobalVar.charposition != null:
		if position.distance_to(GlobalVar.charposition) > MAX_DISTANCE_FROM_PLAYER:
			self.queue_free()
			return  # Exit function to avoid further execution
		
		# Move towards the player's position
		if position.distance_to(GlobalVar.charposition) > 2:
			var direction = (GlobalVar.charposition - position).normalized()
			velocity.x = direction.x * SPEED
			$AnimatedSprite2D.flip_h = direction.x < 0
			
			# Control vertical movement towards the player if needed
			if is_on_wall() and is_on_floor():
				velocity.y = JUMP_VELOCITY
	
	# Handle collision and attack logic
	for body in $Hitbox.get_overlapping_bodies():
		if body.get("NAME") == "Player":
			if attackcd:
				knock_back(body)
				PlayerVar.player_health -= 3
				attackcd = false
				$Hitbox/AttackCD.start()
	
	move_and_slide()

func knock_back(Player):
	var knock_back_direction = (velocity - Player.velocity).normalized() * 300
	Player.velocity.x = knock_back_direction.x

func _on_attack_cd_timeout() -> void:
	attackcd = true
