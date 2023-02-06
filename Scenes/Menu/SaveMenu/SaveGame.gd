extends Button

export var save : Resource


func _on_SaveGame_pressed():
	GameManager.max_score = save.max_score
	
	GameManager.players_playing = save.players_playing
	
	get_tree().change_scene("res://Scenes/Keeper/Keeper.tscn")
	
	GameManager.saved_game = true
	GameManager.save = save
