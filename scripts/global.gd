extends Node

signal change_life
signal change_score

var score := 0
var lifes := 3

func _ready() -> void:
	# audio_stream_player.play()
	pass

func reset_life() -> void:
	lifes = 300

func change_score_(number: int) -> void:
	score += number
	emit_signal("change_score")
