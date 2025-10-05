extends Node2D
class_name Legs


@export var left_leg_pivot : Node2D
@export var right_leg_pivot : Node2D
@export var left_leg : Sprite2D
@export var right_leg : Sprite2D
@export var speed : float
@export var walk_height : float
@export var move_speed : float
@export var leg_rotation : float
@export var leg_rotation_speed : float

@export var player_movement : PlayerMovement 

var right_left_moving = true 

var x = 0

func _process(delta):
	if player_movement.dir == Vector2.ZERO:
		left_leg.global_position = left_leg.global_position.move_toward(left_leg_pivot.global_position,speed*delta)
		right_leg.global_position = right_leg.global_position.move_toward(right_leg_pivot.global_position,speed*delta)

		left_leg.rotation_degrees = 0
		right_leg.rotation_degrees = 0
		x = 0
	else:
		x += delta*move_speed
		if player_movement.dir.x > 0: 
			# -abs(sin(x))*walt_hight ig
			# start from left some how
			# if substruct some pi it should be fine???

			left_leg.global_position = left_leg_pivot.global_position+Vector2(0,-abs(sin(x)))*walk_height
			right_leg.global_position = right_leg_pivot.global_position+Vector2(0,-abs(cos(x)))*walk_height

			left_leg.rotation_degrees = sin(x*leg_rotation_speed)*leg_rotation
			right_leg.rotation_degrees = cos(x*leg_rotation_speed)*leg_rotation

		else:
			left_leg.global_position = left_leg_pivot.global_position+Vector2(0,-abs(cos(x)))*walk_height
			right_leg.global_position = right_leg_pivot.global_position+Vector2(0,-abs(sin(x)))*walk_height

			left_leg.rotation_degrees = cos(x*leg_rotation_speed)*leg_rotation
			right_leg.rotation_degrees = sin(x*leg_rotation_speed)*leg_rotation
