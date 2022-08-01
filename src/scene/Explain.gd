extends Control

const back = preload("res://src/button/Back.tscn")
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var materiExplain = "kelistrikan"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	SoundManager.playing_explain()
	var fadein := Anima.begin(self)
	fadein.then({ animation = "fade in", duration = 0.7 })
	
	fadein.play()
	var new_dialog = Dialogic.start(materiExplain)
	add_child(new_dialog)


