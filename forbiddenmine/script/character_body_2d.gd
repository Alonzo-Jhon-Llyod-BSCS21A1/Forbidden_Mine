extends CharacterBody2D

const NAME = "Player"
var attackcd = true
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var interact_ui = $Interact_UI
@onready var tile_map_layer: TileMapLayer = $"../TileMapLayer"
@onready var footstep_sound: AudioStreamPlayer2D = $FootstepSound
@export var SPEED = 200.0
const JUMP_VELOCITY = -250.0
const SWIM_SPEED = 250.0  # Reduced speed while swimming
const SWIM_GRAVITY = 50.0  # Reduced gravity while swimming
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var character_body_2d: CharacterBody2D = $"."
var rngs : RandomNumberGenerator 
func _ready():
	if GlobalVar.Worldseed != null:
		rngs = RandomNumberGenerator.new()
		rngs.seed = GlobalVar.Worldseed
	GlobalVar.set_player_references(self)
	if GlobalVar.load == 0:
		PlayerVar.load_player_data()
	else:
		spawn_player_randomly()

func _physics_process(delta):
	var is_on_water = false
	
	# Check if the character is on water
	if GlobalVar.characterlocation != null:
		if tile_map_layer.get_cell_atlas_coords(GlobalVar.characterlocation) == Vector2i(0, 7):
			is_on_water = true

	# Slow down if thirst or hunger is zero
	var effective_speed = SPEED
	if PlayerVar.player_thirst == 0:
		effective_speed *= 0.5  # Reduce speed by 50% if thirst is zero
	if PlayerVar.player_hunger == 0:
		effective_speed *= 0.75  # Reduce speed by 25% if hunger is zero

	# Handle jump, swim upward, and move downward (only while swimming)
	if Input.is_action_pressed("up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif is_on_water:
			velocity.y = -SWIM_SPEED  # Swim upward

	# Handle downward movement while swimming
	if is_on_water and Input.is_action_pressed("down"):
		velocity.y = SWIM_SPEED  # Swim downward

	if velocity.x > 1 or velocity.x < -1:
		animated_sprite_2d.animation = "swim" if is_on_water else "walk"
		if is_on_floor():
			if !footstep_sound.playing:
				footstep_sound.play()
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
		velocity.x = direction * (SWIM_SPEED if is_on_water else effective_speed)
		animated_sprite_2d.flip_h = direction < 0
		$Area2D/CollisionShape2D2.position.x = -1.5 if direction < 0 else 1.5
	else:
		velocity.x = move_toward(velocity.x, 0, 10)
		footstep_sound.stop()
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
	# Reduce hunger and thirst
	PlayerVar.reduce_hunger_and_thirst(delta)
	PlayerVar.check_and_save_player_data()

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
	
func spawn_player_randomly():
	var spawn_area_min = Vector2(-48000, -1)
	var spawn_area_max = Vector2(48000, -1)
	var random_x = rngs.randf_range(spawn_area_min.x, spawn_area_max.x)
	var random_y = spawn_area_min.y
	self.global_position = Vector2(random_x, random_y)
