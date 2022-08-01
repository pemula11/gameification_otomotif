extends Control

const popup = preload("res://src/UI/popup_done.tscn")
export(String, FILE, "*.json") var dialog_file
export(NodePath) onready var messagebox = get_node(messagebox) as RichTextLabel
export(NodePath) onready var namebox = get_node(namebox) as RichTextLabel
export(NodePath) onready var textContainer = get_node(textContainer) as NinePatchRect
export(NodePath) onready var timewait = get_node(timewait) as Timer
export(NodePath) onready var image = get_node(image) as TextureRect
var img = "hukum ohm.PNG"
export var folder_img = "tune-up/"

export var textspeed = 0.05
var dialogues = [] 
var current_dialog_id = 0
var finished = true

func _ready() -> void:
	if SoundManager.background_menu.playing == false:
		SoundManager.background_menu.play(0)
	play()
	next_line()
	

func play():
	timewait.wait_time = textspeed
	
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
	
	
	if  current_dialog_id >= len(dialogues)-1:
		var panelpopup = popup.instance()
		add_child(panelpopup)
		panelpopup.position = Vector2(280,130)
	else:	
		finished = false
		if !dialogues[current_dialog_id]['image'] == "":
			img = dialogues[current_dialog_id]['image']
		image.texture = load("res://asset/otomotif/" + folder_img + img)
		messagebox.text = dialogues[current_dialog_id]['text']
		namebox.text = dialogues[current_dialog_id]['name']
		messagebox.visible_characters = 0
		
		while messagebox.visible_characters <= len(messagebox.text):
			messagebox.visible_characters +=1
			timewait.start()
			yield(timewait,"timeout")
		
		
		finished = true
		current_dialog_id +=1
	
func load_dialog():
	var file = File.new()
	
	if file.file_exists(dialog_file):
		file.open(dialog_file, File.READ)
		return parse_json(file.get_as_text())

