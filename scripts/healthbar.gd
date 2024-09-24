extends Control

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var health = 4

func get_hurt():
	if health == 4:
		health -= 1
		animated_sprite_2d.play("three")
		print("I now have 3 hearts")
	if health == 3:
		health -= 1
		animated_sprite_2d.play("two")
		print("I now have 2 hearts")
	if health == 2:
		health -= 1
		animated_sprite_2d.play("one")
		print("I now have 1 hearts")
