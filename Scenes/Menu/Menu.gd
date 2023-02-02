tool
extends Control


export var num_players = 1

var specific_back_ui = null

onready var back_arrow = $TopBar/Back

func _ready() -> void:
	PlayerManager.load_players()


func _on_Players_pressed() -> void:
	$UI/PlayersMenu.show()
	back_arrow.show()


func _on_NewGame_pressed() -> void:
	$UI/NewGameMenu.show()
	back_arrow.show()


func _on_Leaderboard_pressed() -> void:
	$UI/LeaderboardMenu.show()
	back_arrow.show()


func _on_Back_pressed():
	if specific_back_ui == null:
		for c in $UI.get_children():
			if c.visible == true:
				c.hide()
				back_arrow.hide()
	else:
		specific_back_ui.hide()
		specific_back_ui = null
