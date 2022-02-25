extends Node2D


export (int) var health = 100 setget set_health

signal player_health_changed(new_health)

func set_health(new_health: int):
	health = clamp(new_health, 0, 100)
	emit_signal("player_health_changed", health)
	
func _process(delta):
	#print (health)
	if health <= 0:
		print("Player is dead!")
		get_tree().change_scene("res://Global/Death/Death.tscn")
