extends Node2D

signal panggilpopup
export var min_lulus =2

onready var anim = $popup/Panel/AnimationPlayer


func _ready() -> void:
	tampil()

func tampil():
	show()
	anim.play("fade_in")

func tutup():
	anim.play("fade_out")
	queue_free()


func _on_popup_panggilpopup(skor) -> void:
	if skor >= min_lulus:
		$popup/Panel/RichTextLabel.text = "skor kamu : " + str(skor) + ", kamu membuka stage selanjutnya"
	else:
		$popup/Panel/RichTextLabel.text = "skor kamu : " + str(skor) + ", dapatkan skor " + str(min_lulus) + " poin untuk membuka stage selanjutnya"
	tampil()
	


func _on_Button_pressed() -> void:
	
	get_tree().change_scene("res://src/scene/chapter_1.tscn")
	tutup()
