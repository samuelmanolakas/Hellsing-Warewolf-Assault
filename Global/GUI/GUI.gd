extends CanvasLayer


onready var health_bar = $MarginContainer/Rows/BottomRow/HealthBar


func set_new_health_value(new_health: int):
	get_node("../Health").connect("player_health_changed", self, "set_new_health_value")
	health_bar.value = new_health
	pass
