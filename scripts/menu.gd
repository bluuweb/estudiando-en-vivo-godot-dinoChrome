extends Control

func _ready() -> void:
	# Deja en focus el botón: grab_focus()
	$VBoxContainer/HBoxContainer/StartButton.grab_focus()
	if(Global.lifes <= 0):
		game_over()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_start_button_pressed() -> void:
	Global.reset_life()
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func game_over() -> void:
	$VBoxContainer/Title.text = "Game Over"
	$VBoxContainer/Description.text = "Perdiste, sigue intentandolo..."
	$VBoxContainer/HBoxContainer/StartButton.text = "Volver a intentar"
