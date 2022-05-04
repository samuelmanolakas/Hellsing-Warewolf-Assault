extends KinematicBody2D


signal player_fired_bullet(bullet, position, direction)



export (PackedScene) var Bullet
export (int) var speed = 500


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


export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		rotation_dir += 1
	if Input.is_action_pressed("left"):
		rotation_dir -= 1
	if Input.is_action_pressed("down"):
		velocity = Vector2(-speed, 0).rotated(rotation)
		$AudioStreamPlayer2.play()
	if Input.is_action_pressed("up"):
		velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)



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
		bullet_instance.global_position = end_of_gun.global_position
		bullet_instance.direction = direction
		get_parent().add_child(bullet_instance)
		#emit_signal("player_fired_bullet", bullet_instance, end_of_gun.global_position, direction)
		$AudioStreamPlayer.play()
		attack_cooldown.start()



func handle_hit():
	health_stat.health -= 20
	print("player Hit!", health_stat.health)
