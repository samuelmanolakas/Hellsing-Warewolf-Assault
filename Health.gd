extends Node2D


export (int) var health = 100 setget set_health

func set_health(new_health: int):
	health = clamp(new_health, 0, 100)

func _process(delta):
	print (health)
	if health <= 0:
		get_parent().queue_free()
		#get_node("../Enemy").set_physics_process(false)
