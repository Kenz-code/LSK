extends Control


var leaderboard_player = preload("res://Scenes/Menu/LeaderboardMenu/LeaderboardPlayer.tscn")

func _ready() -> void:
	for player in PlayerManager.players:
		var p = leaderboard_player.instance()
		var n = PlayerManager.players[player]
		var games_played = n["Wins"] + n["Loses"]
		var percent
		if games_played != 0:
			percent = (float(n["Wins"]) / float(games_played)) * 100
		else:
			percent = 0
		if $VBoxContainer.get_child_count() != 0:
			var duplicate = false
			for child in $VBoxContainer.get_children():
				if int(child.name) == int(percent):
					p.name = str(int(percent) + 1)
					duplicate = true
			if duplicate == false:
				p.name = str(int(percent))
		else:
			p.name = str(int(percent))
		p.percentage = int(percent)
		p._name = player
		p._color = n["Color"]
		$VBoxContainer.add_child(p)
	
	var pos = 0
	var iteration = 100
	while iteration > -1:
		for child in $VBoxContainer.get_children():
			if int(child.name) == iteration:
				$VBoxContainer.move_child(child,pos)
				pos += 1
		iteration -= 1


func _on_Back_pressed() -> void:
	self.hide()
