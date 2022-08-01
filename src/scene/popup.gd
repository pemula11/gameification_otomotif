extends Control
signal panggilpopup
signal popupgambar
export var min_lulus =2
onready var textlabel = $Panel/RichTextLabel



func tampil():
	show()
	$Panel/AnimationPlayer.play("fade_in")

func tutup():
	$Panel/AnimationPlayer.play("fade_out")
	queue_free()


func _on_popup_panggilpopup(skor, currentlevel) -> void:
	if skor >= min_lulus:
		if PlayerData.level['1']<= currentlevel:
			PlayerData.level['1'] += 1
			PlayerData.save_game()
		$Panel/RichTextLabel.text = "skor kamu : " + str(skor) + ", kamu membuka stage selanjutnya"
	else:
		$Panel/RichTextLabel.text = "skor kamu : " + str(skor) + ", dapatkan skor " + str(min_lulus) + " poin untuk membuka stage selanjutnya"
	tampil()
	

func _on_popup_popupgambar():
	
	textlabel.text = "kamu sudah menyelesaikan stage ini, silahkan lanjut ke materi selanjutna"
	tampil()
	
	

func _on_Button_pressed() -> void:
	SoundManager.klik_sfx.play(1.1)
	get_tree().change_scene("res://src/scene/chapter_1.tscn")
	tutup()
