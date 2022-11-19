tool
extends Control


export var num_players = 1

func _ready() -> void:
	PlayerManager.load_players()


func _on_Players_pressed() -> void:
	$UI/PlayersMenu.show()


func _on_NewGame_pressed() -> void:
	$UI/NewGameMenu.show()


func _on_Leaderboard_pressed() -> void:
	$UI/LeaderboardMenu.show()
