extends Sprite2D
class_name Head

@export var offset_move : float
@export var rotation_amplify : float
@export var move_speed : float

@export var pivot : Node2D

@export var left_head : Texture
@export var right_head : Texture

@export var hands : Hands

func _process(delta):


	global_position = global_position.move_toward(pivot.global_position +-hands.arms_dir.normalized()*offset_move,move_speed*delta) 
	
	rotation = lerp_angle(rotation,  hands.arms_dir.angle()-135,rotation_amplify*delta)
	#rotation =  lerp_angle(rotation,  dir.angle(),rotation_amplify*delta)
