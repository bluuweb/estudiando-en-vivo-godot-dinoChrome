extends Area2D

signal get_arm
var speed := 300

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.x -= speed * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		emit_signal("get_arm")
		body.shooting()
		queue_free()
