extends Enemy
class_name MovingEnemy

@export var speed : float
@export var damage_on_contace : float
@export var target : Player 

@export var explode_distance : float

func die():
	queue_free()

func explode():
	die()
	target.damage()

func _process(delta):
	if !target:
		return
	if target == null:
		return
	var dir = target.global_position-global_position
	
	if dir.length() <= explode_distance:
		explode()

	global_position += dir.normalized()*speed*delta
