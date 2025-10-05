extends Enemy
class_name MovingEnemy

@export var speed : float
@export var damage_on_contace : float
@export var target : Node2D 

@export var explode_distance : float

func die():
	queue_free()

func explode():
	die()

func _process(delta):
	var dir = target.global_position-global_position
	
	if dir.length() <= explode_distance:
		explode()

	global_position += dir.normalized()*speed*delta
