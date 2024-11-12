extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_bar: ProgressBar = $"../CanvasLayer/HealthBar"
@onready var interact_ui = $Interact_UI
@onready var inventory_ui = $InventoryUI
@onready var inventory_hotbar = $Inventory_Hotbar 

func _ready():
	GlobalVar.set_player_references(self)

@export var SPEED = 200.0
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
	move_and_slide()
	
	#FOR INVENTORY

func _input(event):
	if event.is_action_pressed("UI_Inventory"):
		inventory_ui.visible = !inventory_ui.visible
		get_tree().paused = !get_tree().paused
		inventory_hotbar.visible = !inventory_hotbar.visible
		

func apply_item_effect(item):
	match item["effect"]:
		"Stamina":
			SPEED += 50
			print("Speed increase to ", SPEED)
		_:
			print("There is no effect for this Item!")
			
func use_hotbar_item(slot_index):
	if slot_index < GlobalVar.hotbar_inventory.size():
		var item = GlobalVar.hotbar_inventory[slot_index]
		if item != null:
			# Use item
			apply_item_effect(item)
			# Remove item
			item["quantity"] -= 1
			if item["quantity"] <= 0:
				GlobalVar.hotbar_inventory[slot_index] = null
				GlobalVar.remove_item(item["type"], item["effect"])
			GlobalVar.inventory_updated.emit()  

# Hotbar shortcuts
func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		# Then check for specific keys
		for i in range(GlobalVar.hotbar_size):
			# Assuming keys 1-5 are mapped to actions "hotbar_1" to "hotbar_5" in the Input Map
			if Input.is_action_just_pressed("hotbar_" + str(i + 1)):
				use_hotbar_item(i)
				break
