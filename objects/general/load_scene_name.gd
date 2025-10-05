extends Button
class_name LoadSceneName 

@export var scene_name : String 

func load_scene() -> void:
	get_tree().call_group("load_scene","load_scene",load(scene_name))

func _pressed() -> void:
	load_scene()
