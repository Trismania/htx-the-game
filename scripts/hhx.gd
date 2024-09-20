extends CharacterBody2D

var speed = -50
var facing_right:bool = false

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if ray_cast_left.is_colliding() or ray_cast_right.is_colliding():
		flip()
	
	velocity.x = speed
	
	move_and_slide()


func flip():
	facing_right = !facing_right
	if facing_right == true:
		animated_sprite_2d.flip_h = true
		speed = 50
	elif facing_right == false:
		animated_sprite_2d.flip_h = false
		speed = -50
	
