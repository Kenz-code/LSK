extends Control

func _on_Create_pressed() -> void:
	if $NameEdit.text == "":
		$EnterNamePopup.popup()
		return
	for n in PlayerManager.players.keys():
		if $NameEdit.text == n:
			$DuplicateNamePopup.popup()
			$NameEdit.text = ""
			return
	self.hide()
	PlayerManager.players[$NameEdit.text] = PlayerManager.player_demo.duplicate()
	PlayerManager.players[$NameEdit.text]["Color"] = $ColorSelector.color
	PlayerManager.save_players()
	$NameEdit.text = ""
	PlayerManager.emit_signal("player_created")

func _process(delta: float) -> void:
	$CurrentColor/ColorRect.color = $ColorSelector.color


func _on_Back_pressed() -> void:
	self.hide()
	$NameEdit.text = ""
	$ColorSelector.color = Color("#1a1c2c")
