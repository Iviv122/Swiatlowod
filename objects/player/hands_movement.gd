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

var x1 : float
var x2 : float 

func _ready():
    x1 = randf_range(-2,2)+ randf_range(-2,2)
    x2 = randf_range(-2,2) + randf_range(-2,2) + x1


func _process(delta):

    var ldir = left_hand_pivot.global_position - left_hand.global_position
    var ll = ldir.length()

    if ll > max_offset:
        left_hand.global_position = left_hand.global_position.move_toward(left_hand_pivot.global_position,move_speed)
    else:
        left_hand.global_position = left_hand.global_position.move_toward(left_hand_pivot.global_position + Vector2(sin(x1),cos(x1))*offset,move_speed/2)

    right_hand.global_position = right_hand_pivot.global_position.move_toward(right_hand_pivot.global_position + Vector2(sin(x2),cos(x2))*offset,move_speed)

    left_hand.rotation_degrees = cos(x1)*hand_rot
    right_hand.rotation_degrees = sin(x2)*hand_rot

    x1 += delta*speed 
    x2 += delta*speed

