extends Node2D

var playing = "aa"
var next_playing = null



func _on_ChangeBTN_pressed() -> void:
	SoundManager.background_menu.play(0)
	playing = "background_menu"


func _on_ChangeBTN3_pressed() -> void:
	SoundManager.playin


func _on_ChangeBTN2_pressed() -> void:
	pass # Replace with function body.


func _on_ChangeBTN4_pressed() -> void:
	pass # Replace with function body.
