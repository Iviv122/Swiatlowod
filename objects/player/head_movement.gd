extends Sprite2D
class_name Head

@export var offset_move : float
@export var rotation_amplify : float
@export var move_speed : float

@export var pivot : Node2D

@export var left_head : Texture
@export var right_head : Texture

func _process(delta):

	var dir = get_global_mouse_position() - pivot.global_position
	var l = dir.length()
	var norm = dir.normalized() 

	if l > offset_move:
		l = offset_move

	global_position = global_position.move_toward(pivot.global_position +norm * l,move_speed*delta) 
	rotation =  lerp_angle(rotation,  dir.angle(),rotation_amplify*delta)
