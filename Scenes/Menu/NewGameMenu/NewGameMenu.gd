extends Control


func _on_Back_pressed() -> void:
	self.hide()
	$PlayerSelector.clear_players()

func _process(_delta: float) -> void:
	var text = PoolStringArray($NumberKeyboard.text)
	$VboxContainer/VboxContainer/MaxScore.text = text.join("")


func _on_ColorRect_focus_entered() -> void:
	$NumberKeyboard._hide()


func _on_MaxScore_focus_entered() -> void:
	$NumberKeyboard._show()


func _on_Players_pressed() -> void:
	$PlayerSelector.show()
	get_node("/root/Menu").specific_back_ui = $PlayerSelector


func _on_Start_pressed() -> void:
	if $VboxContainer/VboxContainer/MaxScore.text == "":
		$EnterMaxOrRoundsPopup.popup_centered()
		return
	elif $PlayerSelector.player_list.size() < 1:
		$EnterPlayersPopup.popup_centered()
		return
	
	if int($VboxContainer/VboxContainer/MaxScore.text) == 0:
		GameManager.max_score = 2147483647
	else:
		GameManager.max_score = int($VboxContainer/VboxContainer/MaxScore.text)
	
	GameManager.players_playing.clear()
	for _player in $PlayerSelector.player_list:
		GameManager.players_playing.push_back(_player)
	
	GameManager.saved_game = false
	get_tree().change_scene("res://Scenes/Keeper/Keeper.tscn")
