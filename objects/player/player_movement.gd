extends CharacterBody2D
class_name PlayerMovement

@export var speed : float 


var dir: Vector2 = Vector2(0, 0)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		dir.x -= 1
	if event.is_action_released("left"):
		dir.x += 1
	if event.is_action_pressed("right"):
		dir.x += 1
	if event.is_action_released("right"):
		dir.x -= 1

	if event.is_action_pressed("up"):
		dir.y -= 1
	if event.is_action_released("up"):
		dir.y += 1
	if event.is_action_pressed("down"):
		dir.y += 1
	if event.is_action_released("down"):
		dir.y -= 1

func _physics_process(_delta):
	
	velocity = dir*speed
	move_and_slide()