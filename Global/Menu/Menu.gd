extends Node2D



func _ready():
	pass 


func _on_StartButton_pressed():
	get_tree().change_scene("res://Maps/City_square.tscn")
	pass 


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Global/Credits/Credits.tscn")
	pass # Replace with function body.


func _on_EndButton_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Plasma_pressed():
	Global.char_choise = 1
	pass # Replace with function body.


func _on_Shotgun_pressed():
	Global.char_choise = 2
	pass # Replace with function body.


func _on_Rullstol_pressed():
	Global.char_choise = 3
	pass # Replace with function body.
