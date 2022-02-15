extends Sprite

var frames = 0.0
var state = 0

func _ready():
	modulate.a = 0
	pass 

func _process(delta):
	if state == 0:
		if modulate.a < 1:
			modulate.a = (frames/120)
			frames += 1
	if state == 1:
		if modulate.a < 1:
			modulate.a = pow(frames/240, 2)
			frames += 1
	if state == 2:
		if modulate.a < 1:
			modulate.a = pow(frames/120, 3)
			frames += 1
	if state == 3:
		if modulate.a < 1:
			modulate.a = 1-(1-pow(frames/240, 2))*2
			frames += 1
	if state == 4:
		if modulate.a < 1:
			modulate.a = 1-pow(1-frames/120, 2)
			frames += 1
	print(frames)
