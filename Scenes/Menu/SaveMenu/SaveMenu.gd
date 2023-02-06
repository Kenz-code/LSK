extends Control

var save_game = preload("res://Scenes/Menu/SaveMenu/SaveGame.tscn")

func _ready():
	SaveManager._create_or_load_save()
	make_list()

func make_list():
	for g in SaveManager._save.games:
		var s = save_game.instance()
		s.text = g.date_time
		s.save = g
		$"%VBoxContainer".add_child(s)
