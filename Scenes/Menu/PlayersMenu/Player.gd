tool
extends Control


export (String) var _name = "Name"
export (Color) var _color = Color.white
export (bool) var selection = true

var checked = false

signal just_checked
signal just_unchecked

func _process(_delta: float) -> void:
	$HBoxContainer/Label.text = _name
	$ColorRect.color = _color




func _on_Player_toggled(button_pressed):
	if selection == true:
		if button_pressed == false:
			emit_signal("just_unchecked")
			$HBoxContainer/Check.hide()
		else:
			emit_signal("just_checked")
			$HBoxContainer/Check.show()

