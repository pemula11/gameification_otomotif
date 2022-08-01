extends Position2D
export(String) var grup 
var selected = false


func _ready() -> void:
	add_to_group(grup)

#func _draw() -> void:
#	draw_circle(Vector2.ZERO, 75, Color.blanchedalmond)
	
func select():
	
	selected = true
	for child in get_tree().get_nodes_in_group(grup):
		print(child)
		child.deselect()
	modulate = Color.green

func deselect():
	
	modulate = Color.white
