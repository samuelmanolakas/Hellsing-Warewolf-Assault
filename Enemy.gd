extends KinematicBody2D

var run_speed = 200
var velocity = Vector2.ZERO

onready var health_stat = $Health
onready var ai = $AI
onready var player = get_node("../Player")

func _ready():
	ai.initialize(self)

func _physics_process(delta):
	velocity = Vector2.ZERO
	velocity = global_position.direction_to(player.global_position) * run_speed
	velocity = move_and_slide(velocity)


func handle_hit():
	health_stat.health -= 20
	if health_stat.health <= 0:
		queue_free()
