extends Control


var win_score_player = preload("res://Objects/WinPopup/WinScorePlayer.tscn")

func _ready():
	print(GameManager.players_playing)

func make_list():
	for p in GameManager.players_playing:
		var w = win_score_player.instance()
		w.color = p.color
		w._name = p.name
		w.score = p.score
		w.percent = stepify(float(p.score)/float(GameManager.max_score)*100,1)
		if w.percent > 100:
			w.percent = 100
		$ScrollContainer/VBoxContainer.add_child(w)


func _on_Back_pressed():
	self.hide()
