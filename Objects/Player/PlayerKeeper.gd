extends Control


export (Color) var color = Color.white
export (String) var _name = "Name"
var s

func _ready() -> void:
	s = $ProgressBar.get_stylebox("fg")

func _process(delta: float) -> void:
	s.bg_color = color
	$ProgressBar.add_stylebox_override("fg",s)
	
	$Button.text = _name
