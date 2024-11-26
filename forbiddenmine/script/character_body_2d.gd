extends CharacterBody2D
const  NAME = "Player"
var attackcd = true
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_bar: ProgressBar = $"../CanvasLayer/HealthBar"
@onready var interact_ui = $Interact_UI
@onready var inventory_ui = $InventoryUI
@onready var inventory_hotbar = $Inventory_Hotbar 
@onready var tile_map_layer: TileMapLayer = $"../TileMapLayer"

func _ready():
	GlobalVar.set_player_references(self)

@export var SPEED = 200.0
const JUMP_VELOCITY = -250.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var character_body_2d: CharacterBody2D = $"."

func _physics_process(delta):
	var is_on_water = false
	
	if not GlobalVar.characterlocation == null:
		if(tile_map_layer.get_cell_atlas_coords(GlobalVar.characterlocation) == Vector2i(0, 7)):
			is_on_water = true
	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
				
	if velocity.x > 1 || velocity.x < -1:
		animated_sprite_2d.animation = "walk"
	else:
		animated_sprite_2d.animation = "default"
	# Add the gravity.
	if not is_on_floor() and not is_on_water:
		velocity.y += gravity * delta
		animated_sprite_2d.animation = "fall"
			
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 10)
	if Input.is_action_just_pressed("left"):
		animated_sprite_2d.flip_h = true
		$Area2D/CollisionShape2D2.position.x = -1.5
	if Input.is_action_just_pressed("right"):
		animated_sprite_2d.flip_h = false
	
	if Input.is_action_pressed("Attack"):
		animated_sprite_2d.animation = "sword_attack"
		for body in $Area2D.get_overlapping_bodies():
			if body.get("NAME") == "Enemy":
				if attackcd == true:
					body.Health -= 10
					knock_back(body)
					attackcd = false
					$AttackCd.start()
					
	move_and_slide()
	
	#FOR INVENTORY

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
				
func knock_back(Enemy):
	var knock_back_direction = (velocity - Enemy.velocity).normalized() * 300
	Enemy.velocity.x = knock_back_direction.x


func _on_attack_cd_timeout() -> void:
	attackcd = true
	pass # Replace with function body.

	
