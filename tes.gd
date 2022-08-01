extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dialogue_resource = preload("res://asset/dialog/npc1.tres")
	var dialogue_line = yield(DialogueManager.get_next_dialogue_line("this_is_a_node_title", dialogue_resource), "completed")
	print(dialogue_line)
