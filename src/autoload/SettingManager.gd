
extends Node

var fullscreen setget set_fullscreen
var textspeed setget set_textspeed


func _ready() -> void:
	
	textspeed = 0.05
	fullscreen= OS.window_fullscreen

func set_fullscreen(value):
	fullscreen = value
	OS.window_fullscreen = value

func set_textspeed(value):
	textspeed = value
	#SignalManager.emit_signal("ui_scale_changed", value)
	
