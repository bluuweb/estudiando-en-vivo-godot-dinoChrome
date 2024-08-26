extends Node

# 1. Tutorial de godot
# 2. Background parallax, collision, music, ui, animation, user input

'''
IDEAS:
	1. que al chocar el enemigo con la bala, que se genere una animación,
	y quede muerto en el suelo... así se puede ver cuantos matamos
	2. que los enemigos se les diminuya la vida
	OK Mejorar el GUI _process -> estudiando signal
	OK Terminar de agregar signal para score
	OK Recorger monedas y ese es el score (score = coins)
	1. Idea loca: juego de zombies
	OK Cada x monedas (aumentamos la vida)
	OK Agregar sonidos de efectos, morir, recoger, etc
	4. Item que permita disparar por x segundos
	5. Item que le de protección tipo escudo (estrella de mario), así no le restan vidas por x segundos
	6. Item que te permita volar
	7. Que los enemigos aparezcan de forma aleatoria
	8. Posibilidad de elegir las mejoras al recoger un item
	9. Después de un tiempo, cambiar de nivel o cambiar de día o noche (que se haga la noche, cambiar background, enemigos, etc)
	10. Colocar un ave (enemigo), así aumenta la dificultad.
'''
	
@onready var parallax_2d: Parallax2D = $Parallax2D
@export var enemy_scene: PackedScene
@export var fruit_scene: PackedScene
@export var arm_scene: PackedScene

var velocityParallax := 100
#@export var initial_lifes = 3

func _ready() -> void:
	#Global.lifes = initial_lifes
	Global.score = 0
	create_enemy()
	Global.connect("create_arm_score", create_arm)

#var flag_arm = true
func _process(delta: float) -> void:
	parallax_2d.scroll_offset.x -= velocityParallax * delta
	
	## Cada 5 score aparece el arm
	#if Global.score != 0 and Global.score % 5 and flag_arm:
		#create_arm()
		#flag_arm = false

func _on_timer_velocity_timeout() -> void:
	# Después de terminar el tiempo se ejecuta este código
	# velocityParallax += 50
	pass

func _on_timer_enemy_timeout() -> void:
	create_enemy()
	
func create_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.position.x = 600
	enemy.position.y = 223
	add_child(enemy)
	# Global.score += 1

func create_arm():
	var arm = arm_scene.instantiate()
	arm.position.x = 600
	arm.position.y = 223
	add_child(arm)

func create_frut():
	var frut = fruit_scene.instantiate()
	frut.position.y = 142
	frut.position.x = 600
	
	# Alernativa #01
	#var second_random = randi_range(0, 5)
	#await get_tree().create_timer(second_random).timeout
	
	# Alernativa #02
	$TimerFrut.wait_time = randf_range(0.0, 5.0)
	
	add_child(frut)

func _on_timer_frut_timeout() -> void:
	create_frut()
