extends Sprite2D
class_name GunSprite

@export var pivot : Node2D
@export var speed  :float
@export var rotate_speed : float
@export var posy_on_shot : float
@export var rotate_on_shot : float
@export var gun_point : GunShoot
@export var max_offset : float

func _ready():
	gun_point.shotted.connect(on_shot)    

func on_shot():
	global_position.x -= posy_on_shot
	global_position.y -= posy_on_shot
	rotation -= deg_to_rad(gun_point.current_gun.angle_on_shot) 

func _process(delta):
	var dir = get_global_mouse_position()-global_position
	var l = dir.length()

	if l >max_offset*max_offset:
		global_position = global_position.move_toward(pivot.global_position,speed*speed*delta*2)
	elif l >max_offset:
		global_position = global_position.move_toward(pivot.global_position,speed*delta*2)
	else:
		global_position = global_position.move_toward(pivot.global_position,delta*speed/2)

	rotation = rotate_toward(rotation,dir.angle(),rotate_speed*delta)
	rotation += pivot.rotation
