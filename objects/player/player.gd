extends Node2D
class_name Player

signal death()
signal damaged()

@export var health :float = 10 
@export var player_root : Node

func die():
    death.emit()
    player_root.queue_free()

func damage():
    health-=1
    damaged.emit()
    if health <= 0:
        die()


func _ready():
    pass