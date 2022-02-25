extends Node2D

onready var bullet_manager = $BulletManager
onready var player = $Player
onready var timer = get_node("SpawnTimer")
onready var next_wave = get_node("Player/GUI/Control2/Next_wave_text")

var enemy = preload("res://Actors/Enemies/Enemy.tscn")
var fast_enemy = preload("res://Actors/Enemies/Fast_enemy/FastEnemy.tscn")
var big_enemy = preload("res://Actors/Enemies/Big_enemy/BigEnemy.tscn")

func _ready() -> void:
	player.connect("player_fired_bullet", bullet_manager,"handle_bullet_spawned")
	Global.score = 0


func _process(delta):
	if Global.wave_count == 10:
		wave_check()

func wave_check():
	if Global.wave_num == 1:
		timer.stop()
		print("stop")
		timer.set_wait_time(5)
		next_wave.visible = true
		timer.start()
	
	elif Global.wave_num == 2:
		timer.stop()
		print("stop")
		timer.set_wait_time(4)
		next_wave.visible = true
		timer.start()
		
	elif Global.wave_num == 3:
		timer.stop()
		print("stop")
		timer.set_wait_time(3)
		next_wave.visible = true
		timer.start()
		
	elif Global.wave_num == 4:
		timer.stop()
		print("stop")
		timer.set_wait_time(2)
		next_wave.visible = true
		timer.start()
		
	elif Global.wave_num == 5:
		timer.stop()
		print("stop")
		timer.set_wait_time(1)
		next_wave.visible = true
		timer.start()





func _on_SpawnTimer_timeout():
	next_wave.visible = false
	var enemy_instance = enemy.instance()
	add_child(enemy_instance)
	enemy_instance.position = $SpawnLocation.position
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position
	$SpawnLocation.position = position


func _on_FastSpawnTimer_timeout():
	var enemy_instance = fast_enemy.instance()
	add_child(enemy_instance)
	enemy_instance.position = $SpawnLocation.position
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position
	$SpawnLocation.position = position
	pass # Replace with function body.


func _on_BigSpawnTimer_timeout():
	var enemy_instance = big_enemy.instance()
	add_child(enemy_instance)
	enemy_instance.position = $SpawnLocation.position
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position
	$SpawnLocation.position = position
	pass # Replace with function body.

	pass # Replace with function body.
