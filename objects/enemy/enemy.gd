extends Area2D
class_name Enemy

@export var health : float

func die():
    queue_free()

func damage(a : float):
    health -= a
    if health <= 0:
        die()
