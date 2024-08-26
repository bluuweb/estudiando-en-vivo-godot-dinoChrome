extends Node

signal change_life
signal change_score
signal create_arm_score

var score := 0
var lifes := 3

func _ready() -> void:
	# audio_stream_player.play()
	pass

func reset_life() -> void:
	lifes = 3

func change_score_(number: int) -> void:
	score += number
	
	# Cada 5 score se aumenta una vida y crea un arm
	if score != 0 and score % 5 == 0:
		lifes += 1
		emit_signal("change_life")
		emit_signal("create_arm_score")
		
	emit_signal("change_score")
