extends Control

var monsterAmount = 0


@onready var label: Label = $Label

func _process(delta: float) -> void:
	label.text = str(monsterAmount) + "/2"  # Convert the number to a string before assigning it to the label's text
