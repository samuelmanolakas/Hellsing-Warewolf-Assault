extends Area2D

export (int) var speed = 10

var direction := Vector2.ZERO


onready var kill_timer = $KillTimer


func _ready():
	kill_timer.start()
	set_direction(direction)


func _process(delta):
	var top = get_node("Top")
	var middle_top = get_node("MiddleTop")
	var bottom = get_node("Bottom")
	var middle_bottom = get_node("MiddleBottom")
	if(top):
		top.position -= Vector2(0,5)
	if(middle_top):
		middle_top.position -= Vector2(0,2.5)
	if(bottom):
		bottom.position += Vector2(0,5)
	if(middle_bottom):
		middle_bottom.position += Vector2(0,2.5)


func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity


func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()


func _on_Timer_timeout():
	queue_free()
