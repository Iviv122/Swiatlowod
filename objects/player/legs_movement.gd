extends Node2D
class_name Legs


@export var left_leg_pivot : Node2D
@export var right_leg_pivot : Node2D
@export var left_leg : Sprite2D
@export var right_leg : Sprite2D

@export var speed : float

@export var max_offset : float

@export var player_movement : PlayerMovement 

func _process(delta):
    left_leg.global_position = left_leg.global_position.move_toward(left_leg_pivot.global_position,speed*delta)
    right_leg.global_position = right_leg.global_position.move_toward(right_leg_pivot.global_position,speed*delta)