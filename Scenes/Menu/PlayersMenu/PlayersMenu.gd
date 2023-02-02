extends Control

var player = preload("res://Scenes/Menu/PlayersMenu/Player.tscn")

func _ready() -> void:
	PlayerManager.load_players()
	
	PlayerManager.connect("player_created",self,"_on_player_created")
	
	for k in PlayerManager.players.keys():
		var y = player.instance()
		y._name = str(k)
		y._color = PlayerManager.players[k]["Color"]
		y.selection = false
		$VBoxContainer.add_child(y)


func _on_Add_pressed() -> void:
	$NewPlayer.show()
	get_node("/root/Menu").specific_back_ui = $NewPlayer

func _on_player_created():
	var keys = PlayerManager.players.keys()
	var k = keys[PlayerManager.players.size()-1]
	var y = player.instance()
	y._name = str(k)
	y._color = PlayerManager.players[k]["Color"]
	y.selection = false
	$VBoxContainer.add_child(y)


func _on_Back_pressed() -> void:
	self.hide()
