extends Label


func _ready() -> void:
	$Tween.interpolate_property(
		self, "precent_visible",
		0.0, 1.0, 3.0, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	$Tween.start() 
