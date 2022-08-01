extends NinePatchRect

var anima := Anima.begin(self)
export(NodePath) onready var speed_slider = get_node(speed_slider) as HSlider

export(NodePath) onready var fullscreen_check = get_node(fullscreen_check) as CheckBox
var  max_speed  = 0.11


func _ready() -> void:
	anima.then({animation = "bouncing in", duration = 0.7 })
	fullscreen_check.pressed = SettingManager.fullscreen
	speed_slider.value = SettingManager.textspeed
	$VBoxContainer/backgroundMusic/slider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("background"))
	$VBoxContainer/sfxmusic/slider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("sfx"))

func _on_closeBTN_pressed() -> void:
	PlayerData.save_game()
	hide()
	SoundManager.back_sfx.play(0)


func tampil():
	
	anima.play()
	#anima.connect("animation_completed", self, "tampilnode")
	show()
	

func _on_CheckBox_toggled(button_pressed: bool) -> void:
	SettingManager.fullscreen = button_pressed


func _on_slider_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		SettingManager.textspeed = (max_speed - speed_slider.value)
		print(SettingManager.textspeed)
	



func _on_slider_bg_snd_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("background"), value)


func _on_slider_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("sfx"), value)

func tampilnode():
	show()
