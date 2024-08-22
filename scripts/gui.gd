extends CanvasLayer

@onready var life_label_number: Label = $Control/MarginContainer/HBoxContainer/LifeLabelNumber
@onready var score_label: Label = $Control/MarginContainer/HBoxContainer2/ScoreLabel

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	life_label_number.text = str(Global.lifes)
	score_label.text = "Score: " + str(Global.score)
