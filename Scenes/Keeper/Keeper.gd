extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var _win_popup = $WinPopup


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
