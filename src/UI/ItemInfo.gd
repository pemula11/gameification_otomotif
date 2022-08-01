extends NinePatchRect


export (NodePath) onready var item_name = get_node(item_name) as Label
export (NodePath) onready var image = get_node(image) as TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func display(text,pos):
	rect_global_position = pos.rect_size + pos.rect_global_position
	item_name.text = text
	show()
	
