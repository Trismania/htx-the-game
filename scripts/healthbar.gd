extends Control

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var health = 4

func get_hurt():
	if health == 4:
		health -= 1
		animated_sprite_2d.play("three")
	if health == 3:
		health -= 1
		animated_sprite_2d.play("two")
	if health == 2:
		health -= 1
		animated_sprite_2d.play("one")
