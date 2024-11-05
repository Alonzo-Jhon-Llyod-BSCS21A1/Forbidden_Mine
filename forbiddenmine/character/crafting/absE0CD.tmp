extends Sprite2D

@export var item : crafttest

func _ready():
	texture = item.icon

func _on_player_entered(body):
	body.add_item(item)
	queue_free()
