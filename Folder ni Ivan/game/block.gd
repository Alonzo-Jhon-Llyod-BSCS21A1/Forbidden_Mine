extends Node2D

func place_block(position: Vector2):
	self.position = position
	get_parent().add_child(self)
	
func break_block():
	# Optional: Play a breaking animation or sound here
	queue_free()  # Remove the block from the scene
