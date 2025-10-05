extends Node
class_name GameManager

@export var StartScene : PackedScene

func _ready():
	add_to_group("load_scene")
	add_child(StartScene.instantiate())

func load_scene(scene : PackedScene):
	for i in get_children():
		i.queue_free()

	add_child(scene.instantiate())
