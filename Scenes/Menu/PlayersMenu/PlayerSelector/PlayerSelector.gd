extends Control


var player = preload("res://Scenes/Menu/PlayersMenu/Player.tscn")

var player_list = []

func _ready() -> void:
	PlayerManager.load_players()
	
	PlayerManager.connect("player_created",self,"_on_player_created")
	
	for k in PlayerManager.players.keys():
		var y = player.instance()
		y._name = str(k)
		y._color = PlayerManager.players[k]["Color"]
		$ScrollContainer/VBoxContainer.add_child(y)
		y.connect("just_checked",self,"_on_player_just_checked",[y._name, y._color])
		y.connect("just_unchecked",self,"_on_player_just_unchecked",[y._name, y._color])

func _on_player_just_checked(_name: String, color: Color):
	var player_score = GameManager.player_score_placeholder.duplicate()
	player_score["name"] = _name
	player_score["color"] = color
	player_list.push_back(player_score)

func _on_player_just_unchecked(_name: String):
	for p in player_list:
		if p["name"] == _name:
			player_list.pop_at(player_list.find(p))

func _on_Back_pressed() -> void:
	self.hide()


func clear_players():
	player_list = []
	for c in $ScrollContainer/VBoxContainer.get_children():
		if c.name.find("Player") != -1:
			c.checked = false
			c.get_node("ColorRect/CheckBox").pressed = false


func _on_player_created():
	var keys = PlayerManager.players.keys()
	var k = keys[PlayerManager.players.size()-1]
	var y = player.instance()
	y._name = str(k)
	y._color = PlayerManager.players[k]["Color"]
	$ScrollContainer/VBoxContainer.add_child(y)
	y.connect("just_checked",self,"_on_player_just_checked",[y._name])
	y.connect("just_unchecked",self,"_on_player_just_unchecked",[y._name])
