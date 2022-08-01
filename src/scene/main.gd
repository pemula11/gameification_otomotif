extends Control
var pergeseran = 250
onready var scroll = $HScrollBar
onready var container = $level_container
onready var ch1 = $Chapter/Button02
onready var ch2 = $Chapter/Button03	
var fadein := Anima.begin(self)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	fadein.then({ animation = "fade in", duration = 0.7 })
	
	fadein.play()
	
	
	
	SoundManager.playing_menu()
	
	for child in $level_container.get_children():
		if child.levelId > int(PlayerData.level['1']):
			
			child.hide()
	for child in $level_container_ch2.get_children():
		if child.levelId > int(PlayerData.level['2']):
			
			child.hide()
	

func _physics_process(delta: float) -> void:
	
	$level_container.rect_position.x = -(scroll.value * pergeseran * delta)
	$level_container_ch2.rect_position.x  = -(scroll.value * pergeseran * delta)
 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_TextureButton_pressed() -> void:
	SoundManager.back_sfx.play(0)
	get_tree().change_scene("res://src/scene/menu_utama.tscn")


func _on_CH1_pressed() -> void:
	
	SoundManager.klik_sfx.play(1.1)
	fadein.play()
	$level_container.show()
	$level_container_ch2.hide()


func _on_CH2_pressed() -> void:
	SoundManager.klik_sfx.play(1.1)
	fadein.play()
	$level_container.hide()
	$level_container_ch2.show()
