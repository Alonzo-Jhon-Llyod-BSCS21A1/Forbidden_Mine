extends CharacterBody2D
const  NAME = "Player"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_bar: ProgressBar = $"../CanvasLayer/HealthBar"
@onready var character_body_2d: CharacterBody2D = $"."

const SPEED = 100.0
const JUMP_VELOCITY = -250.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	if velocity.x > 1 || velocity.x < -1:
		animated_sprite_2d.animation = "walk"
	else:
		animated_sprite_2d.animation = "default"
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.animation = "fall"

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.animation = "jump"

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 10)
	if Input.is_action_just_pressed("left"):
		animated_sprite_2d.flip_h = true
	if Input.is_action_just_pressed("right"):
		animated_sprite_2d.flip_h = false
		
	for body in $Area2D.get_overlapping_bodies():
		if body.get("NAME") == "Enemy":
			print("tinamaain")
			knock_back(body.velocity)
	move_and_slide()
	
func knock_back(enemyVelocity : Vector2):
	var knock_back_direction = (enemyVelocity - velocity).normalized() * 200
	velocity.x = knock_back_direction.x
		
