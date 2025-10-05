extends Node2D
class_name Hands

@export var speed : float
@export var move_speed : float
@export var offset  : float
@export var max_offset  : float

@export var hand_rot : float

@export var left_hand_pivot : Node2D
@export var right_hand_pivot : Node2D

## for unarmed :C
@export var left_hand : Node2D
@export var right_hand : Node2D

@export var right_hand_move : float
@export var right_hand_move_on_shot: float

@export var min_right_y: float
@export var max_right_y: float

@export var weapon : GunShoot

var x1 : float
var x2 : float 

var arms_dir 

func _ready():
	x1 = randf_range(-2,2)+ randf_range(-2,2)
	x2 = randf_range(-2,2) + randf_range(-2,2) + x1

	weapon.shotted.connect(on_shot)	

func on_shot():
	right_hand.position.y -= right_hand_move_on_shot
	print(right_hand.position.y)
	right_hand.position.y = clampf(right_hand.global_position.y,-min_right_y,max_right_y)

func _process(delta):

	var ldir = left_hand_pivot.global_position - left_hand.global_position
	var ll = ldir.length()


	var mouse_dir = get_global_mouse_position()-global_position

	if ll > max_offset:
		left_hand.global_position = left_hand.global_position.move_toward(left_hand_pivot.global_position,move_speed*delta)
	else:
		left_hand.global_position = left_hand.global_position.move_toward(left_hand_pivot.global_position + Vector2(sin(x1),cos(x1))*offset,move_speed/2*delta)

	right_hand.global_position = right_hand.global_position.move_toward(right_hand_pivot.global_position+mouse_dir.normalized()*Vector2(0,right_hand_move),move_speed*delta)
	
	arms_dir = left_hand.global_position-right_hand.global_position

	left_hand.rotation_degrees = rad_to_deg(arms_dir.angle())-180 
	right_hand.rotation = arms_dir.angle() 

	x1 += delta*speed 
	x2 += delta*speed
