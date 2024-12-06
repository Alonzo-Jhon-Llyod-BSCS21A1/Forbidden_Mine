extends Area2D
var detected_objects = {}
func _process(_delta: float) -> void:
	for body in get_overlapping_bodies():
		var true_name = body.get("TRUENAME")
		if true_name and not detected_objects.has(true_name):
			detected_objects[true_name] = true
			print("Detected new object:", true_name)
			print("Position:", body.global_position)
			print("Other Info:", body.get("some_other_property"))  # Replace with other properties as needed
