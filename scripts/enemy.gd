extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("run")
	$AnimatedSprite2D.flip_h = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 4

func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player_group")):
		Global.lifes -= 1
		body.death_animation()
		$AnimatedSprite2D.play("hit")
		# TODO: cambiar el label del GUI (para no actualizarlo en el _process)
		
		# TODO: si las vidas son 0 cambiar de escena:
		if(Global.lifes <= 0):
			get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# print("salió de la pantalla")
	Global.score += 1
	queue_free()
