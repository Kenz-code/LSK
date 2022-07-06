tool
extends Control


export (String) var _name = "Name"

func _process(delta: float) -> void:
	$Label.text = _name
