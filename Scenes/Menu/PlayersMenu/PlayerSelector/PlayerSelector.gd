extends Control


var player = preload("res://Scenes/Menu/PlayersMenu/Player.tscn")
var seperator = preload("res://Objects/Seperator/Seperator.tscn")

var player_list = []

func _ready() -> void:
	PlayerManager.load_players()
	
	PlayerManager.connect("player_created",self,"_on_player_created")
	
	for k in PlayerManager.players.keys():
		var y = player.instance()
		y._name = str(k)
		y._color = PlayerManager.players[k]["Color"]
		$VBoxContainer.add_child(y)
		$VBoxContainer.add_child(seperator.instance())
		y.connect("just_checked",self,"_on_player_just_checked",[y._name])
		y.connect("just_unchecked",self,"_on_player_just_unchecked",[y._name])

func _on_player_just_checked(_name: String):
	player_list.push_back(_name)

func _on_player_just_unchecked(_name: String):
	var pos = player_list.find(_name)
	player_list.pop_at(pos)

func _on_Back_pressed() -> void:
	self.hide()


func clear_players():
	player_list = []
	for c in $VBoxContainer.get_children():
		if c.name.find("Player") != -1:
			c.checked = false
			c.get_node("ColorRect/CheckBox").pressed = false


func _on_player_created():
	var keys = PlayerManager.players.keys()
	var k = keys[PlayerManager.players.size()-1]
	var y = player.instance()
	y._name = str(k)
	y._color = PlayerManager.players[k]["Color"]
	$VBoxContainer.add_child(y)
	$VBoxContainer.add_child(seperator.instance())
	y.connect("just_checked",self,"_on_player_just_checked",[y._name])
	y.connect("just_unchecked",self,"_on_player_just_unchecked",[y._name])
