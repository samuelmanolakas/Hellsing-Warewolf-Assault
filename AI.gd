extends Node2D

signal state_changed(new_state)

enum State {
	PATROl,
	ENGAGE
}

onready var player_detection_zone = $PlayerDetectionZone

var current_state: int = State.PATROl setget set_state
onready var player = get_node("res://Player.tscn")
var actor = null

func _process(delta):
	match current_state:
		State.PATROl:
			pass
		State.ENGAGE:
			if player != null:
				actor.rotation = actor.global_position.direction_to(player.global_position).angle()
			else:
				print("In the engage state but no player")
		_:
			print("Error: found a state for our enemy that should not exist")

func initialize(actor):
	self.actor = actor

func set_state(new_state: int):
	if new_state == current_state:
		return
	
	current_state = new_state
	emit_signal("state_changed", current_state)


func _on_PlayerDetectionZone_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		set_state(State.ENGAGE)
		player = body
