extends GridContainer


var player = preload("res://Objects/Player/PlayerKeeper.tscn")


func _ready() -> void:
	for n in GameManager.players_playing:
		var new_player = player.instance()
		new_player.color = PlayerManager.players[n]["Color"]
		new_player._name = n
		add_child(new_player)
