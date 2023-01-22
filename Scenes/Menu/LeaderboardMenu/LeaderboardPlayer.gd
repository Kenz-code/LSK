extends Control


export var percentage = 100
export (String) var _name = ""
export (Color) var _color = Color.white
export (int) var wins = 0
export (int) var losses = 0

func _ready():
	$VBox/Details.text = "Win percentage: %" + str(percentage)
	$VBox/HBoxContainer/Name.text = _name
	$VBox/HBoxContainer/ColorRect.color = _color
	$"%Wins".text = "Wins:\n" + str(wins)
	$"%Losses".text = "Losses:\n" + str(losses)


func _on_Stats_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed == true:
			$Stats.flat = false
			$Stats/HBoxContainer.show()
		else:
			$Stats.flat = true
			$Stats/HBoxContainer.hide()
