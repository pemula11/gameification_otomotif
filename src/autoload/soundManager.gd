extends Node2D

export(NodePath) onready var background_menu = get_node(background_menu) as AudioStreamPlayer
export(NodePath) onready var background_explain = get_node(background_explain) as AudioStreamPlayer
export(NodePath) onready var klik_sfx = get_node(klik_sfx) as AudioStreamPlayer
export(NodePath) onready var back_sfx = get_node(back_sfx) as AudioStreamPlayer
export(NodePath) onready var salah_sfx = get_node(salah_sfx) as AudioStreamPlayer
export(NodePath) onready var benar_sfx = get_node(benar_sfx) as AudioStreamPlayer

func _ready() -> void:
	#background_menu.playing
	pass

func playing_menu():
	if background_menu.playing == false:
		background_menu.play(0)
	if background_explain.playing == true:
		background_explain.stop()
		
func playing_explain():
	if background_menu.playing == true:
		background_menu.stop()
	background_explain.play(0)
	
