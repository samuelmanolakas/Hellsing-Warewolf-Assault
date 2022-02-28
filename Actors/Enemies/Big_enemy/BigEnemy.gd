extends KinematicBody2D

var run_speed = 80.0
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
	_update_navigation_path(position, player.get_global_position())

func handle_hit():
	health_stat.health -= 5
	if health_stat.health <= 0:
		Global.score += 1
		queue_free()
		Global._wave_counter()


func _on_PlayerDetector_body_entered(body):
	if body.name == "Player":
		$AudioStreamPlayer.play()
		body.get_node("Health").health -= 30
		if player.position.x > position.x:
			player.position += Vector2(200,0)
		if player.position.x < position.x:
			player.position += Vector2(-200,0)
		if player.position.y > position.y:
			player.position += Vector2(0,200)
		if player.position.y < position.y:
			player.position += Vector2(0,-200)
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
