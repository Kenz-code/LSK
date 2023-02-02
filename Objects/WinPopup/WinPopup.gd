extends Control


export var winning_player = "" setget set_winning_player, get_winning_player


func set_winning_player(player: String):
	winning_player = player

func get_winning_player():
	return winning_player

func _process(delta: float) -> void:
	$WinningPlayer.text = winning_player + " won!"

func emit_confetti():
	$ConfettiLeft.emitting = true
	$ConfettiRight.emitting = true


func _on_MenuButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
