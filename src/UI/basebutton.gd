extends Button

export (PackedScene)  var tujuanStage  


func _on_Button_pressed() -> void:
	
	SoundManager.klik_sfx.play(1.1)
	
