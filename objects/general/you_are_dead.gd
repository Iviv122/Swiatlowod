extends CanvasLayer 
class_name YouAreDead

@export var player : Player

func appear():
	show()

func _ready():
	hide()
	player.death.connect(appear)
