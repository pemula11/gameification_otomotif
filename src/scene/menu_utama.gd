extends Control
var anima := Anima.begin(self)
export(NodePath) onready var settings = get_node(settings) as Control
export(NodePath) onready var credit = get_node(credit) as Control

export (PackedScene)  var tujuanStage  

func _ready() -> void:
	PlayerData.load_game()
	SoundManager.playing_menu()

func _on_Option_pressed() -> void:
	
	settings.tampil()
	
	settings.raise()
	


func _on_credit_pressed() -> void:
	credit.tampil()
	credit.raise()


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_levelBTN_pressed() -> void:
	PlayerData.save_game()
	anima.then({node = $VBoxContainer/Button, animation = "tada", duration = 0.1 })
	anima.then({ animation = "fade out", duration = 0.5 })
	anima.play()
	anima.connect("animation_completed", self, "nextscene")

func nextscene():
	
	get_tree().change_scene_to(tujuanStage)
