extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if PlayerVar.player_health != null:
		$HealthBar.value = PlayerVar.player_health
	if PlayerVar.player_hunger != null:
		$HungerBar.value =  PlayerVar.player_hunger
	if PlayerVar.player_thirst != null:
		$ThirstBar.value = PlayerVar.player_thirst
	pass

const PAUSE = preload("res://Scene/pause.tscn")

var pause_instance: Node = null  # To keep track of the pause scene instance

func _on_button_pressed() -> void:
	$"../CanvasLayer".visible = true
	get_tree().paused = true
