extends Node

var save_path = "user://players.dat"
var players = {}

var player_demo = {
	"Wins": 0,
	"Loses": 0
}

func save_players():
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(players)
		file.close()
	else:
		print(error)

func load_players():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var new_save = file.get_var()
			players = new_save
			file.close()
		else:
			print(error)
	else:
		save_players()
