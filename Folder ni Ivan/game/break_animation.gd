extends Node2D

@onready var animated_sprite = $AnimatedSprite
@onready var timer = $Timer

func _ready():
	add_to_group("breakable")

func start_break_animation():
	animated_sprite.play("break")
	timer.start()  # Start the timer
	timer.connect("timeout", Callable(self, "_on_timeout"))


func _on_timeout():
	queue_free()
