extends Node2D
export var file_name = "user://save_game_vokasi.save"

var level = {
	"1" : 1,
	"2" : 1, 
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func save_game():
	var save_file=File.new()
	save_file.open(file_name,File.WRITE)
	var data = {
	"level" : {
	"1" : level['1'],
	"2" : level['2'], 
	},
	"setting" : {
		"textspeed" : SettingManager.textspeed,
		"fullscreen" : OS.window_fullscreen,
		"bgsound" : AudioServer.get_bus_volume_db(AudioServer.get_bus_index("background")),
		"sfx" : AudioServer.get_bus_volume_db(AudioServer.get_bus_index("sfx"))
		}
	}
	save_file.store_var(data)
	save_file.close()

func load_game():
	var save_file=File.new()
	if !save_file.file_exists(file_name):
		return
	save_file.open(file_name,File.READ)
	if (!save_file.eof_reached()):
		var data = save_file.get_var()
		level['1'] = data['level']['1']
		level['2'] = data['level']['2']
		SettingManager.textspeed = data['setting']['textspeed']
		SettingManager.fullscreen = data['setting']['fullscreen']
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("background"), data['setting']['bgsound'])
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("background"), data['setting']['sfx'])
		print(data)
	save_file.close()
	
