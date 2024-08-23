extends Area2D

var score_frut := 1
var speed := 300
@onready var audio_frut: AudioStreamPlayer = $AudioFrut

func _ready() -> void:
	$AnimatedSprite2D.play("idle_banana")

func _process(delta: float) -> void:
	position.x -= speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player_group"):
		Global.change_score_(score_frut)
		audio_frut.play()
		$AnimatedSprite2D.hide()
		await get_tree().create_timer(0.75).timeout
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
