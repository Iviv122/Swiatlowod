extends ProgressBar
class_name EnemyHealthBar 

@export var player : Enemy 

func update():
    value = player.health

func _ready():
    min_value = 0
    max_value = player.health
    value = player.health

    player.damaged.connect(update)