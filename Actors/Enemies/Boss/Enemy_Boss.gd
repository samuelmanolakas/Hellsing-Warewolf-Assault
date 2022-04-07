extends KinematicBody2D

export (PackedScene) var Bullet 

var run_speed = 140.0
var velocity = Vector2.ZERO
var path = []

onready var navigation = get_node("../Navigation2D")
onready var health_stat = $Enemy_health
onready var ai = $AI
onready var player = get_node("../Player")
onready var fireballs = get_node("FireBalls")
onready var gun_direction = $GunDirection
onready var end_of_gun = $EndOfGun

func _ready():
	ai.initialize(self)
	

func _physics_process(delta):
	if player == null:
		set_physics_process(false)
	velocity = Vector2.ZERO
	#velocity = global_position.direction_to(player.global_position) * run_speed
	velocity = move_and_slide(velocity)
	#_on_PlayerDetector_body_entered(player)
	fireballs.rotate(0.03)

func _process(delta):
	var walk_distance = run_speed * delta
	move_along_path(walk_distance)
	_update_navigation_path(position, player.get_global_position())

func handle_hit():
	health_stat.health -= 5
	if health_stat.health <= 0:
		Global.score += 1
		get_tree().change_scene("res://General/Endscreen.tscn")
		Global._wave_counter()


func _on_PlayerDetector_body_entered(body):
	if body.name == "Player":
		$AudioStreamPlayer.play()
		body.get_node("Health").health -= 20
		if player.position.x > position.x:
			player.position += Vector2(20,0)
		if player.position.x < position.x:
			player.position += Vector2(-100,0)
		if player.position.y > position.y:
			player.position += Vector2(0,100)
		if player.position.y < position.y:
			player.position += Vector2(0,-100)
		#print("colliding with player")

func move_along_path(distance):
	var last_point = position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		# The position to move to falls between two points.
		if distance <= distance_between_points:
			position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return
		# The position is past the end of the segment.
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	# The character reached the end of the path.
	position = last_point
	set_process(false)

func _update_navigation_path(start_position, end_position):
	# get_simple_path is part of the Navigation2D class.
	# It returns a PoolVector2Array of points that lead you
	# from the start_position to the end_position.
	path = navigation.get_simple_path(start_position, end_position, true)
	# The first point is always the start_position.
	# We don't need it in this example as it corresponds to the character's position.
	path.remove(0)
	set_process(true)


func _on_FireBalls_body_entered(body):
	if body.name == "Player":
		#$AudioStreamPlayer.play() maybe add fire soud :) 
		body.get_node("Health").health -= 5
	pass # Replace with function body.

func shoot():

	var bullet_instance = Bullet.instance()
	var direction = (gun_direction.global_position - end_of_gun.global_position).normalized()
	bullet_instance.global_position = end_of_gun.global_position
	bullet_instance.direction = direction
	get_parent().add_child(bullet_instance)
	#emit_signal("player_fired_bullet", bullet_instance, end_of_gun.global_position, direction)
	#$AudioStreamPlayer.play()
	#attack_cooldown.start()


func _on_FireTimer_timeout():
	shoot()
	pass # Replace with function body.
