extends Control

var player = preload("res://Scenes/PlayersMenu/Player.tscn")
var seperator = preload("res://Objects/Seperator/Seperator.tscn")

func _ready() -> void:
	PlayerManager.load_players()
	
	$NewPlayer.connect("player_created",self,"_on_player_created")
	
	for k in PlayerManager.players.keys():
		var y = player.instance()
		y._name = str(k)
		y._color = PlayerManager.players[k]["Color"]
		$VBoxContainer.add_child(y)
		$VBoxContainer.add_child(seperator.instance())


func _on_Add_pressed() -> void:
	$NewPlayer.show()

func _on_player_created():
	var keys = PlayerManager.players.keys()
	var k = keys[PlayerManager.players.size()-1]
	var y = player.instance()
	y._name = str(k)
	y._color = PlayerManager.players[k]["Color"]
	$VBoxContainer.add_child(y)
	$VBoxContainer.add_child(seperator.instance())


func _on_Back_pressed() -> void:
	self.hide()
