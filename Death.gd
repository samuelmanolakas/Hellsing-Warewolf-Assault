extends Node2D


func _ready():
	pass 


func _on_Button_pressed():
	get_tree().change_scene("res://Test_map_sven.tscn")

	pass # Replace with function body.


func _on_ReturnButton_pressed():
	get_tree().change_scene("res://Menu.tscn")
	pass # Replace with function body.
