extends Node2D



func _ready():
	pass 


func _on_StartButton_pressed():
	get_tree().change_scene("res://Test_map.tscn")
	pass 


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Credits.tscn")
	pass # Replace with function body.


func _on_EndButton_pressed():
	get_tree().quit()
	pass # Replace with function body.
