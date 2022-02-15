extends Node2D


func _ready():
	pass 


func _on_Button_pressed():
	get_tree().change_scene("res://Maps/City_square.tscn")
	pass # Replace with function body.


func _on_ReturnButton_pressed():
	get_tree().change_scene("res://Global/Menu/Menu.tscn")
	pass # Replace with function body.
