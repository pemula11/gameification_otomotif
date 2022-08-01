extends Control

var item_in_hand = 0 setget set_item_in_hand
export var jumlah_item = 0
export (NodePath) onready var popup = get_node(popup) as Control
var anima := Anima.begin(self)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anima.then({node = $Button, animation = "tada", duration = 0.5 })
	
func set_item_in_hand(value):
	item_in_hand = value

func cek():
	#print(item_in_hand)
	item_in_hand = 0
	for child in $Item_manager.get_children():
		if child.is_in_group("zone"):
			
			if child.selected:
				
				item_in_hand += 1
	



func _on_Button_pressed() -> void:
	cek()
	print(item_in_hand)
	if item_in_hand == jumlah_item:
		
		popup.emit_signal("popupgambar")
	
	anima.play()
		
