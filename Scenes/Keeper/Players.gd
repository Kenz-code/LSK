extends GridContainer


var player = preload("res://Objects/Player/Player.tscn") 


func _ready() -> void:
	for n in range(GameManager.num_players):
		add_child(player.instance())
