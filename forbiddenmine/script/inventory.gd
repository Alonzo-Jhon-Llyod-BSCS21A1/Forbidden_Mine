@tool
extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var item_type = ""
@export var item_name = ""
@export var item_texture: Texture
@export var item_effect = ""

var scene_path: String = "res://Scene/Inventory.tscn"
@onready var sprite_2d: Sprite2D = $Sprite2D

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		sprite_2d.texture = item_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	
	if Engine.is_editor_hint():
		sprite_2d.texture = item_texture	
	if player_in_range and Input.is_action_just_pressed("ui_add"):
		pickup_item()
		
func pickup_item():
	var item = {
		"quantity" : 1,
		"type" : item_type,
		"name" : item_name,
		"effect" : item_effect,
		"texture" : item_texture,
		"scene_path" : scene_path
	}
	
	if GlobalVar.player_node:
		GlobalVar.add_item(item, false)
		self.queue_free()
	
	
func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		player_in_range = true
		body.interact_ui.visible = true


func _on_area_2d_body_exited(body) -> void:
	if body.is_in_group("Player"):
		player_in_range = false
		body.interact_ui.visible = false
		
func set_item_data(data):
	item_type = data["type"]
	item_name = data["name"]
	item_effect = data["effect"]
	item_texture = data["texture"]
