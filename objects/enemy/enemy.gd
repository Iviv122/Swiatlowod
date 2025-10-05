extends Area2D
class_name Enemy

@export var health : float

signal damaged()

func die():
    queue_free()

func damage(a : float):
    health -= a
    damaged.emit()
    if health <= 0:
        die()
