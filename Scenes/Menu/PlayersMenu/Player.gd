tool
extends Control


export (String) var _name = "Name"
export (Color) var _color = Color.white
export (bool) var selection = true

var checked = false

signal just_checked
signal just_unchecked

func _process(_delta: float) -> void:
	$Label.text = _name
	$ColorRect.color = _color
	$ColorRect/CheckBox.visible = selection


func _on_CheckBox_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		checked = true
		emit_signal("just_checked")
	else:
		checked = false
		emit_signal("just_unchecked")
