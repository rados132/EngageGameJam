extends Node2D
var bullet_path = preload("res://character_body_2d.tscn")


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		fire()


func fire():
	var bullet = bullet_path.instantiate()
	bullet.direction = rotation
	bullet.pos = $Node2D.global_position
	bullet.rota = global_rotation
	get_parent().add_child(bullet)
