extends Sprite2D
class_name TorsoMovement

@export var pivot : Node2D
@export var move_angle : float
@export var speed : float
@export var rotate_speed : float
@export var idle_move : float

@export var player_movement : PlayerMovement

var init_scale : float

func _ready():
	init_scale = scale.x

func _process(delta):
	rotation_degrees =  lerp(rotation_degrees,  move_angle*player_movement.dir.x, rotate_speed*delta) 
	global_position = global_position.move_toward(pivot.global_position,speed*delta) 
