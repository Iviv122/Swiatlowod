extends Node2D 
class_name GunHolder

@export var left_hand_pivot : Node2D
@export var right_hand_pivot : Node2D

@export var x_offset : float
@export var y_offset : float

var weapon_pos : Vector2

func _process(_delta):
    weapon_pos = (right_hand_pivot.global_position - left_hand_pivot.global_position)/2

    weapon_pos.x += x_offset
    weapon_pos.y += y_offset

# aim
# gun dir