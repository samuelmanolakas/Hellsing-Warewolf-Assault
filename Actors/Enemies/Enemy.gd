extends KinematicBody2D

var run_speed = 140.0
var velocity = Vector2.ZERO
var path = []

onready var navigation = get_node("../Navigation2D")
onready var health_stat = $Enemy_health
onready var ai = $AI
onready var player = get_node("../Player")

func _ready():
	ai.initialize(self)
	

func _physics_process(delta):
	if player == null:
		set_physics_process(false)
	velocity = Vector2.ZERO
	#velocity = global_position.direction_to(player.global_position) * run_speed
	velocity = move_and_slide(velocity)
	#_on_PlayerDetector_body_entered(player)

func _process(delta):
	var walk_distance = run_speed * delta
	move_along_path(walk_distance)
	if player != null:
		_update_navigation_path(position, player.get_global_position())

func handle_hit():
	health_stat.health -= 18
	if health_stat.health <= 0:
		Global.score += 1
		queue_free()
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
		if distance <= distance_between_points:
			position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	position = last_point
	set_process(false)

func _update_navigation_path(start_position, end_position):
	path = navigation.get_simple_path(start_position, end_position, true)
	path.remove(0)
	set_process(true)
