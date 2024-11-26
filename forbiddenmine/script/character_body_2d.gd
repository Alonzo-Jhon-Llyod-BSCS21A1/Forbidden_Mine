extends CharacterBody2D

const NAME = "Player"
var attackcd = true
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var interact_ui = $Interact_UI
@onready var tile_map_layer: TileMapLayer = $"../TileMapLayer"

@export var SPEED = 200.0
const JUMP_VELOCITY = -250.0
const SWIM_SPEED = 250.0  # Reduced speed while swimming
const SWIM_GRAVITY = 50.0  # Reduced gravity while swimming
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var character_body_2d: CharacterBody2D = $"."

func _ready():
	GlobalVar.set_player_references(self)

func _physics_process(delta):
	var is_on_water = false
	
	# Check if the character is on water
	if GlobalVar.characterlocation != null:
		if tile_map_layer.get_cell_atlas_coords(GlobalVar.characterlocation) == Vector2i(0, 7):
			is_on_water = true
	
	# Handle jump, swim upward, and move downward (only while swimming)
	if Input.is_action_pressed("up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif is_on_water:
			velocity.y = -SWIM_SPEED  # Swim upward
	
	# Handle downward movement while swimming
	if is_on_water and Input.is_action_pressed("down"):
		velocity.y = SWIM_SPEED  # Swim downward
		
	if velocity.x > 1 || velocity.x < -1:
		animated_sprite_2d.animation = "swim" if is_on_water else "walk"
	else:
		animated_sprite_2d.animation = "default"

	
	# Handle gravity or swimming buoyancy
	if is_on_water:
		velocity.y = move_toward(velocity.y, 0, SWIM_GRAVITY * delta)
		animated_sprite_2d.animation = "swim"
	elif not is_on_floor():
		# Gravity effect and fall animation
		velocity.y += gravity * delta
		animated_sprite_2d.animation = "fall"  # Set fall animation if not on floor and not swimming
	
	# Handle horizontal movement
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * (SWIM_SPEED if is_on_water else SPEED)
		animated_sprite_2d.flip_h = direction < 0
		$Area2D/CollisionShape2D2.position.x = -1.5 if direction < 0 else 1.5
	else:
		velocity.x = move_toward(velocity.x, 0, 10)
		if not is_on_water and is_on_floor():
			animated_sprite_2d.animation = "default"

	# Handle attack input
	if Input.is_action_pressed("Attack"):
		animated_sprite_2d.animation = "sword_attack"
		for body in $Area2D.get_overlapping_bodies():
			if body.get("NAME") == "Enemy" and attackcd:
				body.Health -= 10
				knock_back(body)
				attackcd = false
				$AttackCd.start()

	# Apply movement
	move_and_slide()



# Apply item effects
func apply_item_effect(item):
	match item.get("effect", ""):
		"restore_health":
			var value = item.get("value", 0)
			PlayerVar.player_health += value
			print("Restored ", value, " health")
		"restore_stamina":
			var value = item.get("value", 0)
			GlobalVar.player_node.restore_stamina(value)
			print("Restored ", value, " stamina")
		"buff_speed":
			var value = item.get("value", 0)
			SPEED += value
			print("Speed increased by ", value, ". Current speed: ", SPEED)
		_:
			print("This item has no recognized effect!")

# Knockback logic for enemies
func knock_back(Enemy):
	var knock_back_direction = (velocity - Enemy.velocity).normalized() * 300
	Enemy.velocity.x = knock_back_direction.x

# Attack cooldown timeout
func _on_attack_cd_timeout() -> void:
	attackcd = true
