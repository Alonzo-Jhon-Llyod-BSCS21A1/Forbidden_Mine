extends CharacterBody2D

const SPEED = 300.0
const ACCEL = 2.0  # Changed to a float for consistency

var input: Vector2

func get_input() -> Vector2:
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")  # Assuming vertical movement actions
	return input
	
func _physics_process(delta: float) -> void:
	var player_input = get_input()  # Fixed typo
	
	velocity = lerp(velocity, player_input * SPEED, delta * ACCEL)  # Consistent with variable naming

	move_and_slide()
