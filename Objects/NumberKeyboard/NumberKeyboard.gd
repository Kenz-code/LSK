extends Control


var text : Array = []

export (NodePath) var line_edit_path
export (bool) var not_node_path = false

var line_edit

func _ready() -> void:
	rect_position = Vector2(0,get_viewport_rect().size.y)
	if not_node_path == false:
		line_edit = get_node(line_edit_path)
	for num in $Grid.get_children():
		num.connect("pressed",self,"_on_num_pressed", [num.name])
	$VBox.get_node("0").connect("pressed",self,"_on_num_pressed", ["0"])
	

func _on_num_pressed(num:String):
	if text.size() >= 6:
		return
	text.push_back(num)


func _on__pressed() -> void:
	text.pop_back()

func _process(_delta: float) -> void:
	if not_node_path == false:
		var _text = PoolStringArray(text)
		line_edit.text = _text.join("")


func _show():
	$Tween.interpolate_property(self,"rect_position",rect_position,Vector2(0,get_viewport_rect().size.y-rect_size.y),0.2,Tween.TRANS_CUBIC,Tween.EASE_OUT)
	$Tween.start()

func _hide():
	$Tween.interpolate_property(self,"rect_position",rect_position,Vector2(0,get_viewport_rect().size.y),0.2,Tween.TRANS_CUBIC,Tween.EASE_OUT)
	$Tween.start()
