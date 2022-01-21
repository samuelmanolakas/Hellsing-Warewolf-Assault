extends Node2D

const stave = preload("res://stave.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_enemy_spawn_timeout():
	var stave_postition = Vector2(rand_range( 0, 1024), rand_range( 0, 600))
	var GrabedInstance= stave.instance()
	self.add_child(GrabedInstance)
	GrabedInstance.global_position = stave_postition
	print(GrabedInstance.global_position)
	
