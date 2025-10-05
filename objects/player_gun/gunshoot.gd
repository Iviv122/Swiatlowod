extends Node2D
class_name GunShoot


@export var color : Color
@export var shoot_line_time : float
@export var width : float = 2

@export var current_gun : Gun

@export var shooting_muzzle_x : float

var reload_time = 1
var is_shooting = false

@export var shoot_effect : GPUParticles2D
@export var ammo_used_effect : PackedScene 
@export var ammo_pivot : Node2D

signal shotted()

# shooting itself
func shoot():
	var shoot_line = Line2D.new()

	shoot_line.default_color = color   
	shoot_line.width = width 

	var base = transform.x*shooting_muzzle_x
	
	## raycast here

	var space_rid = get_world_2d().space
	var space_state = PhysicsServer2D.space_get_direct_state(space_rid)    

	var shoot_dir = (global_transform.x*1500).rotated(deg_to_rad(randf_range(-current_gun.spread_angle,current_gun.spread_angle)))

	var query = PhysicsRayQueryParameters2D.create(base+global_position,shoot_dir+global_position)
	query.collide_with_areas = true
	query.collide_with_bodies = true
	var result = space_state.intersect_ray(query)

	## result here
	
	shoot_line.add_point(base+global_position)
	if result:
		if result.collider is Enemy:
			result.collider.damage(current_gun.damage)
		shoot_line.add_point(result.position)
	else:
		shoot_line.add_point(shoot_dir)

	get_tree().root.get_child(0).add_child(shoot_line)
	await get_tree().create_timer(shoot_line_time).timeout
	shoot_line.queue_free()

func _process(delta):
	reload_time -= delta*current_gun.attack_speed
	if is_shooting and reload_time <= 0:
		
		shotted.emit()
		
		var effect : DieEffect = ammo_used_effect.instantiate()
		effect.global_position = ammo_pivot.global_position 
		effect.rotation = rotation
		effect.restart()
		get_tree().root.get_child(0).add_child(effect)
		
		shoot()
		reload_time = 1

func _input(event):
	if event.is_action_pressed("left_mouse"):
		is_shooting = true
	if event.is_action_released("left_mouse"):
		is_shooting = false 
