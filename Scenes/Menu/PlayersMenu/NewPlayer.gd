extends Control

func _on_Create_pressed() -> void:
	if $VBoxContainer/NameEdit.text == "":
		$EnterNamePopup.popup()
		return
	for n in PlayerManager.players.keys():
		if $VBoxContainer/NameEdit.text == n:
			$DuplicateNamePopup.popup()
			$VBoxContainer/NameEdit.text = ""
			return
	self.hide()
	PlayerManager.players[$VBoxContainer/NameEdit.text] = PlayerManager.player_demo.duplicate()
	PlayerManager.players[$VBoxContainer/NameEdit.text]["Color"] = $VBoxContainer/ColorSelector.color
	PlayerManager.save_players()
	$VBoxContainer/NameEdit.text = ""
	PlayerManager.emit_signal("player_created")

func _process(_delta: float) -> void:
	$VBoxContainer/CurrentColor/ColorRect.color = $VBoxContainer/ColorSelector.color


func _on_Back_pressed() -> void:
	self.hide()
	$VBoxContainer/NameEdit.text = ""
	$VBoxContainer/ColorSelector.color = Color("#1a1c2c")
