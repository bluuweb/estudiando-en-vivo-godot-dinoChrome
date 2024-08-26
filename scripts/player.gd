extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#@export var bullet_scene: PackedScene

#load(): Carga el recurso en tiempo de ejecución. Esto significa que la carga ocurre cuando se llama a la función, lo que puede causar demoras o congelamientos si se realiza durante momentos críticos, como la actualización de fotogramas.
#preload(): Carga el recurso antes de que se ejecute el código. Se usa para cargar recursos en tiempo de carga, lo que ayuda a evitar demoras durante la ejecución del juego. preload() es generalmente más seguro y eficiente para recursos que sabes que se necesitarán.
var bullet_scene := preload("res://scenes/bullet.tscn")

func _ready() -> void:
	animated_sprite_2d.play("run")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		animated_sprite_2d.play("run")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func death_animation() -> void:
	$DeathAnimation.play("death")
	

func shooting():
	$TimerBullet.start()
	await get_tree().create_timer(5).timeout
	$TimerBullet.stop()

func _on_timer_bullet_timeout() -> void:
	if bullet_scene:
		var bullet = bullet_scene.instantiate()
		bullet.global_position = self.global_position
		get_tree().root.add_child(bullet)
