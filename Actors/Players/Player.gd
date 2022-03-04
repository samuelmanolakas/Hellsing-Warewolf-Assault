extends KinematicBody2D


signal player_fired_bullet(bullet, position, direction)



export (PackedScene) var Bullet
export (int) var speed = 200


onready var end_of_gun = $EndOfGun
onready var gun_direction = $GunDirection
onready var health_stat = $Health
onready var gui = $GUI
onready var player_animation = $Torso/AnimationPlayer
onready var attack_cooldown = $Attackcooldown

func _ready():
	gui.set_new_health_value(self.health_stat.health)
	$AudioStreamPlayer2
	pass # Replace with function body.




func _physics_process(delta: float) -> void:
	var movement_direction := Vector2.ZERO

	if Input.is_action_pressed("up"):
		movement_direction.y = -1
	if Input.is_action_pressed("down"):
		movement_direction.y = 1
	if Input.is_action_pressed("left"):
		movement_direction.x = -1
	if Input.is_action_pressed("right"):
		movement_direction.x = 1

	movement_direction = movement_direction.normalized()
	move_and_slide(movement_direction * speed)

	look_at(get_global_mouse_position())
	_input(self)

func _input(event):
	if Input.is_action_pressed("shoot"):
		#player_animation.play("Idle")
		pass
	else:
		#player_animation.stop()
		pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		shoot()
	

func shoot():
	if attack_cooldown.is_stopped():
		var bullet_instance = Bullet.instance()
		var direction = (gun_direction.global_position - end_of_gun.global_position).normalized()
		emit_signal("player_fired_bullet", bullet_instance, end_of_gun.global_position, direction)
		$AudioStreamPlayer.play()
		attack_cooldown.start()



func handle_hit():
	health_stat.health -= 20
	print("player Hit!", health_stat.health)
