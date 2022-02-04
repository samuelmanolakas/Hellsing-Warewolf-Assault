extends Node2D

onready var bullet_manager = $BulletManager
onready var player = $Player
onready var timer = get_node("SpawnTimer")
onready var next_wave = get_node("Player/GUI/Control2/Next_wave_text")

var enemy = preload("res://Enemy.tscn")

func _ready() -> void:
	player.connect("player_fired_bullet", bullet_manager,"handle_bullet_spawned")


func _process(delta):
	if Global.wave_count == 10:
		wave_check()

func wave_check():
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
