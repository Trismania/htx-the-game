extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = 0
	if Input.is_action_pressed("move_left"):
		direction = -1
		velocity.x = direction * SPEED
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("run")
		
	elif Input.is_action_pressed("move_right"):
		direction = 1
		velocity.x = direction * SPEED
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("run")
	else:
		direction = 0
		velocity.x = direction * SPEED
		animated_sprite_2d.play("idle")

	move_and_slide()
