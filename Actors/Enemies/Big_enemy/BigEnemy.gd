extends KinematicBody2D

var run_speed = 80
var velocity = Vector2.ZERO

onready var health_stat = $Enemy_health
onready var ai = $AI
onready var player = get_node("../Player")

func _ready():
	ai.initialize(self)
	

func _physics_process(delta):
	if player == null:
		set_physics_process(false)
	velocity = Vector2.ZERO
	velocity = global_position.direction_to(player.global_position) * run_speed
	velocity = move_and_slide(velocity)
	#_on_PlayerDetector_body_entered(player)

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
