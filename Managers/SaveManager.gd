extends Node


var _save: SaveGame

func _create_or_load_save() -> void:
	if SaveGame.save_exists():
		_save = SaveGame.load_savegame()
	else:
		_save = SaveGame.new()
		_save.write_savegame()


func _save_game() -> void:
	_save.write_savegame()
