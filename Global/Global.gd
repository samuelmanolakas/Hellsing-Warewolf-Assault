extends Node

var score = 0

var wave_count = 0
var wave_num = 0


func _wave_counter():
	wave_count += 1
	if wave_count == 10:
		wave_num += 1

func reset():
	wave_count = 0
