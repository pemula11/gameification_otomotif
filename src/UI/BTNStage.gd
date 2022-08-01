extends Button

export (float) var levelId
export (PackedScene)  var tujuanStage  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_BTNStage_pressed() -> void:
	SoundManager.klik_sfx.play(1.1)
	var anima := Anima.begin(self)
	anima.then({ node = get_parent(), animation = "fade in", duration = 0.7 })
	anima.play()
	get_tree().change_scene_to(tujuanStage)
	
	
