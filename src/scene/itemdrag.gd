extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("DRAGGABLE")

func get_drag_data(position: Vector2):
	print("drag has run")
	return self
