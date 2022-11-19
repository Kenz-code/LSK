extends VBoxContainer


export var percentage = 100
export (String) var _name = ""
export (Color) var _color = Color.white

func _ready():
	$Details.text = "Win percentage: %" + str(percentage)
	$HBoxContainer/Name.text = _name
	$HBoxContainer/ColorRect.color = _color
