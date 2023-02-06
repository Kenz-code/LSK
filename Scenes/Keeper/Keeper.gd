extends Control



var save = Game.new()

onready var _win_popup = $WinPopup
onready var id = Time.get_unix_time_from_system()

func _ready():
	# set date and time
	if GameManager.saved_game == false:
		var dt = Time.get_datetime_dict_from_system()
		save.date_time = str(dt.year) + "-" + str(dt.month) + "-" + str(dt.day) + " " + Time.get_time_string_from_system()
		save.id = id
		save.max_score = GameManager.max_score
		save.players_playing = GameManager.players_playing
		SaveManager._save.games.append(save)
		SaveManager._save_game()
	elif GameManager.saved_game == true:
		save = GameManager.save

func _process(_delta: float) -> void:
	if GameManager.max_score != 0:
		if _win_popup.visible == false:
			for p in GameManager.players_playing:
				if p["score"] >= GameManager.max_score:
					win(p)

func win(player):
	GameManager.winner = player
	_win_popup.show()
	_win_popup.emit_confetti()
	_win_popup.set_winning_player(player["name"])
	for p in PlayerManager.players:
		for l in GameManager.players_playing:
			if str(l.name) == str(p):
				if str(p) == player["name"]:
					PlayerManager.players[p]["Wins"] += 1
				else:
					PlayerManager.players[p]["Loses"] += 1
	
	PlayerManager.save_players()


func _on_Dots_pressed():
	$KeeperMenu.show()
