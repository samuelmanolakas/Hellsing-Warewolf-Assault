extends KinematicBody2D


export (PackedScene) var Bullet

onready var end_of_gun = $EndOfGun

const MOVE_SPEED = 300
 
onready var raycast = $RayCast2D
 
func _ready():
	yield(get_tree(), "idle_frame")
	get_tree().call_group("zombies", "set_player", self)
 
func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * MOVE_SPEED * delta)
 
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)
 
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		shoot()

func shoot():
	var bullet_instance = Bullet.instance()
	bullet_instance.global_position = end_of_gun.global_postion
	var target = get_global_mouse_position()
	var direction_to_mouse = bullet_instance.global_postion.direction_to(target).nomalized
	bullet_instance.set_direction(	direction_to_mouse)
	emit_signal("player_fired_bullet", bullet_instance)
