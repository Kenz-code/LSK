extends Control


export var color = Color()
export var _name = ""
export var score = 0
export var percent = 0.0


func _process(_delta):
	$ColorRect.color = color
	$HBoxContainer/Name.text = _name
	$HBoxContainer/Score.text = str(score)
	$HBoxContainer/Percent.text = str(percent)+"%"
