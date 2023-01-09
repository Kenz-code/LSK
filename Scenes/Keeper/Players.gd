extends GridContainer


var player = preload("res://Objects/Player/PlayerKeeper.tscn")


func _ready() -> void:
	for n in GameManager.players_playing:
		var new_player = player.instance()
		if GameManager.max_score == 2147483647:
			new_player.disable_progress_bar = true
		new_player.color = PlayerManager.players[n["name"]]["Color"]
		new_player._name = n["name"]
		add_child(new_player)
