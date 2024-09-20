extends CharacterBody2D

var speed = -50
var facing_right: bool = false
var state: String = "walking"  # States: "walking" or "attacking"
var attack_duration = 1.0  # Time to stay in attack mode
var is_attacking = false  # To prevent multiple attacks

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_timer: Timer = $AttackTimer

# Player and wall collision groups
const GROUP_WALL = "walls"
const GROUP_PLAYER = "players"

func _ready():
	# Ensure the attack timer is connected to the timeout function
	attack_timer.connect("timeout", Callable(self, "_on_attack_timer_timeout"))

func _physics_process(delta: float) -> void:
	if state == "walking":
		
		# Gravity
		if not is_on_floor():
			velocity += get_gravity() * delta
		
		# Handle movement and collision
		if ray_cast_left.is_colliding() or ray_cast_right.is_colliding():
			var collider = ray_cast_left.get_collider() if ray_cast_left.is_colliding() else ray_cast_right.get_collider()

			# If the collider is a wall, flip direction
			if collider.is_in_group(GROUP_WALL):
				flip()
			# If the collider is a player, stop and attack
			elif collider.is_in_group(GROUP_PLAYER) and not is_attacking:
				start_attack()
				
		# Update velocity and move
		velocity.x = speed
		move_and_slide()
		
	elif state == "attacking":
		# The enemy is in attack mode, stop moving
		velocity.x = 0
		move_and_slide()

func flip():
	facing_right = !facing_right
	if facing_right == true:
		animated_sprite_2d.flip_h = true
		speed = 50
	elif facing_right == false:
		animated_sprite_2d.flip_h = false
		speed = -50

func start_attack():
	# Switch to attacking state
	state = "attacking"
	animated_sprite_2d.play("attack")  # Optionally play attack animation
	is_attacking = true  # Lock further attacks
	
	# Only start the attack timer if it is not already running
	if attack_timer.is_stopped():
		attack_timer.start(attack_duration)
		print("attack started")

func _on_attack_timer_timeout() -> void:
	# Attack is over, go back to walking
	state = "walking"
	is_attacking = false  # Unlock attacking again
	animated_sprite_2d.play("walk")  # Optionally switch back to walking animation
	print("attack finished")
