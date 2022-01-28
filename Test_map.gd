extends Node2D

onready var bullet_manager = $BulletManager
onready var player = $Player


var enemy = preload("res://Enemy.tscn")

func _ready() -> void:
	player.connect("player_fired_bullet", bullet_manager,"handle_bullet_spawned")

func _on_SpawnTimer_timeout():

	var enemy_instance = enemy.instance()
	add_child(enemy_instance)
	enemy_instance.position = $SpawnLocation.position
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position
	$SpawnLocation.position = position 
