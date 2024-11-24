extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	
	for body in $Area2D.get_overlapping_bodies():
			if body.get("NAME") == "Player":
				self.queue_free()
				
	
