extends Node2D

func _process(delta):
	get_node("Top").position -= Vector2(0,5)
	get_node("Bottom").position += Vector2(0,5)
