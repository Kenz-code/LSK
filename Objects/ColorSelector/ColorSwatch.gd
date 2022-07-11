tool
extends Button
class_name ColorSwatch

onready var color_rect : ColorRect = $ColorRect

export var color : = Color("ffffff") setget set_color

func set_color(value:Color):
	color = value
	if not color_rect:
		return
	color_rect.color = value

func _ready():
	self.color = color

