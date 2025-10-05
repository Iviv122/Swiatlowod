extends ProgressBar
class_name PlayerHealthBar

@export var player : Player

func update():
	value = player.health

func _ready():
	min_value = 0
	max_value = player.health
	value = player.health

	player.damaged.connect(update)
