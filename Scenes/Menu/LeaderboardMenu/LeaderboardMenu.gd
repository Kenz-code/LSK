extends Control


var leaderboard_player = preload("res://Scenes/Menu/LeaderboardMenu/LeaderboardPlayer.tscn")

func _ready() -> void:
	PlayerManager.connect("player_created",self,"_on_player_created")
	
	reset_leaderboard()

func reset_leaderboard():
	delete_all_players()
	PlayerManager.load_players()
	# make leaderboard - the hard part
	var leaderboard = make_leaderboard()
	leaderboard = sort_leaderboard(leaderboard)
	
	# show the leaderboard - the easy part
	for player in leaderboard:
		var p = leaderboard_player.instance()
		p.percentage = player[1]
		p._name = player[0]
		p._color = player[4]
		p.wins = player[2]
		p.losses = player[3]
		$"%VBoxContainer".add_child(p)

func make_leaderboard():
	var leaderboard = []
	for player in PlayerManager.players:
		var n = PlayerManager.players[player]
		var games_played = n["Wins"] + n["Loses"]
		var percent
		if games_played != 0:
			percent = (float(n["Wins"]) / float(games_played)) * 100
		else:
			percent = 0
		
		# round percent
		percent = round(percent * 10) / 10
		
		var data = [player,percent,n.Wins,n.Loses,n.Color]
		leaderboard.append(data)
	return leaderboard

func sort_leaderboard(leaderboard : Array):
	leaderboard.sort_custom(MyCustomSorter, "sort_decending")
	return leaderboard


class MyCustomSorter:
	static func sort_decending(a, b):
		if a[1] > b[1]:
			return true
		return false

func _on_Back_pressed() -> void:
	self.hide()

func _on_player_created():
	reset_leaderboard()

func delete_all_players():
	var children = $'%VBoxContainer'.get_children()
	
	for c in children:
		c.queue_free()
