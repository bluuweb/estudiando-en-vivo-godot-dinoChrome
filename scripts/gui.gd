extends CanvasLayer

@onready var life_label_number: Label = $Control/MarginContainer/HBoxContainer/LifeLabelNumber
@onready var score_label: Label = $Control/MarginContainer/HBoxContainer2/ScoreLabel


func _ready() -> void:
	_on_change_text_lifes()
	Global.change_life.connect(_on_change_text_lifes)
	Global.change_score.connect(_on_change_text_score)

func _process(delta: float) -> void:
	# life_label_number.text = str(Global.lifes)
	# score_label.text = "Score: " + str(Global.score)
	pass

func _on_change_text_lifes() -> void:
	life_label_number.text = str(Global.lifes)
	
func _on_change_text_score() -> void:
	score_label.text = "Score: " + str(Global.score)
