extends Node2D

var selected = false
var rest_point
var rest_node = []
export(String) var grup 
export(String) var tulisan 
signal dropin

func _ready() -> void:
	rest_node = get_tree().get_nodes_in_group(grup)
	rest_point = global_position
	$Sprite.text = tulisan

func _physics_process(delta: float) -> void:
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)


func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass
		
		


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			
			var shortest_dish = 75
			for child in rest_node:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dish:
					child.select()
					rest_point = child.global_position
					shortest_dish = distance
	


func pick_item():
	$Sprite/Area2D.input_pickable = false
	

func put_item():
	$Sprite/Area2D.input_pickable = true
	


func _on_Sprite_gui_input(event: InputEvent) -> void:
	
	
	if Input.is_action_pressed("click"):
		selected = true
