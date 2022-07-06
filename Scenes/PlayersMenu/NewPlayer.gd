extends Control

signal player_created

func _on_Create_pressed() -> void:
	self.hide()
	PlayerManager.players[$NameEdit.text] = PlayerManager.player_demo.duplicate()
	PlayerManager.save_players()
	emit_signal("player_created")
