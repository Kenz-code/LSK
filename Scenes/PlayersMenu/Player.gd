tool
extends Control


export (String) var _name = "Name"
export (Color) var _color = Color.white

func _process(delta: float) -> void:
	$Label.text = _name
	$ColorRect.color = _color
