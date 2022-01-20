extends KinematicBody2D

var run_speed = 140
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


func hit():
	$AttackDetector.monitoring = true

func end_of_hit():
	$AttackDetector.monitoring = false



func _on_PlayerDetector_body_entered(body):
	print("colliding with player")
	if body.name == "player":
		body.health -= 20
		body.position += Vector2(100,0)
	pass # Replace with function body.


func _on_AttackDetector_body_entered(body):
	print("attacking")
	pass # Replace with function body.
