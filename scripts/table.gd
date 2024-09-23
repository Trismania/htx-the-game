extends Area2D

@onready var monster_counter: Control = get_node("/root/main/CanvasLayer/MonsterCounter")

func _on_body_entered(body: Node2D) -> void:
	if monster_counter.monsterAmount == 2:
		get_tree().change_scene_to_file("res://scenes/win_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
