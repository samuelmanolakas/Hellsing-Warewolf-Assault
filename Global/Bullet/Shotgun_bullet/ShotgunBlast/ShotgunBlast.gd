extends Node2D

func _process(delta):
	var top = get_node("Top")
	var bottom = get_node("Bottom")
	if(top):
		top.position -= Vector2(0,5)
	if(bottom):
		bottom.position += Vector2(0,5)
