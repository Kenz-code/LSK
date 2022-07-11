tool
extends GridContainer

var color := Color("#1a1c2c")

func _ready() -> void:
	for swatch in get_children():
		swatch.connect("pressed",self, "_on_ColorSwatch_pressed", [swatch.color])


func _on_ColorSwatch_pressed(color_string: Color):
	color = color_string
