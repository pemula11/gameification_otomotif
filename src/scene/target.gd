extends Panel


func can_drop_data(position: Vector2, data) -> bool:
	print(data)
	var can_drop: bool = true
	return can_drop

func drop_data(position: Vector2, data) -> void:
	print("target has run")
