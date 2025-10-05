extends Button
class_name LoadScene 

@export var scene : PackedScene

func load_scene() -> void:
	get_tree().call_group("load_scene","load_scene",scene)

func _pressed() -> void:
	load_scene()
