extends Node2D 
class_name GunHolder

@export var left_hand_pivot : Node2D
@export var right_hand_pivot : Node2D

@export var x_offset : float
@export var y_offset : float

@export var gun : Sprite2D

var weapon_pos : Vector2

func _process(_delta):
	weapon_pos = (right_hand_pivot.position - left_hand_pivot.position)/2

	#gun.rotation = rotate_toward(gun.rotation,weapon_pos.angle(),1)

	gun.rotation = weapon_pos.angle() 

	weapon_pos.x += x_offset
	weapon_pos.y += y_offset

	gun.global_position = global_position+weapon_pos
