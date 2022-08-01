extends Control

export(String, FILE, "*.json") var dialog_file
export(NodePath) onready var messagebox = get_node(messagebox) as RichTextLabel
export(NodePath) onready var namebox = get_node(namebox) as RichTextLabel
export(NodePath) onready var textContainer = get_node(textContainer) as NinePatchRect
export(NodePath) onready var optionContainer = get_node(optionContainer) as GridContainer
export(NodePath) onready var timewait = get_node(timewait) as Timer
export (NodePath) onready var item_info = get_node(item_info) as Control
export (NodePath) onready var popup = get_node(popup) as Control
export (NodePath) onready var skor_label = get_node(skor_label) as Label
export var levelid = 0
var skor = 0
var btn = preload("res://asset/UI/Color 5/BB_option.tscn")
var pilihan = ['A', 'B', 'C', 'D']
var indexpilihan = 0

var textspeed = 0.05
var dialogues = [] 
var current_dialog_id = 0
var finished = true

func _ready() -> void:
	play()
	next_line()
	
	
	
func play():
	timewait.wait_time = SettingManager.textspeed
	
	dialogues = load_dialog()
	print(dialogues)
	current_dialog_id = 0
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_dialog"):
		if finished:
			
			next_line()
		else:
			messagebox.visible_characters = len(messagebox.text)

func next_line():
	
	print(current_dialog_id)
	print(len(dialogues))
	if  current_dialog_id >= len(dialogues):
		
		popup.emit_signal("panggilpopup", skor, levelid)
		queue_free()
		optionContainer.queue_free()
	
	else:
		finished = false
		for child in optionContainer.get_children():
			child.queue_free()
	
		messagebox.text = dialogues[current_dialog_id]['text']
		namebox.text = dialogues[current_dialog_id]['name']
		messagebox.visible_characters = 0
		
		while messagebox.visible_characters <= len(messagebox.text):
			messagebox.visible_characters +=1
			timewait.start()
			yield(timewait,"timeout")
		
		
		if dialogues[current_dialog_id].has("option"):
			option_dialog(current_dialog_id)
		else:
			finished = true
		current_dialog_id +=1
	

func option_dialog(current):
	indexpilihan = 0
	for option in dialogues[current]['option']:
		
		var Btn = btn.instance()
		
		Btn.text = pilihan[indexpilihan]
		optionContainer.add_child(Btn)
		Btn.connect("mouse_entered", self, "_on_mouse_entered_slot", [option, Btn])
		Btn.connect("mouse_exited", self, "_on_mouse_exited_slot")
		Btn.connect("pressed", self, "_on_player_optionbtn_pressed", [option])
		indexpilihan += 1


func _on_player_optionbtn_pressed(option):
	if option['jawaban'] == "benar":
		skor +=1
		SoundManager.benar_sfx.play(1.1)
		skor_label.text = "Skor "+ str(skor)
	else:
		SoundManager.salah_sfx.play(0)
		skor_label.text = "Skor "+ str(skor)
	next_line()
	item_info.hide()
	

func load_dialog():
	var file = File.new()
	
	if file.file_exists(dialog_file):
		file.open(dialog_file, File.READ)
		return parse_json(file.get_as_text())


func _on_mouse_entered_slot(option,btn):
	item_info.display(option['text'],btn)

func _on_mouse_exited_slot():
	item_info.hide()



func _on_TextureButton_pressed() -> void:
	SoundManager.back_sfx.play(0)
	get_tree().change_scene("res://src/scene/chapter_1.tscn")
