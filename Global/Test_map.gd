extends Node2D

onready var bullet_manager = $BulletManager
onready var player = $Player
onready var timer = get_node("SpawnTimer")
onready var fast_timer = get_node("FastSpawnTimer")
onready var big_timer = get_node("BigSpawnTimer")


var enemy = preload("res://Actors/Enemies/Enemy.tscn")
var fast_enemy = preload("res://Actors/Enemies/Fast_enemy/FastEnemy.tscn")
var big_enemy = preload("res://Actors/Enemies/Big_enemy/BigEnemy.tscn")
var player_name = 0


func _ready() -> void:
	player_name = Global.char_choise
	#$Player.connect("player_fired_bullet", bullet_manager,"handle_bullet_spawned")
	Global.score = 0
	if player_name == 1:
		var player1 = load("res://Actors/Players/Player.tscn").instance()
		player1.position = Vector2(1100, 410)
		add_child(player1)
	elif player_name == 2:
		var player2 = load("res://Actors/Players/Shotgun_player/ShotgunPlayer.tscn").instance()
		player2.position = Vector2(1100, 410)
		add_child(player2)
	elif player_name == 3:
		var player3 = load("res://Actors/Players/Rullstol_player/Rullstol_player.tscn").instance()
		player3.position = Vector2(1100, 410)
		add_child(player3)


func _process(delta):
	if Global.wave_count == 10:
		wave_check()

func wave_check():
	if Global.wave_num == 1:
		timer.stop()
		print("stop")
		timer.set_wait_time(5)
		$Player/GUI/Control2/Next_wave_text.visible = true
		timer.start()

	
	elif Global.wave_num == 2:
		timer.stop()
		print("stop")
		timer.set_wait_time(3)
		$Player/GUI/Control2/Next_wave_text.visible = true
		timer.start()

	
	elif Global.wave_num == 3:
		timer.stop()
		big_timer.stop()
		fast_timer.stop()
		print("stop")
		timer.set_wait_time(10)
		fast_timer.set_wait_time(5)
		big_timer.set_wait_time(10)
		$Player/GUI/Control2/Next_wave_text.visible = true
		timer.start()
		big_timer.start()
		fast_timer.start()
	
	elif Global.wave_num == 4:
		timer.stop()
		big_timer.stop()
		fast_timer.stop()
		print("stop")
		timer.set_wait_time(10)
		fast_timer.set_wait_time(5)
		big_timer.set_wait_time(10)
		$Player/GUI/Control2/Next_wave_text.visible = true
		timer.start()
		big_timer.start()
		fast_timer.start()
	
	elif Global.wave_num == 5:
		timer.stop()
		big_timer.stop()
		fast_timer.stop()
		print("stop")
		timer.set_wait_time(8)
		fast_timer.set_wait_time(4)
		big_timer.set_wait_time(10)
		$Player/GUI/Control2/Next_wave_text.visible = true
		timer.start()
		big_timer.start()
		fast_timer.start()
	
	elif Global.wave_num == 6:
		timer.stop()
		big_timer.stop()
		fast_timer.stop()
		print("stop")
		timer.set_wait_time(7)
		fast_timer.set_wait_time(4)
		big_timer.set_wait_time(10)
		$Player/GUI/Control2/Next_wave_text.visible = true
		timer.start()
		big_timer.start()
		fast_timer.start()
	
	elif Global.wave_num == 7:
		timer.stop()
		big_timer.stop()
		fast_timer.stop()
		print("stop")
		timer.set_wait_time(7)
		fast_timer.set_wait_time(4)
		big_timer.set_wait_time(8)
		$Player/GUI/Control2/Next_wave_text.visible = true
		timer.start()
		big_timer.start()
		fast_timer.start()
	
	elif Global.wave_num == 8:
		timer.stop()
		big_timer.stop()
		fast_timer.stop()
		print("stop")
		timer.set_wait_time(6)
		fast_timer.set_wait_time(4)
		big_timer.set_wait_time(8)
		$Player/GUI/Control2/Next_wave_text.visible = true
		timer.start()
		big_timer.start()
		fast_timer.start()
	
	elif Global.wave_num == 9:
		timer.stop()
		big_timer.stop()
		fast_timer.stop()
		print("stop")
		timer.set_wait_time(5)
		fast_timer.set_wait_time(3)
		big_timer.set_wait_time(8)
		$Player/GUI/Control2/Next_wave_text.visible = true
		timer.start()
		big_timer.start()
		fast_timer.start()
	
	elif Global.wave_num == 10:
		timer.stop()
		big_timer.stop()
		fast_timer.stop()
		print("stop")
		timer.set_wait_time(4)
		fast_timer.set_wait_time(3)
		big_timer.set_wait_time(7)
		$Player/GUI/Control2/Next_wave_text.visible = true
		timer.start()
		big_timer.start()
		fast_timer.start()

	elif Global.wave_num == 12:
		timer.stop()
		big_timer.stop()
		fast_timer.stop()




func _on_SpawnTimer_timeout():
	$Player/GUI/Control2/Next_wave_text.visible = false
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
