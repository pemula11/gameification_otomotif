extends Control

export (NodePath) onready var item_info = get_node(item_info) as Control
export(String, FILE, "*.json") var question_file

var anima := Anima.begin(self)
var jawabanturun = []  #[['kapasitas'], ['tujuan']]
var jawabandatar = [] #[['aman'],['perusahaan']]
var cekjawab = []
var pertanyaanturun = []
var pertanyaandatar = []

export (int) var totalPertanyaan = 0
signal jawabanbenar



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SoundManager.playing_explain()
	var fadein := Anima.begin(self)
	fadein.then({ animation = "fade in", duration = 0.7 })
	
	fadein.play()
	load_soal()
	infosoal()
	
	

func cekjawaban():
	var tipe = ''
	var jawabturun = []
	var jawabdatar = []
	for i in totalPertanyaan:
		jawabdatar.append([])
		jawabturun.append([])
		
	for child in $GridContainer.get_children():
		
		for i in child.get_groups():
			if i == 'M1':
				jawabturun[0].append(child.text)
				
			if i == 'D1':
				jawabdatar[0].append(child.text)
			if i == 'M2':
				jawabturun[1].append(child.text)
			if i == 'D2':
				jawabdatar[1].append(child.text)
			if i == 'M3':
				jawabturun[2].append(child.text)
			if i == 'D3':
				jawabdatar[2].append(child.text)
			
		
	
		
	#for arr in jawabturun:
		#var tempkata = gabungkata(arr)
		#print(olahjawab(0,tempkata))
		#print(gabungkata(jawabturun[arr]))	
	#cekjawab.append(tempjawab)
	
	for i in totalPertanyaan:
		olahjawab(i,jawabturun,"M")
		olahjawab(i,jawabdatar,"D")
	
	
	for i in totalPertanyaan:
		resetkotak(i,'M')
		resetkotak(i,'D')
	
	print(tipe)
	

func insertjawaban(jawaban, tipe):
	if tipe == 'M1':
		pass


func gabungkata(arr) -> String:
	var tempgabung = ''
	for i in arr:
		tempgabung += i
		
	return tempgabung.to_upper()
	

func olahjawab(urutan, jawabtts,tipe):
	if tipe == "D":
		if gabungkata(jawabandatar[urutan]) ==  (gabungkata(jawabtts[urutan])):
			on_jawaban_benar(urutan,tipe)
			#print( "jawaban urutan "+ str(urutan) + " benar" )
		
	if tipe == "M":
		if gabungkata(jawabanturun[urutan]) ==  (gabungkata(jawabtts[urutan])):
			on_jawaban_benar(urutan,tipe)
			#return "jawaban urutan "+ str(urutan) + " benar" 
	

func infosoal():
	for child in $GridContainer.get_children():
		for i in child.get_groups():
			if i[0] ==  "M":
				child.connect("mouse_entered", self, "_on_mouse_entered_info", [pertanyaanturun[int(i[1]) - 1],child])
			if i[0] ==  "D":
				child.connect("mouse_entered", self, "_on_mouse_entered_info", [pertanyaandatar[int(i[1]) - 1],child])
			child.connect("mouse_exited", self, "_on_mouse_exited_info")
			

func load_data():
	var file = File.new()
	
	if file.file_exists(question_file):
		file.open(question_file, File.READ)
		return parse_json(file.get_as_text())


func load_soal():
	var temp = (load_data())
	for i in temp["datar"]:
		pertanyaandatar.append(i["pertanyaan"])
		jawabandatar.append([i["jawaban"].to_upper()])
	for i in temp["turun"]:
		pertanyaanturun.append(i["pertanyaan"])
		jawabanturun.append([i["jawaban"].to_upper()])
	print(pertanyaanturun)
	print(jawabandatar)

func _on_Button_pressed() -> void:
	
	cekjawaban()
	
func on_jawaban_benar(urutan, tipe):
	var ind = (tipe+str(urutan+1))
	for child in $GridContainer.get_children():
		if child.is_in_group(ind):
			child.editable = false
	
func resetkotak(urutan, tipe):
	var ind = (tipe+str(urutan+1))
	for child in $GridContainer.get_children():
		if child.is_in_group(ind) and child.editable == true:
			
			
			child.text = ''



func _on_mouse_entered_info(idx,pos):
	item_info.display(idx,pos)

func _on_mouse_exited_info():
	item_info.hide()




func _on_Back_pressed() -> void:
	SoundManager.back_sfx.play(0)
	get_tree().change_scene("res://src/scene/chapter_1.tscn")


func _on_CEK_pressed() -> void:
	
	cekjawaban()
