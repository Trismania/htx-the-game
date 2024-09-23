extends Area2D

@onready var monster_counter: Control = get_node("/root/main/CanvasLayer/MonsterCounter")


func _on_body_entered(body: Node2D) -> void:
	monster_counter.monsterAmount += 1
	queue_free()
