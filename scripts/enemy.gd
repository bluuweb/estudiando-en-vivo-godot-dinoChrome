extends Area2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var win_enemy_flag := false
var speed := 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("run")
	$AnimatedSprite2D.flip_h = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta

# Aquí el enemigo choca con el Player
func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player_group")):
		win_enemy_flag = true
		Global.lifes -= 1
		Global.emit_signal("change_life")
		
		# Efecto de audio
		audio_stream_player.play()
		
		body.death_animation()
		$AnimatedSprite2D.play("hit")
		
		if(Global.lifes <= 0):
			get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# print("salió de la pantalla")
	if !win_enemy_flag:
		# esto en el caso de que quieran aumentar el score si el enemigo desaparece del mapa
		#Global.score += 1
		#Global.emit_signal("change_score")
		pass
	queue_free()
