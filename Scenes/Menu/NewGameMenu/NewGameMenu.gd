extends Control


func _on_Back_pressed() -> void:
	self.hide()
	$PlayerSelector.clear_players()

func _process(delta: float) -> void:
	if $GridContainer/MaxScoreCheckBox.pressed == true:
		var text = PoolStringArray($NumberKeyboard.text)
		$GridContainer/MaxScore.text = text.join("")
	else:
		var text = PoolStringArray($NumberKeyboard.text)
		$GridContainer/Rounds.text = text.join("")



func _on_ColorRect_focus_entered() -> void:
	$NumberKeyboard._hide()


func _on_RoundsCheckBox_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		$GridContainer/MaxScoreCheckBox.pressed = false
		$GridContainer/MaxScore.editable = false
		$GridContainer/Rounds.editable = true
		$GridContainer/MaxScore.text = ""
		$NumberKeyboard.text = []
	else:
		$GridContainer/MaxScoreCheckBox.pressed = true
		$GridContainer/MaxScore.editable = true
		$GridContainer/Rounds.editable = false
		$GridContainer/Rounds.text = ""
		$NumberKeyboard.text = []


func _on_MaxScoreCheckBox_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		$GridContainer/RoundsCheckBox.pressed = false
		$GridContainer/MaxScore.editable = true
		$GridContainer/Rounds.editable = false
		$GridContainer/Rounds.text = ""
		$NumberKeyboard.text = []
	else:
		$GridContainer/RoundsCheckBox.pressed = true
		$GridContainer/MaxScore.editable = false
		$GridContainer/Rounds.editable = true
		$GridContainer/MaxScore.text = ""
		$NumberKeyboard.text = []


func _on_MaxScore_focus_entered() -> void:
	if $GridContainer/MaxScoreCheckBox.pressed == true:
		$NumberKeyboard._show()


func _on_Rounds_focus_entered() -> void:
	if $GridContainer/RoundsCheckBox.pressed == true:
		$NumberKeyboard._show()


func _on_Players_pressed() -> void:
	$PlayerSelector.show()


func _on_Start_pressed() -> void:
	if $GridContainer/MaxScoreCheckBox.pressed == true:
		GameManager.rounds = 0
		GameManager.max_score = int($GridContainer/MaxScore.text)
	else:
		GameManager.rounds = int($GridContainer/Rounds.text)
		GameManager.max_score = 0
	for _player in $PlayerSelector.player_list:
		GameManager.players_playing.push_back(_player)
	get_tree().change_scene("res://Scenes/Keeper/Keeper.tscn")
