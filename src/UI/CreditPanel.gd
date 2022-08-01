extends NinePatchRect
var anima := Anima.begin(self)

func _ready() -> void:
	anima.then({animation = "bouncing in", duration = 0.7 })

func tampil():
	anima.play()
	
	show()

func _on_closeBTN_pressed() -> void:
	hide()
	SoundManager.back_sfx.play(0)
