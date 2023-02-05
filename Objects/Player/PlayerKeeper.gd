extends Control


export (Color) var color = Color.white
export (String) var _name = "Name"
export (int) var _score = 0
export (bool) var disable_progress_bar = false
var s
var player_index = -1

func _ready() -> void:
	$"%NumberKeyboard"._hide()
	$ProgressBar.visible = not disable_progress_bar
	$HBoxContainer/Percent.visible = not disable_progress_bar
	
	$ProgressBar.max_value = GameManager.max_score
	
	s = $ProgressBar.get_stylebox("fg")
	
	for p in GameManager.players_playing:
		player_index += 1
		if p["name"] == _name:
			break
	
func _process(delta: float) -> void:
	_score = GameManager.players_playing[player_index]["score"]
	s.bg_color = color
	$ProgressBar.add_stylebox_override("fg",s)
	
	$Name.text = _name
	
	$ProgressBar.value = _score
	$HBoxContainer/Score.text = str(_score)
	$HBoxContainer/Percent.text = str(stepify($ProgressBar.value/$ProgressBar.max_value*100,1))+"%"


func _on_ScoreInput_focus_entered() -> void:
	$Input/Control/NumberKeyboard._show()


func _on_ColorRect_focus_entered() -> void:
	$Input/Control/NumberKeyboard._hide()


func _on_NumberKeyboard_focus_exited():
	$Input/Control/NumberKeyboard._hide()

func _on_Name_pressed() -> void:
	$Input/Control.show()


func _on_Back_pressed() -> void:
	$Input/Control.hide()
	hide_everything()


func _on_Enter_pressed() -> void:
	$Input/Control.hide()
	var _text = PoolStringArray(get_node("%NumberKeyboard").text)
	var add_score = int(_text.join(""))
	for p in GameManager.players_playing:
		if p["name"] == _name:
			p["score"] += add_score
	hide_everything()
	

func hide_everything():
	$Input/Control/NumberKeyboard._hide()
	get_node("%NumberKeyboard").text.clear()

