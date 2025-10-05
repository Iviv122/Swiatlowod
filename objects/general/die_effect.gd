extends GPUParticles2D
class_name DieEffect

func _ready():
    await get_tree().create_timer(lifetime).timeout
    queue_free()