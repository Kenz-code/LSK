extends Control


var text : Array = []


func _ready() -> void:
	for num in $Grid.get_children():
		num.connect("pressed",self,"_on_num_pressed", [num.name])
	$VBox.get_node("0").connect("pressed",self,"_on_num_pressed", ["0"])

func _on_num_pressed(num:String):
	if text.size() >= 6:
		return
	text.push_back(num)


func _on__pressed() -> void:
	text.pop_back()
	


func _show():
	$Tween.interpolate_property(self,"rect_position",rect_position,Vector2(0,996),0.2,Tween.TRANS_CUBIC,Tween.EASE_OUT)
	$Tween.start()

func _hide():
	$Tween.interpolate_property(self,"rect_position",rect_position,Vector2(0,1482),0.2,Tween.TRANS_CUBIC,Tween.EASE_OUT)
	$Tween.start()
